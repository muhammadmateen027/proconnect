// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apartment_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ApartmentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String condominiumId) loadApartments,
    required TResult Function(String floorId) loadApartmentsByFloor,
    required TResult Function(Apartment apartment) createApartment,
    required TResult Function(Apartment apartment) updateApartment,
    required TResult Function(String apartmentId) deleteApartment,
    required TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )
    assignOwner,
    required TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )
    updateStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String condominiumId)? loadApartments,
    TResult? Function(String floorId)? loadApartmentsByFloor,
    TResult? Function(Apartment apartment)? createApartment,
    TResult? Function(Apartment apartment)? updateApartment,
    TResult? Function(String apartmentId)? deleteApartment,
    TResult? Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult? Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String condominiumId)? loadApartments,
    TResult Function(String floorId)? loadApartmentsByFloor,
    TResult Function(Apartment apartment)? createApartment,
    TResult Function(Apartment apartment)? updateApartment,
    TResult Function(String apartmentId)? deleteApartment,
    TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadApartments value) loadApartments,
    required TResult Function(LoadApartmentsByFloor value)
    loadApartmentsByFloor,
    required TResult Function(CreateApartment value) createApartment,
    required TResult Function(UpdateApartment value) updateApartment,
    required TResult Function(DeleteApartment value) deleteApartment,
    required TResult Function(AssignOwner value) assignOwner,
    required TResult Function(UpdateStatus value) updateStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadApartments value)? loadApartments,
    TResult? Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult? Function(CreateApartment value)? createApartment,
    TResult? Function(UpdateApartment value)? updateApartment,
    TResult? Function(DeleteApartment value)? deleteApartment,
    TResult? Function(AssignOwner value)? assignOwner,
    TResult? Function(UpdateStatus value)? updateStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadApartments value)? loadApartments,
    TResult Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult Function(CreateApartment value)? createApartment,
    TResult Function(UpdateApartment value)? updateApartment,
    TResult Function(DeleteApartment value)? deleteApartment,
    TResult Function(AssignOwner value)? assignOwner,
    TResult Function(UpdateStatus value)? updateStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApartmentEventCopyWith<$Res> {
  factory $ApartmentEventCopyWith(
    ApartmentEvent value,
    $Res Function(ApartmentEvent) then,
  ) = _$ApartmentEventCopyWithImpl<$Res, ApartmentEvent>;
}

/// @nodoc
class _$ApartmentEventCopyWithImpl<$Res, $Val extends ApartmentEvent>
    implements $ApartmentEventCopyWith<$Res> {
  _$ApartmentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadApartmentsImplCopyWith<$Res> {
  factory _$$LoadApartmentsImplCopyWith(
    _$LoadApartmentsImpl value,
    $Res Function(_$LoadApartmentsImpl) then,
  ) = __$$LoadApartmentsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String condominiumId});
}

