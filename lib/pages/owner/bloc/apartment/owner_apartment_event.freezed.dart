// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner_apartment_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OwnerApartmentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String ownerId) loadApartments,
    required TResult Function(List<Apartment> apartments) apartmentsUpdated,
    required TResult Function() clear,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String ownerId)? loadApartments,
    TResult? Function(List<Apartment> apartments)? apartmentsUpdated,
    TResult? Function()? clear,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String ownerId)? loadApartments,
    TResult Function(List<Apartment> apartments)? apartmentsUpdated,
    TResult Function()? clear,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadApartments value) loadApartments,
    required TResult Function(_ApartmentsUpdated value) apartmentsUpdated,
    required TResult Function(_Clear value) clear,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadApartments value)? loadApartments,
    TResult? Function(_ApartmentsUpdated value)? apartmentsUpdated,
    TResult? Function(_Clear value)? clear,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadApartments value)? loadApartments,
    TResult Function(_ApartmentsUpdated value)? apartmentsUpdated,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerApartmentEventCopyWith<$Res> {
  factory $OwnerApartmentEventCopyWith(
    OwnerApartmentEvent value,
    $Res Function(OwnerApartmentEvent) then,
  ) = _$OwnerApartmentEventCopyWithImpl<$Res, OwnerApartmentEvent>;
}

/// @nodoc
class _$OwnerApartmentEventCopyWithImpl<$Res, $Val extends OwnerApartmentEvent>
    implements $OwnerApartmentEventCopyWith<$Res> {
  _$OwnerApartmentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OwnerApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadApartmentsImplCopyWith<$Res> {
  factory _$$LoadApartmentsImplCopyWith(
    _$LoadApartmentsImpl value,
    $Res Function(_$LoadApartmentsImpl) then,
  ) = __$$LoadApartmentsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String ownerId});
}

/// @nodoc
class __$$LoadApartmentsImplCopyWithImpl<$Res>
    extends _$OwnerApartmentEventCopyWithImpl<$Res, _$LoadApartmentsImpl>
    implements _$$LoadApartmentsImplCopyWith<$Res> {
  __$$LoadApartmentsImplCopyWithImpl(
    _$LoadApartmentsImpl _value,
    $Res Function(_$LoadApartmentsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OwnerApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ownerId = null}) {
    return _then(
      _$LoadApartmentsImpl(
        null == ownerId
            ? _value.ownerId
            : ownerId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadApartmentsImpl implements _LoadApartments {
  const _$LoadApartmentsImpl(this.ownerId);

  @override
  final String ownerId;

  @override
  String toString() {
    return 'OwnerApartmentEvent.loadApartments(ownerId: $ownerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadApartmentsImpl &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ownerId);

  /// Create a copy of OwnerApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadApartmentsImplCopyWith<_$LoadApartmentsImpl> get copyWith =>
      __$$LoadApartmentsImplCopyWithImpl<_$LoadApartmentsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String ownerId) loadApartments,
    required TResult Function(List<Apartment> apartments) apartmentsUpdated,
    required TResult Function() clear,
  }) {
    return loadApartments(ownerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String ownerId)? loadApartments,
    TResult? Function(List<Apartment> apartments)? apartmentsUpdated,
    TResult? Function()? clear,
  }) {
    return loadApartments?.call(ownerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String ownerId)? loadApartments,
    TResult Function(List<Apartment> apartments)? apartmentsUpdated,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (loadApartments != null) {
      return loadApartments(ownerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadApartments value) loadApartments,
    required TResult Function(_ApartmentsUpdated value) apartmentsUpdated,
    required TResult Function(_Clear value) clear,
  }) {
    return loadApartments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadApartments value)? loadApartments,
    TResult? Function(_ApartmentsUpdated value)? apartmentsUpdated,
    TResult? Function(_Clear value)? clear,
  }) {
    return loadApartments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadApartments value)? loadApartments,
    TResult Function(_ApartmentsUpdated value)? apartmentsUpdated,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (loadApartments != null) {
      return loadApartments(this);
    }
    return orElse();
  }
}

abstract class _LoadApartments implements OwnerApartmentEvent {
  const factory _LoadApartments(final String ownerId) = _$LoadApartmentsImpl;

  String get ownerId;

  /// Create a copy of OwnerApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadApartmentsImplCopyWith<_$LoadApartmentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApartmentsUpdatedImplCopyWith<$Res> {
  factory _$$ApartmentsUpdatedImplCopyWith(
    _$ApartmentsUpdatedImpl value,
    $Res Function(_$ApartmentsUpdatedImpl) then,
  ) = __$$ApartmentsUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Apartment> apartments});
}

