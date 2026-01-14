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
);

Map<String, dynamic> _$$UnitImplToJson(_$UnitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unitNo': instance.unitNo,
      'condoName': instance.condoName,
      'rentStatus': _$RentStatusEnumMap[instance.rentStatus]!,
      'ownerId': instance.ownerId,
    };

const _$RentStatusEnumMap = {
  RentStatus.occupied: 'occupied',
  RentStatus.vacant: 'vacant',
};