/// @nodoc
class __$$LoadApartmentsImplCopyWithImpl<$Res>
    extends _$ApartmentEventCopyWithImpl<$Res, _$LoadApartmentsImpl>
    implements _$$LoadApartmentsImplCopyWith<$Res> {
  __$$LoadApartmentsImplCopyWithImpl(
    _$LoadApartmentsImpl _value,
    $Res Function(_$LoadApartmentsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? condominiumId = null}) {
    return _then(
      _$LoadApartmentsImpl(
        condominiumId: null == condominiumId
            ? _value.condominiumId
            : condominiumId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadApartmentsImpl implements LoadApartments {
  const _$LoadApartmentsImpl({required this.condominiumId});

  @override
  final String condominiumId;

  @override
  String toString() {
    return 'ApartmentEvent.loadApartments(condominiumId: $condominiumId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadApartmentsImpl &&
            (identical(other.condominiumId, condominiumId) ||
                other.condominiumId == condominiumId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, condominiumId);

  /// Create a copy of ApartmentEvent
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
    required TResult Function(String condominiumId) loadApartments,
    required TResult Function(String floorId) loadApartmentsByFloor,
    required TResult Function(Apartment apartment) createApartment,
    required TResult Function(Apartment apartment) updateApartment,
    required TResult Function(String apartmentId) deleteApartment,
    required TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )
    assignOwner,
    required TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )
    updateStatus,
  }) {
    return loadApartments(condominiumId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String condominiumId)? loadApartments,
    TResult? Function(String floorId)? loadApartmentsByFloor,
    TResult? Function(Apartment apartment)? createApartment,
    TResult? Function(Apartment apartment)? updateApartment,
    TResult? Function(String apartmentId)? deleteApartment,
    TResult? Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult? Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
  }) {
    return loadApartments?.call(condominiumId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String condominiumId)? loadApartments,
    TResult Function(String floorId)? loadApartmentsByFloor,
    TResult Function(Apartment apartment)? createApartment,
    TResult Function(Apartment apartment)? updateApartment,
    TResult Function(String apartmentId)? deleteApartment,
    TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
    required TResult orElse(),
  }) {
    if (loadApartments != null) {
      return loadApartments(condominiumId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadApartments value) loadApartments,
    required TResult Function(LoadApartmentsByFloor value)
    loadApartmentsByFloor,
    required TResult Function(CreateApartment value) createApartment,
    required TResult Function(UpdateApartment value) updateApartment,
    required TResult Function(DeleteApartment value) deleteApartment,
    required TResult Function(AssignOwner value) assignOwner,
    required TResult Function(UpdateStatus value) updateStatus,
  }) {
    return loadApartments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadApartments value)? loadApartments,
    TResult? Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult? Function(CreateApartment value)? createApartment,
    TResult? Function(UpdateApartment value)? updateApartment,
    TResult? Function(DeleteApartment value)? deleteApartment,
    TResult? Function(AssignOwner value)? assignOwner,
    TResult? Function(UpdateStatus value)? updateStatus,
  }) {
    return loadApartments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadApartments value)? loadApartments,
    TResult Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult Function(CreateApartment value)? createApartment,
    TResult Function(UpdateApartment value)? updateApartment,
    TResult Function(DeleteApartment value)? deleteApartment,
    TResult Function(AssignOwner value)? assignOwner,
    TResult Function(UpdateStatus value)? updateStatus,
    required TResult orElse(),
  }) {
    if (loadApartments != null) {
      return loadApartments(this);
    }
    return orElse();
  }
}

abstract class LoadApartments implements ApartmentEvent {
  const factory LoadApartments({required final String condominiumId}) =
      _$LoadApartmentsImpl;

  String get condominiumId;

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadApartmentsImplCopyWith<_$LoadApartmentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadApartmentsByFloorImplCopyWith<$Res> {
  factory _$$LoadApartmentsByFloorImplCopyWith(
    _$LoadApartmentsByFloorImpl value,
    $Res Function(_$LoadApartmentsByFloorImpl) then,
  ) = __$$LoadApartmentsByFloorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String floorId});
}

/// @nodoc
class __$$LoadApartmentsByFloorImplCopyWithImpl<$Res>
    extends _$ApartmentEventCopyWithImpl<$Res, _$LoadApartmentsByFloorImpl>
    implements _$$LoadApartmentsByFloorImplCopyWith<$Res> {
  __$$LoadApartmentsByFloorImplCopyWithImpl(
    _$LoadApartmentsByFloorImpl _value,
    $Res Function(_$LoadApartmentsByFloorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? floorId = null}) {
    return _then(
      _$LoadApartmentsByFloorImpl(
        floorId: null == floorId
            ? _value.floorId
            : floorId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadApartmentsByFloorImpl implements LoadApartmentsByFloor {
  const _$LoadApartmentsByFloorImpl({required this.floorId});

  @override
  final String floorId;

  @override
  String toString() {
    return 'ApartmentEvent.loadApartmentsByFloor(floorId: $floorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadApartmentsByFloorImpl &&
            (identical(other.floorId, floorId) || other.floorId == floorId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, floorId);

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadApartmentsByFloorImplCopyWith<_$LoadApartmentsByFloorImpl>
  get copyWith =>
      __$$LoadApartmentsByFloorImplCopyWithImpl<_$LoadApartmentsByFloorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String condominiumId) loadApartments,
    required TResult Function(String floorId) loadApartmentsByFloor,
    required TResult Function(Apartment apartment) createApartment,
    required TResult Function(Apartment apartment) updateApartment,
    required TResult Function(String apartmentId) deleteApartment,
    required TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )
    assignOwner,
    required TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )
    updateStatus,
  }) {
    return loadApartmentsByFloor(floorId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String condominiumId)? loadApartments,
    TResult? Function(String floorId)? loadApartmentsByFloor,
    TResult? Function(Apartment apartment)? createApartment,
    TResult? Function(Apartment apartment)? updateApartment,
    TResult? Function(String apartmentId)? deleteApartment,
    TResult? Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult? Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
  }) {
    return loadApartmentsByFloor?.call(floorId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String condominiumId)? loadApartments,
    TResult Function(String floorId)? loadApartmentsByFloor,
    TResult Function(Apartment apartment)? createApartment,
    TResult Function(Apartment apartment)? updateApartment,
    TResult Function(String apartmentId)? deleteApartment,
    TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
    required TResult orElse(),
  }) {
    if (loadApartmentsByFloor != null) {
      return loadApartmentsByFloor(floorId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadApartments value) loadApartments,
    required TResult Function(LoadApartmentsByFloor value)
    loadApartmentsByFloor,
    required TResult Function(CreateApartment value) createApartment,
    required TResult Function(UpdateApartment value) updateApartment,
    required TResult Function(DeleteApartment value) deleteApartment,
    required TResult Function(AssignOwner value) assignOwner,
    required TResult Function(UpdateStatus value) updateStatus,
  }) {
    return loadApartmentsByFloor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadApartments value)? loadApartments,
    TResult? Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult? Function(CreateApartment value)? createApartment,
    TResult? Function(UpdateApartment value)? updateApartment,
    TResult? Function(DeleteApartment value)? deleteApartment,
    TResult? Function(AssignOwner value)? assignOwner,
    TResult? Function(UpdateStatus value)? updateStatus,
  }) {
    return loadApartmentsByFloor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadApartments value)? loadApartments,
    TResult Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult Function(CreateApartment value)? createApartment,
    TResult Function(UpdateApartment value)? updateApartment,
    TResult Function(DeleteApartment value)? deleteApartment,
    TResult Function(AssignOwner value)? assignOwner,
    TResult Function(UpdateStatus value)? updateStatus,
    required TResult orElse(),
  }) {
    if (loadApartmentsByFloor != null) {
      return loadApartmentsByFloor(this);
    }
    return orElse();
  }
}

