import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/domain/models/app_user.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/pages/admin/bloc/user_management/user_management_bloc.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    // Dummy data for now
    final users = [
      const AppUser(
        uid: '1',
        email: 'super@admin.com',
        fullName: 'Super Admin',
        role: UserRole.super_admin,
      ),
      const AppUser(
        uid: '2',
        email: 'agency@admin.com',
        fullName: 'Agency Admin',
        role: UserRole.agency_admin,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.manageAgenciesUsers),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.fullName),
            subtitle: Text(user.email),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: theme.colorScheme.primary),
                  onPressed: () {
                    // TODO: Navigate to edit user page
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: theme.colorScheme.error),
                  onPressed: () => _showDeleteConfirmation(context, user),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(AppRoutes.createUser),
        child: const Icon(Icons.add),
      ),
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
                context
                    .read<UserManagementBloc>()
                    .add(UserManagementEvent.adminDeleteUser(uid: user.uid));
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
