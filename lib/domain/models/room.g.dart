// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
  id: json['id'] as String,
  type: $enumDecode(_$RoomTypeEnumMap, json['type']),
  sizeSquareFeet: (json['sizeSquareFeet'] as num).toDouble(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  hasWindow: json['hasWindow'] as bool? ?? false,
  hasBalcony: json['hasBalcony'] as bool? ?? false,
  hasAttachedBathroom: json['hasAttachedBathroom'] as bool? ?? false,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$RoomTypeEnumMap[instance.type]!,
      'sizeSquareFeet': instance.sizeSquareFeet,
      'name': instance.name,
      'description': instance.description,
      'hasWindow': instance.hasWindow,
      'hasBalcony': instance.hasBalcony,
      'hasAttachedBathroom': instance.hasAttachedBathroom,
      'notes': instance.notes,
    };

const _$RoomTypeEnumMap = {
  RoomType.bedroom: 'bedroom',
  RoomType.bathroom: 'bathroom',
  RoomType.kitchen: 'kitchen',
  RoomType.livingRoom: 'livingRoom',
  RoomType.diningRoom: 'diningRoom',
  RoomType.study: 'study',
  RoomType.balcony: 'balcony',
  RoomType.storage: 'storage',
  RoomType.laundry: 'laundry',
  RoomType.other: 'other',
};