abstract class LoadApartmentsByFloor implements ApartmentEvent {
  const factory LoadApartmentsByFloor({required final String floorId}) =
      _$LoadApartmentsByFloorImpl;

  String get floorId;

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadApartmentsByFloorImplCopyWith<_$LoadApartmentsByFloorImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateApartmentImplCopyWith<$Res> {
  factory _$$CreateApartmentImplCopyWith(
    _$CreateApartmentImpl value,
    $Res Function(_$CreateApartmentImpl) then,
  ) = __$$CreateApartmentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Apartment apartment});

  $ApartmentCopyWith<$Res> get apartment;
}

/// @nodoc
class __$$CreateApartmentImplCopyWithImpl<$Res>
    extends _$ApartmentEventCopyWithImpl<$Res, _$CreateApartmentImpl>
    implements _$$CreateApartmentImplCopyWith<$Res> {
  __$$CreateApartmentImplCopyWithImpl(
    _$CreateApartmentImpl _value,
    $Res Function(_$CreateApartmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apartment = null}) {
    return _then(
      _$CreateApartmentImpl(
        apartment: null == apartment
            ? _value.apartment
            : apartment // ignore: cast_nullable_to_non_nullable
                  as Apartment,
      ),
    );
  }

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApartmentCopyWith<$Res> get apartment {
    return $ApartmentCopyWith<$Res>(_value.apartment, (value) {
      return _then(_value.copyWith(apartment: value));
    });
  }
}

/// @nodoc

class _$CreateApartmentImpl implements CreateApartment {
  const _$CreateApartmentImpl({required this.apartment});

  @override
  final Apartment apartment;

