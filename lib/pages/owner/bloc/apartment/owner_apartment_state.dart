import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/apartment.dart';

part 'owner_apartment_state.freezed.dart';

@freezed
class OwnerApartmentState with _$OwnerApartmentState {
  const factory OwnerApartmentState.initial() = _Initial;
  const factory OwnerApartmentState.loading() = _Loading;
  const factory OwnerApartmentState.loaded(List<Apartment> apartments) =
      _Loaded;
  const factory OwnerApartmentState.error(String message) = _Error;
}
