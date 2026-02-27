// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_invitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuestInvitationImpl _$$GuestInvitationImplFromJson(
  Map<String, dynamic> json,
) => _$GuestInvitationImpl(
  id: json['id'] as String,
  ownerId: json['ownerId'] as String,
  apartmentId: json['apartmentId'] as String,
  guestName: json['guestName'] as String,
  purpose: json['purpose'] as String,
  expiryDate: const TimestampConverter().fromJson(json['expiryDate']),
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  apartmentNumber: json['apartmentNumber'] as String?,
  condoName: json['condoName'] as String?,
  isUsed: json['isUsed'] as bool?,
);

Map<String, dynamic> _$$GuestInvitationImplToJson(
  _$GuestInvitationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'ownerId': instance.ownerId,
  'apartmentId': instance.apartmentId,
  'guestName': instance.guestName,
  'purpose': instance.purpose,
  'expiryDate': const TimestampConverter().toJson(instance.expiryDate),
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'apartmentNumber': instance.apartmentNumber,
  'condoName': instance.condoName,
  'isUsed': instance.isUsed,
};
