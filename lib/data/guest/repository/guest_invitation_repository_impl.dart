import 'package:proconnect/data/guest/datasource/guest_invitation_remote_data_source.dart';
import 'package:proconnect/domain/guest/repository/guest_invitation_repository.dart';
import 'package:proconnect/domain/models/guest_invitation.dart';

class GuestInvitationRepositoryImpl implements GuestInvitationRepository {
  GuestInvitationRepositoryImpl({
    required GuestInvitationRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final GuestInvitationRemoteDataSource _remoteDataSource;

  @override
  Stream<List<GuestInvitation>> getInvitationsByOwner(String ownerId) {
    return _remoteDataSource.getInvitationsByOwner(ownerId);
  }

  @override
  Future<void> createInvitation(GuestInvitation invitation) {
    return _remoteDataSource.createInvitation(invitation);
  }

  @override
  Future<void> updateInvitation(GuestInvitation invitation) {
    return _remoteDataSource.updateInvitation(invitation);
  }
}
