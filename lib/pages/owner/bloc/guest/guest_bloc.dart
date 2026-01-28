import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/domain/guest/usecase/create_invitation_use_case.dart';
import 'package:proconnect/domain/guest/usecase/get_invitations_by_owner_use_case.dart';
import 'package:proconnect/domain/guest/usecase/update_invitation_use_case.dart';
import 'package:proconnect/domain/models/guest_invitation.dart';
import 'package:proconnect/pages/owner/bloc/guest/guest_event.dart';
import 'package:proconnect/pages/owner/bloc/guest/guest_state.dart';

class GuestBloc extends Bloc<GuestEvent, GuestState> {
  GuestBloc({
    required GetInvitationsByOwnerUseCase getInvitationsByOwnerUseCase,
    required CreateInvitationUseCase createInvitationUseCase,
    required UpdateInvitationUseCase updateInvitationUseCase,
  }) : _getInvitationsByOwnerUseCase = getInvitationsByOwnerUseCase,
       _createInvitationUseCase = createInvitationUseCase,
       _updateInvitationUseCase = updateInvitationUseCase,
       super(const GuestState.initial()) {
    on<GuestEvent>((event, emit) async {
      await event.when(
        loadInvitations: (ownerId) => _onLoadInvitations(ownerId, emit),
        invitationsUpdated: (invitations) =>
            _onInvitationsUpdated(invitations, emit),
        createInvitation: (invitation) => _onCreateInvitation(invitation, emit),
        updateInvitation: (invitation) => _onUpdateInvitation(invitation, emit),
      );
    });
  }

  final GetInvitationsByOwnerUseCase _getInvitationsByOwnerUseCase;
  final CreateInvitationUseCase _createInvitationUseCase;
  final UpdateInvitationUseCase _updateInvitationUseCase;

  Future<void> _onLoadInvitations(
    String ownerId,
    Emitter<GuestState> emit,
  ) async {
    emit(const GuestState.loading());
    await emit.forEach<List<GuestInvitation>>(
      _getInvitationsByOwnerUseCase(ownerId),
      onData: GuestState.loaded,
      onError: (error, stackTrace) => GuestState.error(error.toString()),
    );
  }

  Future<void> _onInvitationsUpdated(
    List<GuestInvitation> invitations,
    Emitter<GuestState> emit,
  ) async {
    emit(GuestState.loaded(invitations));
  }

  Future<void> _onCreateInvitation(
    GuestInvitation invitation,
    Emitter<GuestState> emit,
  ) async {
    try {
      await _createInvitationUseCase(invitation);
    } catch (e) {
      emit(GuestState.error(e.toString()));
    }
  }

  Future<void> _onUpdateInvitation(
    GuestInvitation invitation,
    Emitter<GuestState> emit,
  ) async {
    try {
      await _updateInvitationUseCase(invitation);
    } catch (e) {
      emit(GuestState.error(e.toString()));
    }
  }
}
