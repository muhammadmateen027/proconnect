import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/apartment.dart';

part 'owner_apartment_event.freezed.dart';

@freezed
class OwnerApartmentEvent with _$OwnerApartmentEvent {
  const factory OwnerApartmentEvent.loadApartments(String ownerId) =
      _LoadApartments;
  const factory OwnerApartmentEvent.apartmentsUpdated(
    List<Apartment> apartments,
  ) = _ApartmentsUpdated;
  const factory OwnerApartmentEvent.clear() = _Clear;
}
