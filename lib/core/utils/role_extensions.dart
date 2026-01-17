import 'package:proconnect/domain/models/app_user.dart';
import 'package:proconnect/l10n/l10n.dart';

extension UserRoleX on UserRole {
  String localizedName(AppLocalizations l10n) {
    switch (this) {
      case UserRole.super_admin:
        return l10n.roleSuperAdmin;
      case UserRole.agency_admin:
        return l10n.roleAgencyAdmin;
      case UserRole.guard:
        return l10n.roleGuard;
      case UserRole.owner:
        return l10n.roleOwner;
      case UserRole.tenant:
        return l10n.roleTenant;
    }
  }
}
