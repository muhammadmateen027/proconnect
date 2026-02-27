import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proconnect/domain/models/guest_invitation.dart';

abstract class GuestInvitationRemoteDataSource {
  Stream<List<GuestInvitation>> getInvitationsByOwner(String ownerId);
  Future<void> createInvitation(GuestInvitation invitation);
  Future<void> updateInvitation(GuestInvitation invitation);
}

class GuestInvitationRemoteDataSourceImpl
    implements GuestInvitationRemoteDataSource {
  GuestInvitationRemoteDataSourceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  static const _collection = 'guest_invitations';

  @override
  Stream<List<GuestInvitation>> getInvitationsByOwner(String ownerId) {
    return _firestore
        .collection(_collection)
        .where('ownerId', isEqualTo: ownerId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => GuestInvitation.fromJson(doc.data()))
              .toList();
        });
  }

  @override
  Future<void> createInvitation(GuestInvitation invitation) async {
    await _firestore
        .collection(_collection)
        .doc(invitation.id)
        .set(invitation.toJson());
  }

  @override
  Future<void> updateInvitation(GuestInvitation invitation) async {
    await _firestore
        .collection(_collection)
        .doc(invitation.id)
        .update(invitation.toJson());
  }
}
