// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitImpl _$$UnitImplFromJson(Map<String, dynamic> json) => _$UnitImpl(
  id: json['id'] as String,
  unitNo: json['unitNo'] as String,
  condoName: json['condoName'] as String,
  rentStatus: $enumDecode(_$RentStatusEnumMap, json['rentStatus']),
  ownerId: json['ownerId'] as String,
  rentAmount: (json['rentAmount'] as num).toDouble(),
  rentDueDate: (json['rentDueDate'] as num).toInt(),
  securityDeposit: (json['securityDeposit'] as num).toDouble(),
  utilitiesIncluded: (json['utilitiesIncluded'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  leaseStartDate: json['leaseStartDate'] == null
      ? null
      : DateTime.parse(json['leaseStartDate'] as String),
  leaseEndDate: json['leaseEndDate'] == null
      ? null
      : DateTime.parse(json['leaseEndDate'] as String),
  allowedParkingSpaces:
      (json['allowedParkingSpaces'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  bedrooms: (json['bedrooms'] as num?)?.toInt() ?? 0,
  bathrooms: (json['bathrooms'] as num?)?.toInt() ?? 0,
  squareFeet: (json['squareFeet'] as num?)?.toInt() ?? 0,
  floorLevel: json['floorLevel'] as String?,
  furnishing:
      $enumDecodeNullable(_$FurnishingStatusEnumMap, json['furnishing']) ??
      FurnishingStatus.none,
);

Map<String, dynamic> _$$UnitImplToJson(_$UnitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unitNo': instance.unitNo,
      'condoName': instance.condoName,
      'rentStatus': _$RentStatusEnumMap[instance.rentStatus]!,
      'ownerId': instance.ownerId,
      'rentAmount': instance.rentAmount,
      'rentDueDate': instance.rentDueDate,
      'securityDeposit': instance.securityDeposit,
      'utilitiesIncluded': instance.utilitiesIncluded,
      'leaseStartDate': instance.leaseStartDate?.toIso8601String(),
      'leaseEndDate': instance.leaseEndDate?.toIso8601String(),
      'allowedParkingSpaces': instance.allowedParkingSpaces,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'squareFeet': instance.squareFeet,
      'floorLevel': instance.floorLevel,
      'furnishing': _$FurnishingStatusEnumMap[instance.furnishing]!,
    };

const _$RentStatusEnumMap = {
  RentStatus.occupied: 'occupied',
  RentStatus.vacant: 'vacant',
};

const _$FurnishingStatusEnumMap = {
  FurnishingStatus.none: 'none',
  FurnishingStatus.partial: 'partial',
  FurnishingStatus.full: 'full',
};
