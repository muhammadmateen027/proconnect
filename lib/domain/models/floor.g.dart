// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FloorImpl _$$FloorImplFromJson(Map<String, dynamic> json) => _$FloorImpl(
  id: json['id'] as String,
  condominiumId: json['condominiumId'] as String,
  agencyId: json['agencyId'] as String,
  floorNumber: (json['floorNumber'] as num).toInt(),
  floorName: json['floorName'] as String?,
  totalApartments: (json['totalApartments'] as num?)?.toInt(),
  description: json['description'] as String?,
  amenities:
      (json['amenities'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$FloorImplToJson(_$FloorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'condominiumId': instance.condominiumId,
      'agencyId': instance.agencyId,
      'floorNumber': instance.floorNumber,
      'floorName': instance.floorName,
      'totalApartments': instance.totalApartments,
      'description': instance.description,
      'amenities': instance.amenities,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
