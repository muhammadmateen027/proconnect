import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/core/utils/timestamp_converter.dart';

part 'guest_invitation.freezed.dart';
part 'guest_invitation.g.dart';

@freezed
class GuestInvitation with _$GuestInvitation {
  const factory GuestInvitation({
    required String id,
    required String ownerId,
    required String apartmentId,
    required String guestName,
    required String purpose,
    @TimestampConverter() required DateTime expiryDate,
    @TimestampConverter() required DateTime createdAt,
    String? apartmentNumber,
    String? condoName,
    bool? isUsed,
  }) = _GuestInvitation;

  factory GuestInvitation.fromJson(Map<String, dynamic> json) =>
      _$GuestInvitationFromJson(json);
}
