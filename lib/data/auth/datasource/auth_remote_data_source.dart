import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:proconnect/domain/models/app_user.dart';

abstract class AuthRemoteDataSource {
  Stream<User?> get authStateChanges;

  Future<UserCredential> signIn({
    required String email,
    required String password,
  });

  Future<AppUser> getUserDetails(String uid);

  Future<void> signOut();

  Future<AppUser> signUp({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    required String condominiumId,
    required String agencyId,
  });

  Future<AppUser> createUserWithRole({
    required AppUser user,
    required String password,
  });

  Future<void> deleteUser(String uid);

  Future<void> updateUser(AppUser user);

  Future<List<AppUser>> getUsers();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
       _firestore = firestore ?? FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<AppUser> getUserDetails(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      return AppUser.fromJson(doc.data()!);
    } else {
      throw Exception('User details not found in Firestore.');
    }
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

  @override
  Future<AppUser> signUp({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    required String condominiumId,
    required String agencyId,
  }) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user;
    if (user == null) {
      throw Exception('User creation failed.');
    }

    final appUser = AppUser(
      uid: user.uid,
      email: email,
      fullName: fullName,
      role: role,
      condominiumId: condominiumId,
      agencyId: agencyId,
    );

    await _firestore.collection('users').doc(user.uid).set(appUser.toJson());

    return appUser;
  }

  @override
  Future<AppUser> createUserWithRole({
    required AppUser user,
    required String password,
  }) async {
    final appName = DateTime.now().millisecondsSinceEpoch.toString();
    final secondaryApp = await Firebase.initializeApp(
      name: appName,
      options: Firebase.app().options,
    );
    final secondaryAuth = FirebaseAuth.instanceFor(app: secondaryApp);

    try {
      final userCredential = await secondaryAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      final newUser = userCredential.user;
      if (newUser == null) {
        throw Exception('User creation failed.');
      }

      final appUser = AppUser(
        uid: newUser.uid,
        email: user.email,
        fullName: user.fullName,
        role: user.role,
        condominiumId: user.condominiumId,
        agencyId:
            (user.role == UserRole.agency_admin &&
                (user.agencyId == null || user.agencyId!.isEmpty))
            ? newUser.uid
            : user.agencyId,
      );

      await _firestore
          .collection('users')
          .doc(newUser.uid)
          .set(appUser.toJson());

      return appUser;
    } finally {
      await secondaryAuth.signOut();
      await secondaryApp.delete();
    }
  }

  @override
  Future<void> deleteUser(String uid) {
    return _firestore.collection('users').doc(uid).delete();
  }

  @override
  Future<void> updateUser(AppUser user) {
    return _firestore.collection('users').doc(user.uid).update(user.toJson());
  }

  @override
  Future<List<AppUser>> getUsers() async {
    final snapshot = await _firestore.collection('users').get();
    final users = <AppUser>[];
    for (final doc in snapshot.docs) {
      try {
        users.add(AppUser.fromJson(doc.data()));
      } catch (e) {
        // Skip users that fail to parse and log it
        debugPrint('Error parsing user ${doc.id}: $e');
      }
    }
    return users;
  }
}