  @override
  String toString() {
    return 'ApartmentEvent.createApartment(apartment: $apartment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateApartmentImpl &&
            (identical(other.apartment, apartment) ||
                other.apartment == apartment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apartment);

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateApartmentImplCopyWith<_$CreateApartmentImpl> get copyWith =>
      __$$CreateApartmentImplCopyWithImpl<_$CreateApartmentImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String condominiumId) loadApartments,
    required TResult Function(String floorId) loadApartmentsByFloor,
    required TResult Function(Apartment apartment) createApartment,
    required TResult Function(Apartment apartment) updateApartment,
    required TResult Function(String apartmentId) deleteApartment,
    required TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )
    assignOwner,
    required TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )
    updateStatus,
  }) {
    return createApartment(apartment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String condominiumId)? loadApartments,
    TResult? Function(String floorId)? loadApartmentsByFloor,
    TResult? Function(Apartment apartment)? createApartment,
    TResult? Function(Apartment apartment)? updateApartment,
    TResult? Function(String apartmentId)? deleteApartment,
    TResult? Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult? Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
  }) {
    return createApartment?.call(apartment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String condominiumId)? loadApartments,
    TResult Function(String floorId)? loadApartmentsByFloor,
    TResult Function(Apartment apartment)? createApartment,
    TResult Function(Apartment apartment)? updateApartment,
    TResult Function(String apartmentId)? deleteApartment,
    TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
    required TResult orElse(),
  }) {
    if (createApartment != null) {
      return createApartment(apartment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadApartments value) loadApartments,
    required TResult Function(LoadApartmentsByFloor value)
    loadApartmentsByFloor,
    required TResult Function(CreateApartment value) createApartment,
    required TResult Function(UpdateApartment value) updateApartment,
    required TResult Function(DeleteApartment value) deleteApartment,
    required TResult Function(AssignOwner value) assignOwner,
    required TResult Function(UpdateStatus value) updateStatus,
  }) {
    return createApartment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadApartments value)? loadApartments,
    TResult? Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult? Function(CreateApartment value)? createApartment,
    TResult? Function(UpdateApartment value)? updateApartment,
    TResult? Function(DeleteApartment value)? deleteApartment,
    TResult? Function(AssignOwner value)? assignOwner,
    TResult? Function(UpdateStatus value)? updateStatus,
  }) {
    return createApartment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadApartments value)? loadApartments,
    TResult Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult Function(CreateApartment value)? createApartment,
    TResult Function(UpdateApartment value)? updateApartment,
    TResult Function(DeleteApartment value)? deleteApartment,
    TResult Function(AssignOwner value)? assignOwner,
    TResult Function(UpdateStatus value)? updateStatus,
    required TResult orElse(),
  }) {
    if (createApartment != null) {
      return createApartment(this);
    }
    return orElse();
  }
}

abstract class CreateApartment implements ApartmentEvent {
  const factory CreateApartment({required final Apartment apartment}) =
      _$CreateApartmentImpl;

  Apartment get apartment;

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateApartmentImplCopyWith<_$CreateApartmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateApartmentImplCopyWith<$Res> {
  factory _$$UpdateApartmentImplCopyWith(
    _$UpdateApartmentImpl value,
    $Res Function(_$UpdateApartmentImpl) then,
  ) = __$$UpdateApartmentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Apartment apartment});

  $ApartmentCopyWith<$Res> get apartment;
}

/// @nodoc
class __$$UpdateApartmentImplCopyWithImpl<$Res>
    extends _$ApartmentEventCopyWithImpl<$Res, _$UpdateApartmentImpl>
    implements _$$UpdateApartmentImplCopyWith<$Res> {
  __$$UpdateApartmentImplCopyWithImpl(
    _$UpdateApartmentImpl _value,
    $Res Function(_$UpdateApartmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apartment = null}) {
    return _then(
      _$UpdateApartmentImpl(
        apartment: null == apartment
            ? _value.apartment
            : apartment // ignore: cast_nullable_to_non_nullable
                  as Apartment,
      ),
    );
  }

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApartmentCopyWith<$Res> get apartment {
    return $ApartmentCopyWith<$Res>(_value.apartment, (value) {
      return _then(_value.copyWith(apartment: value));
    });
  }
}

/// @nodoc

class _$UpdateApartmentImpl implements UpdateApartment {
  const _$UpdateApartmentImpl({required this.apartment});

  @override
  final Apartment apartment;

