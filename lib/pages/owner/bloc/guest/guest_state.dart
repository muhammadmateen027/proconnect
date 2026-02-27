import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/guest_invitation.dart';

part 'guest_state.freezed.dart';

@freezed
class GuestState with _$GuestState {
  const factory GuestState.initial() = _Initial;
  const factory GuestState.loading() = _Loading;
  const factory GuestState.loaded(List<GuestInvitation> invitations) = _Loaded;
  const factory GuestState.error(String message) = _Error;
}
