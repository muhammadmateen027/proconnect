// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitImpl _$$UnitImplFromJson(Map<String, dynamic> json) => _$UnitImpl(
  id: json['id'] as String,
  unitNo: json['unitNo'] as String,
  condoName: json['condoName'] as String,
  ownerId: json['ownerId'] as String,
  tenantName: json['tenantName'] as String?,
  tenantPhone: json['tenantPhone'] as String?,
  tenantEmail: json['tenantEmail'] as String?,
  monthlyRent: (json['monthlyRent'] as num?)?.toDouble(),
  leaseStartDate: json['leaseStartDate'] == null
      ? null
      : DateTime.parse(json['leaseStartDate'] as String),
  leaseEndDate: json['leaseEndDate'] == null
      ? null
      : DateTime.parse(json['leaseEndDate'] as String),
  rentDueDate: (json['rentDueDate'] as num?)?.toInt(),
  securityDeposit: (json['securityDeposit'] as num?)?.toDouble(),
  utilitiesIncluded:
      (json['utilitiesIncluded'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
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
  isAssigned: json['isAssigned'] as bool? ?? false,
);

Map<String, dynamic> _$$UnitImplToJson(_$UnitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unitNo': instance.unitNo,
      'condoName': instance.condoName,
      'ownerId': instance.ownerId,
      'tenantName': instance.tenantName,
      'tenantPhone': instance.tenantPhone,
      'tenantEmail': instance.tenantEmail,
      'monthlyRent': instance.monthlyRent,
      'leaseStartDate': instance.leaseStartDate?.toIso8601String(),
      'leaseEndDate': instance.leaseEndDate?.toIso8601String(),
      'rentDueDate': instance.rentDueDate,
      'securityDeposit': instance.securityDeposit,
      'utilitiesIncluded': instance.utilitiesIncluded,
      'allowedParkingSpaces': instance.allowedParkingSpaces,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'squareFeet': instance.squareFeet,
      'floorLevel': instance.floorLevel,
      'furnishing': _$FurnishingStatusEnumMap[instance.furnishing]!,
      'isAssigned': instance.isAssigned,
    };

const _$FurnishingStatusEnumMap = {
  FurnishingStatus.none: 'none',
  FurnishingStatus.partial: 'partial',
  FurnishingStatus.full: 'full',
};
