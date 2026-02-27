import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/glass_card.dart';
import 'package:proconnect/core/widgets/pro_connect_layout.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/pages/owner/bloc/guest/guest_bloc.dart';
import 'package:proconnect/pages/owner/bloc/guest/guest_event.dart';
import 'package:proconnect/pages/owner/bloc/guest/guest_state.dart';

class GuestInvitationListPage extends StatefulWidget {
  const GuestInvitationListPage({super.key});

  @override
  State<GuestInvitationListPage> createState() =>
      _GuestInvitationListPageState();
}

class _GuestInvitationListPageState extends State<GuestInvitationListPage> {
  @override
  void initState() {
    super.initState();
    final user = context.read<AuthBloc>().state.maybeWhen(
      authenticated: (user) => user,
      orElse: () => null,
    );
    if (user != null) {
      context.read<GuestBloc>().add(GuestEvent.loadInvitations(user.uid));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return ProConnectLayout(
      useGlass: false,
      useScrolling: false,
      appBar: AppBar(
        title: Text(l10n.guestHistory),
      ),
      child: BlocBuilder<GuestBloc, GuestState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48,
                    color: theme.colorScheme.error,
                  ),
                  AppSpacing.gapH16,
                  Text(message, textAlign: TextAlign.center),
                ],
              ),
            ),
            loaded: (invitations) {
              if (invitations.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history_outlined,
                        size: 80,
                        color: theme.colorScheme.primary.withValues(alpha: 0.3),
                      ),
                      AppSpacing.gapH24,
                      Text(
                        l10n.noInvitations,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                      AppSpacing.gapH8,
                      Text(
                        l10n.guestHistoryDescription,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.p16),
                itemCount: invitations.length,
                itemBuilder: (context, index) {
                  final invitation = invitations[index];
                  final isExpired = invitation.expiryDate.isBefore(
                    DateTime.now(),
                  );

                  return GlassCard(
                    margin: const EdgeInsets.symmetric(
                      vertical: AppSpacing.p8,
                      horizontal: 0,
                    ),
                    child: InkWell(
                      onTap: () {
                        context.push(
                          AppRoutes.editGuestInvitation,
                          extra: invitation,
                        );
                      },
                      borderRadius: BorderRadius.circular(24),
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.p16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSpacing.p16,
                                    vertical: AppSpacing.p8,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: isExpired
                                          ? [
                                              theme.colorScheme.error,
                                              theme
                                                  .colorScheme
                                                  .onErrorContainer,
                                            ]
                                          : [
                                              theme.colorScheme.primary,
                                              theme.colorScheme.secondary,
                                            ],
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            (isExpired
                                                    ? theme.colorScheme.error
                                                    : theme.colorScheme.primary)
                                                .withValues(alpha: 0.3),
                                        blurRadius: 12,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.person_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                AppSpacing.gapW16,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        invitation.guestName,
                                        style: theme.textTheme.titleLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      if (invitation.condoName != null ||
                                          invitation.apartmentNumber !=
                                              null) ...[
                                        AppSpacing.gapH4,
                                        Text(
                                          '${invitation.condoName ?? ''}${invitation.condoName != null && invitation.apartmentNumber != null ? ' - ' : ''}${invitation.apartmentNumber ?? ''}',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                color: theme
                                                    .colorScheme
                                                    .onSurface
                                                    .withValues(alpha: 0.6),
                                              ),
                                        ),
                                      ],
                                      AppSpacing.gapH4,
                                      _StatusChip(isExpired: isExpired),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  color: theme.colorScheme.onSurface.withValues(
                                    alpha: 0.3,
                                  ),
                                ),
                              ],
                            ),
                            if (invitation.purpose.isNotEmpty) ...[
                              AppSpacing.gapH16,
                              Text(
                                invitation.purpose,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurface.withValues(
                                    alpha: 0.7,
                                  ),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                            AppSpacing.gapH16,
                            Container(
                              height: 1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    theme.colorScheme.outlineVariant.withValues(
                                      alpha: 0,
                                    ),
                                    theme.colorScheme.outlineVariant.withValues(
                                      alpha: 0.5,
                                    ),
                                    theme.colorScheme.outlineVariant.withValues(
                                      alpha: 0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AppSpacing.gapH12,
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  size: 16,
                                  color: theme.colorScheme.primary,
                                ),
                                AppSpacing.gapW8,
                                Text(
                                  '${isExpired ? l10n.expired : l10n.active}: ',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: isExpired
                                        ? theme.colorScheme.error
                                        : theme.colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  DateFormat.yMMMd().add_Hm().format(
                                    invitation.expiryDate,
                                  ),
                                  style: theme.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(AppRoutes.createGuestInvitation),
        icon: const Icon(Icons.person_add_rounded),
        label: Text(l10n.inviteGuest),
        elevation: 4,
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.isExpired});
  final bool isExpired;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final color = isExpired
        ? theme.colorScheme.error
        : theme.colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Text(
        isExpired ? l10n.expired : l10n.active,
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
