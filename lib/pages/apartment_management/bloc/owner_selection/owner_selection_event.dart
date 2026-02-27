import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner_selection_event.freezed.dart';

@freezed
class OwnerSelectionEvent with _$OwnerSelectionEvent {
  const factory OwnerSelectionEvent.fetchOwners() = _FetchOwners;
}
