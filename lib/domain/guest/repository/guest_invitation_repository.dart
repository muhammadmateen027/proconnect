import 'package:proconnect/domain/models/guest_invitation.dart';

abstract class GuestInvitationRepository {
  Stream<List<GuestInvitation>> getInvitationsByOwner(String ownerId);
  Future<void> createInvitation(GuestInvitation invitation);
  Future<void> updateInvitation(GuestInvitation invitation);
}
