import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/glass_card.dart';
import 'package:proconnect/domain/models/guest_invitation.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GuestPassCard extends StatelessWidget {
  const GuestPassCard({
    required this.invitation,
    super.key,
  });

  final GuestInvitation invitation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return GlassCard(
      padding: const EdgeInsets.all(AppSpacing.p24),
      borderRadius: BorderRadius.circular(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.p16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: QrImageView(
              data: invitation.id,
              version: QrVersions.auto,
              size: 180,
              gapless: false,
              eyeStyle: const QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: Colors.black,
              ),
              dataModuleStyle: const QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.square,
                color: Colors.black,
              ),
            ),
          ),
          AppSpacing.gapH24,
          Text(
            invitation.guestName,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          if (invitation.condoName != null ||
              invitation.apartmentNumber != null) ...[
            AppSpacing.gapH8,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  size: 16,
                  color: theme.colorScheme.primary.withValues(alpha: 0.7),
                ),
                AppSpacing.gapW8,
                Flexible(
                  child: Text(
                    '${invitation.condoName ?? ''}${invitation.condoName != null && invitation.apartmentNumber != null ? ' - ' : ''}${invitation.apartmentNumber ?? ''}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
          AppSpacing.gapH16,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: theme.colorScheme.primary.withValues(alpha: 0.2),
              ),
            ),
            child: Column(
              children: [
                Text(
                  l10n.validUntil,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
                AppSpacing.gapH4,
                Text(
                  DateFormat.yMMMd().add_Hm().format(invitation.expiryDate),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
