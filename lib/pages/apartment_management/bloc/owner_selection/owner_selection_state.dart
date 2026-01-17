import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/app_user.dart';

part 'owner_selection_state.freezed.dart';

@freezed
class OwnerSelectionState with _$OwnerSelectionState {
  const factory OwnerSelectionState.initial() = _Initial;
  const factory OwnerSelectionState.loading() = _Loading;
  const factory OwnerSelectionState.success({
    required List<AppUser> owners,
  }) = _Success;
  const factory OwnerSelectionState.failure({
    required String errorKey,
  }) = _Failure;
}