  @override
  String toString() {
    return 'ApartmentEvent.updateApartment(apartment: $apartment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateApartmentImpl &&
            (identical(other.apartment, apartment) ||
                other.apartment == apartment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apartment);

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateApartmentImplCopyWith<_$UpdateApartmentImpl> get copyWith =>
      __$$UpdateApartmentImplCopyWithImpl<_$UpdateApartmentImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String condominiumId) loadApartments,
    required TResult Function(String floorId) loadApartmentsByFloor,
    required TResult Function(Apartment apartment) createApartment,
    required TResult Function(Apartment apartment) updateApartment,
    required TResult Function(String apartmentId) deleteApartment,
    required TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )
    assignOwner,
    required TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )
    updateStatus,
  }) {
    return updateApartment(apartment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String condominiumId)? loadApartments,
    TResult? Function(String floorId)? loadApartmentsByFloor,
    TResult? Function(Apartment apartment)? createApartment,
    TResult? Function(Apartment apartment)? updateApartment,
    TResult? Function(String apartmentId)? deleteApartment,
    TResult? Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult? Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
  }) {
    return updateApartment?.call(apartment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String condominiumId)? loadApartments,
    TResult Function(String floorId)? loadApartmentsByFloor,
    TResult Function(Apartment apartment)? createApartment,
    TResult Function(Apartment apartment)? updateApartment,
    TResult Function(String apartmentId)? deleteApartment,
    TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
    required TResult orElse(),
  }) {
    if (updateApartment != null) {
      return updateApartment(apartment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadApartments value) loadApartments,
    required TResult Function(LoadApartmentsByFloor value)
    loadApartmentsByFloor,
    required TResult Function(CreateApartment value) createApartment,
    required TResult Function(UpdateApartment value) updateApartment,
    required TResult Function(DeleteApartment value) deleteApartment,
    required TResult Function(AssignOwner value) assignOwner,
    required TResult Function(UpdateStatus value) updateStatus,
  }) {
    return updateApartment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadApartments value)? loadApartments,
    TResult? Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult? Function(CreateApartment value)? createApartment,
    TResult? Function(UpdateApartment value)? updateApartment,
    TResult? Function(DeleteApartment value)? deleteApartment,
    TResult? Function(AssignOwner value)? assignOwner,
    TResult? Function(UpdateStatus value)? updateStatus,
  }) {
    return updateApartment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadApartments value)? loadApartments,
    TResult Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult Function(CreateApartment value)? createApartment,
    TResult Function(UpdateApartment value)? updateApartment,
    TResult Function(DeleteApartment value)? deleteApartment,
    TResult Function(AssignOwner value)? assignOwner,
    TResult Function(UpdateStatus value)? updateStatus,
    required TResult orElse(),
  }) {
    if (updateApartment != null) {
      return updateApartment(this);
    }
    return orElse();
  }
}

abstract class UpdateApartment implements ApartmentEvent {
  const factory UpdateApartment({required final Apartment apartment}) =
      _$UpdateApartmentImpl;

  Apartment get apartment;

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateApartmentImplCopyWith<_$UpdateApartmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteApartmentImplCopyWith<$Res> {
  factory _$$DeleteApartmentImplCopyWith(
    _$DeleteApartmentImpl value,
    $Res Function(_$DeleteApartmentImpl) then,
  ) = __$$DeleteApartmentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String apartmentId});
}

/// @nodoc
class __$$DeleteApartmentImplCopyWithImpl<$Res>
    extends _$ApartmentEventCopyWithImpl<$Res, _$DeleteApartmentImpl>
    implements _$$DeleteApartmentImplCopyWith<$Res> {
  __$$DeleteApartmentImplCopyWithImpl(
    _$DeleteApartmentImpl _value,
    $Res Function(_$DeleteApartmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apartmentId = null}) {
    return _then(
      _$DeleteApartmentImpl(
        apartmentId: null == apartmentId
            ? _value.apartmentId
            : apartmentId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteApartmentImpl implements DeleteApartment {
  const _$DeleteApartmentImpl({required this.apartmentId});

  @override
  final String apartmentId;

  @override
  String toString() {
    return 'ApartmentEvent.deleteApartment(apartmentId: $apartmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteApartmentImpl &&
            (identical(other.apartmentId, apartmentId) ||
                other.apartmentId == apartmentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apartmentId);

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteApartmentImplCopyWith<_$DeleteApartmentImpl> get copyWith =>
      __$$DeleteApartmentImplCopyWithImpl<_$DeleteApartmentImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String condominiumId) loadApartments,
    required TResult Function(String floorId) loadApartmentsByFloor,
    required TResult Function(Apartment apartment) createApartment,
    required TResult Function(Apartment apartment) updateApartment,
    required TResult Function(String apartmentId) deleteApartment,
    required TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )
    assignOwner,
    required TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )
    updateStatus,
  }) {
    return deleteApartment(apartmentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String condominiumId)? loadApartments,
    TResult? Function(String floorId)? loadApartmentsByFloor,
    TResult? Function(Apartment apartment)? createApartment,
    TResult? Function(Apartment apartment)? updateApartment,
    TResult? Function(String apartmentId)? deleteApartment,
    TResult? Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult? Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
  }) {
    return deleteApartment?.call(apartmentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String condominiumId)? loadApartments,
    TResult Function(String floorId)? loadApartmentsByFloor,
    TResult Function(Apartment apartment)? createApartment,
    TResult Function(Apartment apartment)? updateApartment,
    TResult Function(String apartmentId)? deleteApartment,
    TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
    required TResult orElse(),
  }) {
    if (deleteApartment != null) {
      return deleteApartment(apartmentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadApartments value) loadApartments,
    required TResult Function(LoadApartmentsByFloor value)
    loadApartmentsByFloor,
    required TResult Function(CreateApartment value) createApartment,
    required TResult Function(UpdateApartment value) updateApartment,
    required TResult Function(DeleteApartment value) deleteApartment,
    required TResult Function(AssignOwner value) assignOwner,
    required TResult Function(UpdateStatus value) updateStatus,
  }) {
    return deleteApartment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadApartments value)? loadApartments,
    TResult? Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult? Function(CreateApartment value)? createApartment,
    TResult? Function(UpdateApartment value)? updateApartment,
    TResult? Function(DeleteApartment value)? deleteApartment,
    TResult? Function(AssignOwner value)? assignOwner,
    TResult? Function(UpdateStatus value)? updateStatus,
  }) {
    return deleteApartment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadApartments value)? loadApartments,
    TResult Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult Function(CreateApartment value)? createApartment,
    TResult Function(UpdateApartment value)? updateApartment,
    TResult Function(DeleteApartment value)? deleteApartment,
    TResult Function(AssignOwner value)? assignOwner,
    TResult Function(UpdateStatus value)? updateStatus,
    required TResult orElse(),
  }) {
    if (deleteApartment != null) {
      return deleteApartment(this);
    }
    return orElse();
  }
}

