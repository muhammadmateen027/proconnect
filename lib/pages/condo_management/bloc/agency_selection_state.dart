part of 'agency_selection_bloc.dart';

@freezed
class AgencySelectionState with _$AgencySelectionState {
  const factory AgencySelectionState.initial() = _Initial;
  const factory AgencySelectionState.loading() = _Loading;
  const factory AgencySelectionState.success({
    required List<AppUser> agencyAdmins,
  }) = _Success;
  const factory AgencySelectionState.failure({
    required String errorKey,
  }) = _Failure;
}
