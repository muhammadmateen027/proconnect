import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit.freezed.dart';

part 'unit.g.dart';

enum FurnishingStatus { none, partial, full }

@freezed
class Unit with _$Unit {
  const Unit._(); // Private constructor for getters

  const factory Unit({
    required String id,
    required String unitNo,
    required String condoName,
    required String ownerId,

    // Manual Tenant Tracking for MVP
    String? tenantName,
    String? tenantPhone,
    String? tenantEmail, // Restored field
    // Rental Details
    double? monthlyRent,
    DateTime? leaseStartDate,
    DateTime? leaseEndDate,
    int? rentDueDate,
    double? securityDeposit,
    @Default([]) List<String> utilitiesIncluded,

    // Parking Details
    @Default([]) List<String> allowedParkingSpaces,

    // Unit Specifications
    @Default(0) int bedrooms,
    @Default(0) int bathrooms,
    @Default(0) int squareFeet,
    String? floorLevel,
    @Default(FurnishingStatus.none) FurnishingStatus furnishing,
  }) = _Unit;

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  bool get isVacant => tenantName == null || tenantName!.isEmpty;
}
