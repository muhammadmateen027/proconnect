import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner_apartment_detail_event.freezed.dart';

@freezed
class OwnerApartmentDetailEvent with _$OwnerApartmentDetailEvent {
  const factory OwnerApartmentDetailEvent.loadApartment(String apartmentId) =
      _LoadApartment;

  const factory OwnerApartmentDetailEvent.updateApartmentDetails({
    required String apartmentId,
    required Map<String, dynamic> updates,
  }) = _UpdateApartmentDetails;

  const factory OwnerApartmentDetailEvent.assignTenant({
    required String apartmentId,
    required String tenantName,
    required String tenantEmail,
    required String tenantPhone,
  }) = _AssignTenant;

  const factory OwnerApartmentDetailEvent.removeTenant(String apartmentId) =
      _RemoveTenant;

  const factory OwnerApartmentDetailEvent.startLease({
    required String apartmentId,
    required DateTime leaseStartDate,
    required DateTime leaseEndDate,
    required double monthlyRent,
    required double securityDeposit,
    required int rentDueDay,
  }) = _StartLease;

  const factory OwnerApartmentDetailEvent.endLease(String apartmentId) =
      _EndLease;

  const factory OwnerApartmentDetailEvent.updateRentalPrice({
    required String apartmentId,
    required double monthlyRent,
    required double securityDeposit,
  }) = _UpdateRentalPrice;
}
