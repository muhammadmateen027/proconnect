// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_apartment_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TenantApartmentEvent {
  String get tenantId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId) load,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tenantId)? load,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tenantId)? load,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of TenantApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TenantApartmentEventCopyWith<TenantApartmentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenantApartmentEventCopyWith<$Res> {
  factory $TenantApartmentEventCopyWith(
    TenantApartmentEvent value,
    $Res Function(TenantApartmentEvent) then,
  ) = _$TenantApartmentEventCopyWithImpl<$Res, TenantApartmentEvent>;
  @useResult
  $Res call({String tenantId});
}

/// @nodoc
class _$TenantApartmentEventCopyWithImpl<
  $Res,
  $Val extends TenantApartmentEvent
>
    implements $TenantApartmentEventCopyWith<$Res> {
  _$TenantApartmentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TenantApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tenantId = null}) {
    return _then(
      _value.copyWith(
            tenantId: null == tenantId
                ? _value.tenantId
                : tenantId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res>
    implements $TenantApartmentEventCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
    _$LoadImpl value,
    $Res Function(_$LoadImpl) then,
  ) = __$$LoadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tenantId});
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$TenantApartmentEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
    : super(_value, _then);

  /// Create a copy of TenantApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tenantId = null}) {
    return _then(
      _$LoadImpl(
        null == tenantId
            ? _value.tenantId
            : tenantId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl(this.tenantId);

  @override
  final String tenantId;

  @override
  String toString() {
    return 'TenantApartmentEvent.load(tenantId: $tenantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadImpl &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tenantId);

  /// Create a copy of TenantApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      __$$LoadImplCopyWithImpl<_$LoadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId) load,
  }) {
    return load(tenantId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tenantId)? load,
  }) {
    return load?.call(tenantId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tenantId)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(tenantId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements TenantApartmentEvent {
  const factory _Load(final String tenantId) = _$LoadImpl;

  @override
  String get tenantId;

  /// Create a copy of TenantApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
