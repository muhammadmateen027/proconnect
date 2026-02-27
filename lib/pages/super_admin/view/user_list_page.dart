import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/pro_connect_layout.dart';
import 'package:proconnect/core/widgets/user_card_widget.dart';
import 'package:proconnect/domain/models/app_user.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/pages/super_admin/bloc/user_management/user_management_bloc.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserManagementBloc>().add(
      const UserManagementEvent.loadUsers(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final fullName = authState.maybeWhen(
          authenticated: (user) => user.fullName,
          orElse: () => '',
        );

        return ProConnectLayout(
          useGlass: false,
          useScrolling: false,
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.userManagement,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(fullName),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.push(AppRoutes.createUser),
            child: const Icon(Icons.add),
          ),
          child: BlocBuilder<UserManagementBloc, UserManagementState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                success: () {
                  // This should not happen in this screen, but we can reload the users
                  // just in case.
                  context.read<UserManagementBloc>().add(
                    const UserManagementEvent.loadUsers(),
                  );
                  return const Center(child: CircularProgressIndicator());
                },
                loaded: (users) {
                  if (users.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.people_outline_rounded,
                            size: 80,
                            color: theme.colorScheme.outline.withValues(alpha: 0.5),
                          ),
                          AppSpacing.gapH24,
                          Text(
                            l10n.noUsersFound,
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return UserCardWidget(
                        user: user,
                        onEdit: () {
                          // TODO: Navigate to edit user page
                        },
                        onDelete: () => _showDeleteConfirmation(context, user),
                      );
                    },
                  );
                },
                failure: (message) =>
                    Center(child: Text(l10n.errorPrefix + message)),
              );
            },
          ),
        );
      },
    );
  }

  void _showDeleteConfirmation(BuildContext context, AppUser user) {
    final l10n = context.l10n;
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(l10n.deleteUser),
          content: Text(l10n.deleteUserConfirmation),
          actions: <Widget>[
            TextButton(
              child: Text(l10n.cancel),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: Text(l10n.delete),
              onPressed: () {
                context.read<UserManagementBloc>().add(
                  UserManagementEvent.adminDeleteUser(uid: user.uid),
                );
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
