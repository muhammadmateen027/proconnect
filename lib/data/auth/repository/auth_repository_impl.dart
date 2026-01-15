import 'package:proconnect/data/auth/datasource/auth_remote_data_source.dart';
import 'package:proconnect/domain/auth/repository/auth_repository.dart';
import 'package:proconnect/domain/models/app_user.dart';

class AuthRepositoryImpl implements AuthRepository {

  AuthRepositoryImpl(this._authRemoteDataSource);
  final AuthRemoteDataSource _authRemoteDataSource;

  @override
  Stream<AppUser?> get authStateChanges {
    return _authRemoteDataSource.authStateChanges.asyncExpand((user) {
      if (user == null) {
        return Stream.value(null);
      } else {
        return _authRemoteDataSource.getUserDetails(user.uid).asStream();
      }
    });
  }

  @override
  Future<AppUser> signIn({
    required String email,
    required String password,
  }) async {
    final userCredential = await _authRemoteDataSource.signIn(
      email: email,
      password: password,
    );
    return _authRemoteDataSource.getUserDetails(userCredential.user!.uid);
  }

  @override
  Future<void> signOut() {
    return _authRemoteDataSource.signOut();
  }

  @override
  Future<AppUser> signUp({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    required String siteId,
    required String orgId,
  }) {
    return _authRemoteDataSource.signUp(
      email: email,
      password: password,
      fullName: fullName,
      role: role,
      siteId: siteId,
      orgId: orgId,
    );
  }
}
