import 'package:proconnect/domain/guest/repository/guest_invitation_repository.dart';
import 'package:proconnect/domain/models/guest_invitation.dart';

class GetInvitationsByOwnerUseCase {
  final GuestInvitationRepository _repository;

  GetInvitationsByOwnerUseCase(this._repository);

  Stream<List<GuestInvitation>> call(String ownerId) {
    if (ownerId.isEmpty) {
      throw ArgumentError('Owner ID cannot be empty');
    }
    return _repository.getInvitationsByOwner(ownerId);
  }
}
