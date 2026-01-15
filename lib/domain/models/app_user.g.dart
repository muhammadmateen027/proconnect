// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      agencyId: json['agencyId'] as String?,
      condominiumId: json['condominiumId'] as String?,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'fullName': instance.fullName,
      'role': _$UserRoleEnumMap[instance.role]!,
      'agencyId': instance.agencyId,
      'condominiumId': instance.condominiumId,
    };

const _$UserRoleEnumMap = {
  UserRole.super_admin: 'super_admin',
  UserRole.agency_admin: 'agency_admin',
  UserRole.guard: 'guard',
  UserRole.owner: 'owner',
  UserRole.tenant: 'tenant',
};
