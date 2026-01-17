part of 'agency_selection_bloc.dart';

@freezed
class AgencySelectionEvent with _$AgencySelectionEvent {
  const factory AgencySelectionEvent.fetchAgencyAdmins() = _FetchAgencyAdmins;
}
