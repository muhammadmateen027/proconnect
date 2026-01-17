// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Agency _$AgencyFromJson(Map<String, dynamic> json) {
  return _Agency.fromJson(json);
}

/// @nodoc
mixin _$Agency {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get contactEmail => throw _privateConstructorUsedError;
  String? get contactPhone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  /// Serializes this Agency to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Agency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgencyCopyWith<Agency> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgencyCopyWith<$Res> {
  factory $AgencyCopyWith(Agency value, $Res Function(Agency) then) =
      _$AgencyCopyWithImpl<$Res, Agency>;
  @useResult
  $Res call({
    String id,
    String name,
    String? contactEmail,
    String? contactPhone,
    String? address,
  });
}

/// @nodoc
class _$AgencyCopyWithImpl<$Res, $Val extends Agency>
    implements $AgencyCopyWith<$Res> {
  _$AgencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Agency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? contactEmail = freezed,
    Object? contactPhone = freezed,
    Object? address = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            contactEmail: freezed == contactEmail
                ? _value.contactEmail
                : contactEmail // ignore: cast_nullable_to_non_nullable
                      as String?,
            contactPhone: freezed == contactPhone
                ? _value.contactPhone
                : contactPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AgencyImplCopyWith<$Res> implements $AgencyCopyWith<$Res> {
  factory _$$AgencyImplCopyWith(
    _$AgencyImpl value,
    $Res Function(_$AgencyImpl) then,
  ) = __$$AgencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? contactEmail,
    String? contactPhone,
    String? address,
  });
}

/// @nodoc
class __$$AgencyImplCopyWithImpl<$Res>
    extends _$AgencyCopyWithImpl<$Res, _$AgencyImpl>
    implements _$$AgencyImplCopyWith<$Res> {
  __$$AgencyImplCopyWithImpl(
    _$AgencyImpl _value,
    $Res Function(_$AgencyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Agency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? contactEmail = freezed,
    Object? contactPhone = freezed,
    Object? address = freezed,
  }) {
    return _then(
      _$AgencyImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        contactEmail: freezed == contactEmail
            ? _value.contactEmail
            : contactEmail // ignore: cast_nullable_to_non_nullable
                  as String?,
        contactPhone: freezed == contactPhone
            ? _value.contactPhone
            : contactPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AgencyImpl implements _Agency {
  const _$AgencyImpl({
    required this.id,
    required this.name,
    this.contactEmail,
    this.contactPhone,
    this.address,
  });

  factory _$AgencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgencyImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? contactEmail;
  @override
  final String? contactPhone;
  @override
  final String? address;

  @override
  String toString() {
    return 'Agency(id: $id, name: $name, contactEmail: $contactEmail, contactPhone: $contactPhone, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgencyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, contactEmail, contactPhone, address);

  /// Create a copy of Agency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgencyImplCopyWith<_$AgencyImpl> get copyWith =>
      __$$AgencyImplCopyWithImpl<_$AgencyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgencyImplToJson(this);
  }
}

abstract class _Agency implements Agency {
  const factory _Agency({
    required final String id,
    required final String name,
    final String? contactEmail,
    final String? contactPhone,
    final String? address,
  }) = _$AgencyImpl;

  factory _Agency.fromJson(Map<String, dynamic> json) = _$AgencyImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get contactEmail;
  @override
  String? get contactPhone;
  @override
  String? get address;

  /// Create a copy of Agency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgencyImplCopyWith<_$AgencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
