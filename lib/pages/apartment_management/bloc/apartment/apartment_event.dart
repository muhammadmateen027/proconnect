import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/models/apartment.dart';

part 'apartment_event.freezed.dart';

/// Events for Apartment management
@freezed
class ApartmentEvent with _$ApartmentEvent {
  /// Load all apartments for a condominium
  const factory ApartmentEvent.loadApartments({
    required String condominiumId,
  }) = LoadApartments;

  /// Load apartments by floor
  const factory ApartmentEvent.loadApartmentsByFloor({
    required String floorId,
  }) = LoadApartmentsByFloor;

  /// Create a new apartment
  const factory ApartmentEvent.createApartment({
    required Apartment apartment,
  }) = CreateApartment;

  /// Update an existing apartment
  const factory ApartmentEvent.updateApartment({
    required Apartment apartment,
  }) = UpdateApartment;

  /// Delete an apartment
  const factory ApartmentEvent.deleteApartment({
    required String condominiumId,
    required String apartmentId,
  }) = DeleteApartment;

  /// Assign owner to apartment
  const factory ApartmentEvent.assignOwner({
    required String apartmentId,
    required String ownerId,
    required String ownerName,
    String? ownerEmail,
    String? ownerPhone,
  }) = AssignOwner;

  /// Update apartment status
  const factory ApartmentEvent.updateStatus({
    required String apartmentId,
    required ApartmentStatus status,
    DateTime? vacantFrom,
    DateTime? availableFrom,
  }) = UpdateStatus;
}
