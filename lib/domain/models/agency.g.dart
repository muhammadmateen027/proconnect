// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgencyImpl _$$AgencyImplFromJson(Map<String, dynamic> json) => _$AgencyImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  contactEmail: json['contactEmail'] as String?,
  contactPhone: json['contactPhone'] as String?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$$AgencyImplToJson(_$AgencyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contactEmail': instance.contactEmail,
      'contactPhone': instance.contactPhone,
      'address': instance.address,
    };
