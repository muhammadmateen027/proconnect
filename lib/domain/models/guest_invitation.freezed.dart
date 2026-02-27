// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GuestInvitation _$GuestInvitationFromJson(Map<String, dynamic> json) {
  return _GuestInvitation.fromJson(json);
}

/// @nodoc
mixin _$GuestInvitation {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get apartmentId => throw _privateConstructorUsedError;
  String get guestName => throw _privateConstructorUsedError;
  String get purpose => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get expiryDate => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get apartmentNumber => throw _privateConstructorUsedError;
  String? get condoName => throw _privateConstructorUsedError;
  bool? get isUsed => throw _privateConstructorUsedError;

  /// Serializes this GuestInvitation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestInvitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestInvitationCopyWith<GuestInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestInvitationCopyWith<$Res> {
  factory $GuestInvitationCopyWith(
    GuestInvitation value,
    $Res Function(GuestInvitation) then,
  ) = _$GuestInvitationCopyWithImpl<$Res, GuestInvitation>;
  @useResult
  $Res call({
    String id,
    String ownerId,
    String apartmentId,
    String guestName,
    String purpose,
    @TimestampConverter() DateTime expiryDate,
    @TimestampConverter() DateTime createdAt,
    String? apartmentNumber,
    String? condoName,
    bool? isUsed,
  });
}

/// @nodoc
class _$GuestInvitationCopyWithImpl<$Res, $Val extends GuestInvitation>
    implements $GuestInvitationCopyWith<$Res> {
  _$GuestInvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestInvitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? apartmentId = null,
    Object? guestName = null,
    Object? purpose = null,
    Object? expiryDate = null,
    Object? createdAt = null,
    Object? apartmentNumber = freezed,
    Object? condoName = freezed,
    Object? isUsed = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            ownerId: null == ownerId
                ? _value.ownerId
                : ownerId // ignore: cast_nullable_to_non_nullable
                      as String,
            apartmentId: null == apartmentId
                ? _value.apartmentId
                : apartmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            guestName: null == guestName
                ? _value.guestName
                : guestName // ignore: cast_nullable_to_non_nullable
                      as String,
            purpose: null == purpose
                ? _value.purpose
                : purpose // ignore: cast_nullable_to_non_nullable
                      as String,
            expiryDate: null == expiryDate
                ? _value.expiryDate
                : expiryDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            apartmentNumber: freezed == apartmentNumber
                ? _value.apartmentNumber
                : apartmentNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            condoName: freezed == condoName
                ? _value.condoName
                : condoName // ignore: cast_nullable_to_non_nullable
                      as String?,
            isUsed: freezed == isUsed
                ? _value.isUsed
                : isUsed // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GuestInvitationImplCopyWith<$Res>
    implements $GuestInvitationCopyWith<$Res> {
  factory _$$GuestInvitationImplCopyWith(
    _$GuestInvitationImpl value,
    $Res Function(_$GuestInvitationImpl) then,
  ) = __$$GuestInvitationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String ownerId,
    String apartmentId,
    String guestName,
    String purpose,
    @TimestampConverter() DateTime expiryDate,
    @TimestampConverter() DateTime createdAt,
    String? apartmentNumber,
    String? condoName,
    bool? isUsed,
  });
}

/// @nodoc
class __$$GuestInvitationImplCopyWithImpl<$Res>
    extends _$GuestInvitationCopyWithImpl<$Res, _$GuestInvitationImpl>
    implements _$$GuestInvitationImplCopyWith<$Res> {
  __$$GuestInvitationImplCopyWithImpl(
    _$GuestInvitationImpl _value,
    $Res Function(_$GuestInvitationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuestInvitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? apartmentId = null,
    Object? guestName = null,
    Object? purpose = null,
    Object? expiryDate = null,
    Object? createdAt = null,
    Object? apartmentNumber = freezed,
    Object? condoName = freezed,
    Object? isUsed = freezed,
  }) {
    return _then(
      _$GuestInvitationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        ownerId: null == ownerId
            ? _value.ownerId
            : ownerId // ignore: cast_nullable_to_non_nullable
                  as String,
        apartmentId: null == apartmentId
            ? _value.apartmentId
            : apartmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        guestName: null == guestName
            ? _value.guestName
            : guestName // ignore: cast_nullable_to_non_nullable
                  as String,
        purpose: null == purpose
            ? _value.purpose
            : purpose // ignore: cast_nullable_to_non_nullable
                  as String,
        expiryDate: null == expiryDate
            ? _value.expiryDate
            : expiryDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        apartmentNumber: freezed == apartmentNumber
            ? _value.apartmentNumber
            : apartmentNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        condoName: freezed == condoName
            ? _value.condoName
            : condoName // ignore: cast_nullable_to_non_nullable
                  as String?,
        isUsed: freezed == isUsed
            ? _value.isUsed
            : isUsed // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestInvitationImpl implements _GuestInvitation {
  const _$GuestInvitationImpl({
    required this.id,
    required this.ownerId,
    required this.apartmentId,
    required this.guestName,
    required this.purpose,
    @TimestampConverter() required this.expiryDate,
    @TimestampConverter() required this.createdAt,
    this.apartmentNumber,
    this.condoName,
    this.isUsed,
  });

  factory _$GuestInvitationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestInvitationImplFromJson(json);

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final String apartmentId;
  @override
  final String guestName;
  @override
  final String purpose;
  @override
  @TimestampConverter()
  final DateTime expiryDate;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  final String? apartmentNumber;
  @override
  final String? condoName;
  @override
  final bool? isUsed;

  @override
  String toString() {
    return 'GuestInvitation(id: $id, ownerId: $ownerId, apartmentId: $apartmentId, guestName: $guestName, purpose: $purpose, expiryDate: $expiryDate, createdAt: $createdAt, apartmentNumber: $apartmentNumber, condoName: $condoName, isUsed: $isUsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestInvitationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.apartmentId, apartmentId) ||
                other.apartmentId == apartmentId) &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.apartmentNumber, apartmentNumber) ||
                other.apartmentNumber == apartmentNumber) &&
            (identical(other.condoName, condoName) ||
                other.condoName == condoName) &&
            (identical(other.isUsed, isUsed) || other.isUsed == isUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    ownerId,
    apartmentId,
    guestName,
    purpose,
    expiryDate,
    createdAt,
    apartmentNumber,
    condoName,
    isUsed,
  );

  /// Create a copy of GuestInvitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestInvitationImplCopyWith<_$GuestInvitationImpl> get copyWith =>
      __$$GuestInvitationImplCopyWithImpl<_$GuestInvitationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestInvitationImplToJson(this);
  }
}

abstract class _GuestInvitation implements GuestInvitation {
  const factory _GuestInvitation({
    required final String id,
    required final String ownerId,
    required final String apartmentId,
    required final String guestName,
    required final String purpose,
    @TimestampConverter() required final DateTime expiryDate,
    @TimestampConverter() required final DateTime createdAt,
    final String? apartmentNumber,
    final String? condoName,
    final bool? isUsed,
  }) = _$GuestInvitationImpl;

  factory _GuestInvitation.fromJson(Map<String, dynamic> json) =
      _$GuestInvitationImpl.fromJson;

  @override
  String get id;
  @override
  String get ownerId;
  @override
  String get apartmentId;
  @override
  String get guestName;
  @override
  String get purpose;
  @override
  @TimestampConverter()
  DateTime get expiryDate;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  String? get apartmentNumber;
  @override
  String? get condoName;
  @override
  bool? get isUsed;

  /// Create a copy of GuestInvitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestInvitationImplCopyWith<_$GuestInvitationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
