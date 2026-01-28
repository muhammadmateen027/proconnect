import 'package:proconnect/domain/guest/repository/guest_invitation_repository.dart';
import 'package:proconnect/domain/models/guest_invitation.dart';

class CreateInvitationUseCase {
  final GuestInvitationRepository _repository;

  CreateInvitationUseCase(this._repository);

  Future<void> call(GuestInvitation invitation) async {
    // Business logic: Ensure name is not empty
    if (invitation.guestName.trim().isEmpty) {
      throw ArgumentError('Guest name cannot be empty');
    }

    // Business logic: Ensure expiry date is in the future
    if (invitation.expiryDate.isBefore(DateTime.now())) {
      throw ArgumentError('Expiry date must be in the future');
    }

    await _repository.createInvitation(invitation);
  }
}
