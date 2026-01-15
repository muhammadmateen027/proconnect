import 'package:proconnect/domain/models/app_user.dart';

abstract class AuthRepository {
  Stream<AppUser?> get authStateChanges;
  Future<AppUser> signIn({required String email, required String password});
  Future<void> signOut();
  Future<AppUser> signUp({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    required String siteId,
    required String orgId,
  });
}
