import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit.freezed.dart';
part 'unit.g.dart';

enum RentStatus { occupied, vacant }

enum FurnishingStatus { none, partial, full }

@freezed
class Unit with _$Unit {
  const factory Unit({
    required String id,
    required String unitNo,
    required String condoName,
    required RentStatus rentStatus,
    required String ownerId,

    // Rental Details
    required double rentAmount,
    required int rentDueDate,
    required double securityDeposit,
    required List<String> utilitiesIncluded,
    DateTime? leaseStartDate,
    DateTime? leaseEndDate,

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
}