/// @nodoc
class __$$ApartmentsUpdatedImplCopyWithImpl<$Res>
    extends _$OwnerApartmentEventCopyWithImpl<$Res, _$ApartmentsUpdatedImpl>
    implements _$$ApartmentsUpdatedImplCopyWith<$Res> {
  __$$ApartmentsUpdatedImplCopyWithImpl(
    _$ApartmentsUpdatedImpl _value,
    $Res Function(_$ApartmentsUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OwnerApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apartments = null}) {
    return _then(
      _$ApartmentsUpdatedImpl(
        null == apartments
            ? _value._apartments
            : apartments // ignore: cast_nullable_to_non_nullable
                  as List<Apartment>,
      ),
    );
  }
}

/// @nodoc

class _$ApartmentsUpdatedImpl implements _ApartmentsUpdated {
  const _$ApartmentsUpdatedImpl(final List<Apartment> apartments)
    : _apartments = apartments;

  final List<Apartment> _apartments;
  @override
  List<Apartment> get apartments {
    if (_apartments is EqualUnmodifiableListView) return _apartments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_apartments);
  }

  @override
  String toString() {
    return 'OwnerApartmentEvent.apartmentsUpdated(apartments: $apartments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApartmentsUpdatedImpl &&
            const DeepCollectionEquality().equals(
              other._apartments,
              _apartments,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_apartments),
  );

  /// Create a copy of OwnerApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApartmentsUpdatedImplCopyWith<_$ApartmentsUpdatedImpl> get copyWith =>
      __$$ApartmentsUpdatedImplCopyWithImpl<_$ApartmentsUpdatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String ownerId) loadApartments,
    required TResult Function(List<Apartment> apartments) apartmentsUpdated,
    required TResult Function() clear,
  }) {
    return apartmentsUpdated(apartments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String ownerId)? loadApartments,
    TResult? Function(List<Apartment> apartments)? apartmentsUpdated,
    TResult? Function()? clear,
  }) {
    return apartmentsUpdated?.call(apartments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String ownerId)? loadApartments,
    TResult Function(List<Apartment> apartments)? apartmentsUpdated,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (apartmentsUpdated != null) {
      return apartmentsUpdated(apartments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadApartments value) loadApartments,
    required TResult Function(_ApartmentsUpdated value) apartmentsUpdated,
    required TResult Function(_Clear value) clear,
  }) {
    return apartmentsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadApartments value)? loadApartments,
    TResult? Function(_ApartmentsUpdated value)? apartmentsUpdated,
    TResult? Function(_Clear value)? clear,
  }) {
    return apartmentsUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadApartments value)? loadApartments,
    TResult Function(_ApartmentsUpdated value)? apartmentsUpdated,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (apartmentsUpdated != null) {
      return apartmentsUpdated(this);
    }
    return orElse();
  }
}

abstract class _ApartmentsUpdated implements OwnerApartmentEvent {
  const factory _ApartmentsUpdated(final List<Apartment> apartments) =
      _$ApartmentsUpdatedImpl;

  List<Apartment> get apartments;

  /// Create a copy of OwnerApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApartmentsUpdatedImplCopyWith<_$ApartmentsUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearImplCopyWith<$Res> {
  factory _$$ClearImplCopyWith(
    _$ClearImpl value,
    $Res Function(_$ClearImpl) then,
  ) = __$$ClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearImplCopyWithImpl<$Res>
    extends _$OwnerApartmentEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(
    _$ClearImpl _value,
    $Res Function(_$ClearImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OwnerApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearImpl implements _Clear {
  const _$ClearImpl();

  @override
  String toString() {
    return 'OwnerApartmentEvent.clear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String ownerId) loadApartments,
    required TResult Function(List<Apartment> apartments) apartmentsUpdated,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String ownerId)? loadApartments,
    TResult? Function(List<Apartment> apartments)? apartmentsUpdated,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String ownerId)? loadApartments,
    TResult Function(List<Apartment> apartments)? apartmentsUpdated,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadApartments value) loadApartments,
    required TResult Function(_ApartmentsUpdated value) apartmentsUpdated,
    required TResult Function(_Clear value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadApartments value)? loadApartments,
    TResult? Function(_ApartmentsUpdated value)? apartmentsUpdated,
    TResult? Function(_Clear value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadApartments value)? loadApartments,
    TResult Function(_ApartmentsUpdated value)? apartmentsUpdated,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements OwnerApartmentEvent {
  const factory _Clear() = _$ClearImpl;
}
