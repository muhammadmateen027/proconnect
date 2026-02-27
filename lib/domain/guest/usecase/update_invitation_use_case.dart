import 'package:proconnect/domain/guest/repository/guest_invitation_repository.dart';
import 'package:proconnect/domain/models/guest_invitation.dart';

class UpdateInvitationUseCase {
  final GuestInvitationRepository _repository;

  UpdateInvitationUseCase(this._repository);

  Future<void> call(GuestInvitation invitation) async {
    // Business logic: Ensure name is not empty
    if (invitation.guestName.trim().isEmpty) {
      throw ArgumentError('Guest name cannot be empty');
    }

    await _repository.updateInvitation(invitation);
  }
}