abstract class DeleteApartment implements ApartmentEvent {
  const factory DeleteApartment({required final String apartmentId}) =
      _$DeleteApartmentImpl;

  String get apartmentId;

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteApartmentImplCopyWith<_$DeleteApartmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssignOwnerImplCopyWith<$Res> {
  factory _$$AssignOwnerImplCopyWith(
    _$AssignOwnerImpl value,
    $Res Function(_$AssignOwnerImpl) then,
  ) = __$$AssignOwnerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String apartmentId,
    String ownerId,
    String ownerName,
    String? ownerEmail,
    String? ownerPhone,
  });
}

/// @nodoc
class __$$AssignOwnerImplCopyWithImpl<$Res>
    extends _$ApartmentEventCopyWithImpl<$Res, _$AssignOwnerImpl>
    implements _$$AssignOwnerImplCopyWith<$Res> {
  __$$AssignOwnerImplCopyWithImpl(
    _$AssignOwnerImpl _value,
    $Res Function(_$AssignOwnerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apartmentId = null,
    Object? ownerId = null,
    Object? ownerName = null,
    Object? ownerEmail = freezed,
    Object? ownerPhone = freezed,
  }) {
    return _then(
      _$AssignOwnerImpl(
        apartmentId: null == apartmentId
            ? _value.apartmentId
            : apartmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        ownerId: null == ownerId
            ? _value.ownerId
            : ownerId // ignore: cast_nullable_to_non_nullable
                  as String,
        ownerName: null == ownerName
            ? _value.ownerName
            : ownerName // ignore: cast_nullable_to_non_nullable
                  as String,
        ownerEmail: freezed == ownerEmail
            ? _value.ownerEmail
            : ownerEmail // ignore: cast_nullable_to_non_nullable
                  as String?,
        ownerPhone: freezed == ownerPhone
            ? _value.ownerPhone
            : ownerPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AssignOwnerImpl implements AssignOwner {
  const _$AssignOwnerImpl({
    required this.apartmentId,
    required this.ownerId,
    required this.ownerName,
    this.ownerEmail,
    this.ownerPhone,
  });

  @override
  final String apartmentId;
  @override
  final String ownerId;
  @override
  final String ownerName;
  @override
  final String? ownerEmail;
  @override
  final String? ownerPhone;

  @override
  String toString() {
    return 'ApartmentEvent.assignOwner(apartmentId: $apartmentId, ownerId: $ownerId, ownerName: $ownerName, ownerEmail: $ownerEmail, ownerPhone: $ownerPhone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignOwnerImpl &&
            (identical(other.apartmentId, apartmentId) ||
                other.apartmentId == apartmentId) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.ownerEmail, ownerEmail) ||
                other.ownerEmail == ownerEmail) &&
            (identical(other.ownerPhone, ownerPhone) ||
                other.ownerPhone == ownerPhone));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    apartmentId,
    ownerId,
    ownerName,
    ownerEmail,
    ownerPhone,
  );

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignOwnerImplCopyWith<_$AssignOwnerImpl> get copyWith =>
      __$$AssignOwnerImplCopyWithImpl<_$AssignOwnerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String condominiumId) loadApartments,
    required TResult Function(String floorId) loadApartmentsByFloor,
    required TResult Function(Apartment apartment) createApartment,
    required TResult Function(Apartment apartment) updateApartment,
    required TResult Function(String apartmentId) deleteApartment,
    required TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )
    assignOwner,
    required TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )
    updateStatus,
  }) {
    return assignOwner(apartmentId, ownerId, ownerName, ownerEmail, ownerPhone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String condominiumId)? loadApartments,
    TResult? Function(String floorId)? loadApartmentsByFloor,
    TResult? Function(Apartment apartment)? createApartment,
    TResult? Function(Apartment apartment)? updateApartment,
    TResult? Function(String apartmentId)? deleteApartment,
    TResult? Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult? Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
  }) {
    return assignOwner?.call(
      apartmentId,
      ownerId,
      ownerName,
      ownerEmail,
      ownerPhone,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String condominiumId)? loadApartments,
    TResult Function(String floorId)? loadApartmentsByFloor,
    TResult Function(Apartment apartment)? createApartment,
    TResult Function(Apartment apartment)? updateApartment,
    TResult Function(String apartmentId)? deleteApartment,
    TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
    required TResult orElse(),
  }) {
    if (assignOwner != null) {
      return assignOwner(
        apartmentId,
        ownerId,
        ownerName,
        ownerEmail,
        ownerPhone,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadApartments value) loadApartments,
    required TResult Function(LoadApartmentsByFloor value)
    loadApartmentsByFloor,
    required TResult Function(CreateApartment value) createApartment,
    required TResult Function(UpdateApartment value) updateApartment,
    required TResult Function(DeleteApartment value) deleteApartment,
    required TResult Function(AssignOwner value) assignOwner,
    required TResult Function(UpdateStatus value) updateStatus,
  }) {
    return assignOwner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadApartments value)? loadApartments,
    TResult? Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult? Function(CreateApartment value)? createApartment,
    TResult? Function(UpdateApartment value)? updateApartment,
    TResult? Function(DeleteApartment value)? deleteApartment,
    TResult? Function(AssignOwner value)? assignOwner,
    TResult? Function(UpdateStatus value)? updateStatus,
  }) {
    return assignOwner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadApartments value)? loadApartments,
    TResult Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult Function(CreateApartment value)? createApartment,
    TResult Function(UpdateApartment value)? updateApartment,
    TResult Function(DeleteApartment value)? deleteApartment,
    TResult Function(AssignOwner value)? assignOwner,
    TResult Function(UpdateStatus value)? updateStatus,
    required TResult orElse(),
  }) {
    if (assignOwner != null) {
      return assignOwner(this);
    }
    return orElse();
  }
}

