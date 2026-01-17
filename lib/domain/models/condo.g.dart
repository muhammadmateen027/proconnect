// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CondoImpl _$$CondoImplFromJson(Map<String, dynamic> json) => _$CondoImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  totalUnits: (json['totalUnits'] as num?)?.toInt(),
  totalFloors: (json['totalFloors'] as num?)?.toInt(),
  yearBuilt: (json['yearBuilt'] as num?)?.toInt(),
  description: json['description'] as String?,
  contactEmail: json['contactEmail'] as String?,
  contactPhone: json['contactPhone'] as String?,
  amenities:
      (json['amenities'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$CondoImplToJson(_$CondoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'totalUnits': instance.totalUnits,
      'totalFloors': instance.totalFloors,
      'yearBuilt': instance.yearBuilt,
      'description': instance.description,
      'contactEmail': instance.contactEmail,
      'contactPhone': instance.contactPhone,
      'amenities': instance.amenities,
    };
