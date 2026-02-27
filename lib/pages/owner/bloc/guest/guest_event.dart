import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/guest_invitation.dart';

part 'guest_event.freezed.dart';

@freezed
class GuestEvent with _$GuestEvent {
  const factory GuestEvent.loadInvitations(String ownerId) = _LoadInvitations;
  const factory GuestEvent.invitationsUpdated(
    List<GuestInvitation> invitations,
  ) = _InvitationsUpdated;
  const factory GuestEvent.createInvitation(GuestInvitation invitation) =
      _CreateInvitation;
  const factory GuestEvent.updateInvitation(GuestInvitation invitation) =
      _UpdateInvitation;
}