abstract class AssignOwner implements ApartmentEvent {
  const factory AssignOwner({
    required final String apartmentId,
    required final String ownerId,
    required final String ownerName,
    final String? ownerEmail,
    final String? ownerPhone,
  }) = _$AssignOwnerImpl;

  String get apartmentId;
  String get ownerId;
  String get ownerName;
  String? get ownerEmail;
  String? get ownerPhone;

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssignOwnerImplCopyWith<_$AssignOwnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateStatusImplCopyWith<$Res> {
  factory _$$UpdateStatusImplCopyWith(
    _$UpdateStatusImpl value,
    $Res Function(_$UpdateStatusImpl) then,
  ) = __$$UpdateStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String apartmentId,
    ApartmentStatus status,
    DateTime? vacantFrom,
    DateTime? availableFrom,
  });
}

/// @nodoc
class __$$UpdateStatusImplCopyWithImpl<$Res>
    extends _$ApartmentEventCopyWithImpl<$Res, _$UpdateStatusImpl>
    implements _$$UpdateStatusImplCopyWith<$Res> {
  __$$UpdateStatusImplCopyWithImpl(
    _$UpdateStatusImpl _value,
    $Res Function(_$UpdateStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apartmentId = null,
    Object? status = null,
    Object? vacantFrom = freezed,
    Object? availableFrom = freezed,
  }) {
    return _then(
      _$UpdateStatusImpl(
        apartmentId: null == apartmentId
            ? _value.apartmentId
            : apartmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ApartmentStatus,
        vacantFrom: freezed == vacantFrom
            ? _value.vacantFrom
            : vacantFrom // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        availableFrom: freezed == availableFrom
            ? _value.availableFrom
            : availableFrom // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$UpdateStatusImpl implements UpdateStatus {
  const _$UpdateStatusImpl({
    required this.apartmentId,
    required this.status,
    this.vacantFrom,
    this.availableFrom,
  });

  @override
  final String apartmentId;
  @override
  final ApartmentStatus status;
  @override
  final DateTime? vacantFrom;
  @override
  final DateTime? availableFrom;

  @override
  String toString() {
    return 'ApartmentEvent.updateStatus(apartmentId: $apartmentId, status: $status, vacantFrom: $vacantFrom, availableFrom: $availableFrom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStatusImpl &&
            (identical(other.apartmentId, apartmentId) ||
                other.apartmentId == apartmentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.vacantFrom, vacantFrom) ||
                other.vacantFrom == vacantFrom) &&
            (identical(other.availableFrom, availableFrom) ||
                other.availableFrom == availableFrom));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, apartmentId, status, vacantFrom, availableFrom);

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStatusImplCopyWith<_$UpdateStatusImpl> get copyWith =>
      __$$UpdateStatusImplCopyWithImpl<_$UpdateStatusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String condominiumId) loadApartments,
    required TResult Function(String floorId) loadApartmentsByFloor,
    required TResult Function(Apartment apartment) createApartment,
    required TResult Function(Apartment apartment) updateApartment,
    required TResult Function(String apartmentId) deleteApartment,
    required TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )
    assignOwner,
    required TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )
    updateStatus,
  }) {
    return updateStatus(apartmentId, status, vacantFrom, availableFrom);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String condominiumId)? loadApartments,
    TResult? Function(String floorId)? loadApartmentsByFloor,
    TResult? Function(Apartment apartment)? createApartment,
    TResult? Function(Apartment apartment)? updateApartment,
    TResult? Function(String apartmentId)? deleteApartment,
    TResult? Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult? Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
  }) {
    return updateStatus?.call(apartmentId, status, vacantFrom, availableFrom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String condominiumId)? loadApartments,
    TResult Function(String floorId)? loadApartmentsByFloor,
    TResult Function(Apartment apartment)? createApartment,
    TResult Function(Apartment apartment)? updateApartment,
    TResult Function(String apartmentId)? deleteApartment,
    TResult Function(
      String apartmentId,
      String ownerId,
      String ownerName,
      String? ownerEmail,
      String? ownerPhone,
    )?
    assignOwner,
    TResult Function(
      String apartmentId,
      ApartmentStatus status,
      DateTime? vacantFrom,
      DateTime? availableFrom,
    )?
    updateStatus,
    required TResult orElse(),
  }) {
    if (updateStatus != null) {
      return updateStatus(apartmentId, status, vacantFrom, availableFrom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadApartments value) loadApartments,
    required TResult Function(LoadApartmentsByFloor value)
    loadApartmentsByFloor,
    required TResult Function(CreateApartment value) createApartment,
    required TResult Function(UpdateApartment value) updateApartment,
    required TResult Function(DeleteApartment value) deleteApartment,
    required TResult Function(AssignOwner value) assignOwner,
    required TResult Function(UpdateStatus value) updateStatus,
  }) {
    return updateStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadApartments value)? loadApartments,
    TResult? Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult? Function(CreateApartment value)? createApartment,
    TResult? Function(UpdateApartment value)? updateApartment,
    TResult? Function(DeleteApartment value)? deleteApartment,
    TResult? Function(AssignOwner value)? assignOwner,
    TResult? Function(UpdateStatus value)? updateStatus,
  }) {
    return updateStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadApartments value)? loadApartments,
    TResult Function(LoadApartmentsByFloor value)? loadApartmentsByFloor,
    TResult Function(CreateApartment value)? createApartment,
    TResult Function(UpdateApartment value)? updateApartment,
    TResult Function(DeleteApartment value)? deleteApartment,
    TResult Function(AssignOwner value)? assignOwner,
    TResult Function(UpdateStatus value)? updateStatus,
    required TResult orElse(),
  }) {
    if (updateStatus != null) {
      return updateStatus(this);
    }
    return orElse();
  }
}

abstract class UpdateStatus implements ApartmentEvent {
  const factory UpdateStatus({
    required final String apartmentId,
    required final ApartmentStatus status,
    final DateTime? vacantFrom,
    final DateTime? availableFrom,
  }) = _$UpdateStatusImpl;

  String get apartmentId;
  ApartmentStatus get status;
  DateTime? get vacantFrom;
  DateTime? get availableFrom;

  /// Create a copy of ApartmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateStatusImplCopyWith<_$UpdateStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
