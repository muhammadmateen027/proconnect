// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Condo _$CondoFromJson(Map<String, dynamic> json) {
  return _Condo.fromJson(json);
}

/// @nodoc
mixin _$Condo {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  /// Serializes this Condo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Condo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CondoCopyWith<Condo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CondoCopyWith<$Res> {
  factory $CondoCopyWith(Condo value, $Res Function(Condo) then) =
      _$CondoCopyWithImpl<$Res, Condo>;
  @useResult
  $Res call({String id, String name, String address});
}

/// @nodoc
class _$CondoCopyWithImpl<$Res, $Val extends Condo>
    implements $CondoCopyWith<$Res> {
  _$CondoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Condo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? address = null}) {
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
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CondoImplCopyWith<$Res> implements $CondoCopyWith<$Res> {
  factory _$$CondoImplCopyWith(
    _$CondoImpl value,
    $Res Function(_$CondoImpl) then,
  ) = __$$CondoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String address});
}

/// @nodoc
class __$$CondoImplCopyWithImpl<$Res>
    extends _$CondoCopyWithImpl<$Res, _$CondoImpl>
    implements _$$CondoImplCopyWith<$Res> {
  __$$CondoImplCopyWithImpl(
    _$CondoImpl _value,
    $Res Function(_$CondoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Condo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? address = null}) {
    return _then(
      _$CondoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CondoImpl implements _Condo {
  const _$CondoImpl({
    required this.id,
    required this.name,
    required this.address,
  });

  factory _$CondoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CondoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;

  @override
  String toString() {
    return 'Condo(id: $id, name: $name, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CondoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address);

  /// Create a copy of Condo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CondoImplCopyWith<_$CondoImpl> get copyWith =>
      __$$CondoImplCopyWithImpl<_$CondoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CondoImplToJson(this);
  }
}

abstract class _Condo implements Condo {
  const factory _Condo({
    required final String id,
    required final String name,
    required final String address,
  }) = _$CondoImpl;

  factory _Condo.fromJson(Map<String, dynamic> json) = _$CondoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;

  /// Create a copy of Condo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CondoImplCopyWith<_$CondoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
