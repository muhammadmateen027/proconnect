// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FloorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String condominiumId) loadFloors,
    required TResult Function(
      String condominiumId,
      String agencyId,
      int floorNumber,
      String? floorName,
      int? totalApartments,
      String? description,
      List<String>? amenities,
    )
    createFloor,
    required TResult Function(Floor floor) updateFloor,
    required TResult Function(String floorId) deleteFloor,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String condominiumId)? loadFloors,
    TResult? Function(
      String condominiumId,
      String agencyId,
      int floorNumber,
      String? floorName,
      int? totalApartments,
      String? description,
      List<String>? amenities,
    )?
    createFloor,
    TResult? Function(Floor floor)? updateFloor,
    TResult? Function(String floorId)? deleteFloor,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String condominiumId)? loadFloors,
    TResult Function(
      String condominiumId,
      String agencyId,
      int floorNumber,
      String? floorName,
      int? totalApartments,
      String? description,
      List<String>? amenities,
    )?
    createFloor,
    TResult Function(Floor floor)? updateFloor,
    TResult Function(String floorId)? deleteFloor,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadFloors value) loadFloors,
    required TResult Function(CreateFloor value) createFloor,
    required TResult Function(UpdateFloor value) updateFloor,
    required TResult Function(DeleteFloor value) deleteFloor,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadFloors value)? loadFloors,
    TResult? Function(CreateFloor value)? createFloor,
    TResult? Function(UpdateFloor value)? updateFloor,
    TResult? Function(DeleteFloor value)? deleteFloor,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadFloors value)? loadFloors,
    TResult Function(CreateFloor value)? createFloor,
    TResult Function(UpdateFloor value)? updateFloor,
    TResult Function(DeleteFloor value)? deleteFloor,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorEventCopyWith<$Res> {
  factory $FloorEventCopyWith(
    FloorEvent value,
    $Res Function(FloorEvent) then,
  ) = _$FloorEventCopyWithImpl<$Res, FloorEvent>;
}

/// @nodoc
class _$FloorEventCopyWithImpl<$Res, $Val extends FloorEvent>
    implements $FloorEventCopyWith<$Res> {
  _$FloorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadFloorsImplCopyWith<$Res> {
  factory _$$LoadFloorsImplCopyWith(
    _$LoadFloorsImpl value,
    $Res Function(_$LoadFloorsImpl) then,
  ) = __$$LoadFloorsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String condominiumId});
}

/// @nodoc
class __$$LoadFloorsImplCopyWithImpl<$Res>
    extends _$FloorEventCopyWithImpl<$Res, _$LoadFloorsImpl>
    implements _$$LoadFloorsImplCopyWith<$Res> {
  __$$LoadFloorsImplCopyWithImpl(
    _$LoadFloorsImpl _value,
    $Res Function(_$LoadFloorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? condominiumId = null}) {
    return _then(
      _$LoadFloorsImpl(
        condominiumId: null == condominiumId
            ? _value.condominiumId
            : condominiumId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadFloorsImpl implements LoadFloors {
  const _$LoadFloorsImpl({required this.condominiumId});

  @override
  final String condominiumId;

  @override
  String toString() {
    return 'FloorEvent.loadFloors(condominiumId: $condominiumId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFloorsImpl &&
            (identical(other.condominiumId, condominiumId) ||
                other.condominiumId == condominiumId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, condominiumId);

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFloorsImplCopyWith<_$LoadFloorsImpl> get copyWith =>
      __$$LoadFloorsImplCopyWithImpl<_$LoadFloorsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String condominiumId) loadFloors,
    required TResult Function(
      String condominiumId,
      String agencyId,
      int floorNumber,
      String? floorName,
      int? totalApartments,
      String? description,
      List<String>? amenities,
    )
    createFloor,
    required TResult Function(Floor floor) updateFloor,
    required TResult Function(String floorId) deleteFloor,
  }) {
    return loadFloors(condominiumId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String condominiumId)? loadFloors,
    TResult? Function(
      String condominiumId,
      String agencyId,
      int floorNumber,
      String? floorName,
      int? totalApartments,
      String? description,
      List<String>? amenities,
    )?
    createFloor,
    TResult? Function(Floor floor)? updateFloor,
    TResult? Function(String floorId)? deleteFloor,
  }) {
    return loadFloors?.call(condominiumId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String condominiumId)? loadFloors,
    TResult Function(
      String condominiumId,
      String agencyId,
      int floorNumber,
      String? floorName,
      int? totalApartments,
      String? description,
      List<String>? amenities,
    )?
    createFloor,
    TResult Function(Floor floor)? updateFloor,
    TResult Function(String floorId)? deleteFloor,
    required TResult orElse(),
  }) {
    if (loadFloors != null) {
      return loadFloors(condominiumId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadFloors value) loadFloors,
    required TResult Function(CreateFloor value) createFloor,
    required TResult Function(UpdateFloor value) updateFloor,
    required TResult Function(DeleteFloor value) deleteFloor,
  }) {
    return loadFloors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadFloors value)? loadFloors,
    TResult? Function(CreateFloor value)? createFloor,
    TResult? Function(UpdateFloor value)? updateFloor,
    TResult? Function(DeleteFloor value)? deleteFloor,
  }) {
    return loadFloors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadFloors value)? loadFloors,
    TResult Function(CreateFloor value)? createFloor,
    TResult Function(UpdateFloor value)? updateFloor,
    TResult Function(DeleteFloor value)? deleteFloor,
    required TResult orElse(),
  }) {
    if (loadFloors != null) {
      return loadFloors(this);
    }
    return orElse();
  }
}

abstract class LoadFloors implements FloorEvent {
  const factory LoadFloors({required final String condominiumId}) =
      _$LoadFloorsImpl;

  String get condominiumId;

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadFloorsImplCopyWith<_$LoadFloorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFloorImplCopyWith<$Res> {
  factory _$$CreateFloorImplCopyWith(
    _$CreateFloorImpl value,
    $Res Function(_$CreateFloorImpl) then,
  ) = __$$CreateFloorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String condominiumId,
    String agencyId,
    int floorNumber,
    String? floorName,
    int? totalApartments,
    String? description,
    List<String>? amenities,
  });
}

/// @nodoc
class __$$CreateFloorImplCopyWithImpl<$Res>
    extends _$FloorEventCopyWithImpl<$Res, _$CreateFloorImpl>
    implements _$$CreateFloorImplCopyWith<$Res> {
  __$$CreateFloorImplCopyWithImpl(
    _$CreateFloorImpl _value,
    $Res Function(_$CreateFloorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condominiumId = null,
    Object? agencyId = null,
    Object? floorNumber = null,
    Object? floorName = freezed,
    Object? totalApartments = freezed,
    Object? description = freezed,
    Object? amenities = freezed,
  }) {
    return _then(
      _$CreateFloorImpl(
        condominiumId: null == condominiumId
            ? _value.condominiumId
            : condominiumId // ignore: cast_nullable_to_non_nullable
                  as String,
        agencyId: null == agencyId
            ? _value.agencyId
            : agencyId // ignore: cast_nullable_to_non_nullable
                  as String,
        floorNumber: null == floorNumber
            ? _value.floorNumber
            : floorNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        floorName: freezed == floorName
            ? _value.floorName
            : floorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalApartments: freezed == totalApartments
            ? _value.totalApartments
            : totalApartments // ignore: cast_nullable_to_non_nullable
                  as int?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        amenities: freezed == amenities
            ? _value._amenities
            : amenities // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc

class _$CreateFloorImpl implements CreateFloor {
  const _$CreateFloorImpl({
    required this.condominiumId,
    required this.agencyId,
    required this.floorNumber,
    this.floorName,
    this.totalApartments,
    this.description,
    final List<String>? amenities,
  }) : _amenities = amenities;

  @override
  final String condominiumId;
  @override
  final String agencyId;
  @override
  final int floorNumber;
  @override
  final String? floorName;
  @override
  final int? totalApartments;
  @override
  final String? description;
  final List<String>? _amenities;
  @override
  List<String>? get amenities {
    final value = _amenities;
    if (value == null) return null;
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FloorEvent.createFloor(condominiumId: $condominiumId, agencyId: $agencyId, floorNumber: $floorNumber, floorName: $floorName, totalApartments: $totalApartments, description: $description, amenities: $amenities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFloorImpl &&
            (identical(other.condominiumId, condominiumId) ||
                other.condominiumId == condominiumId) &&
            (identical(other.agencyId, agencyId) ||
                other.agencyId == agencyId) &&
            (identical(other.floorNumber, floorNumber) ||
                other.floorNumber == floorNumber) &&
            (identical(other.floorName, floorName) ||
                other.floorName == floorName) &&
            (identical(other.totalApartments, totalApartments) ||
                other.totalApartments == totalApartments) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._amenities,
              _amenities,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    condominiumId,
    agencyId,
    floorNumber,
    floorName,
    totalApartments,
    description,
    const DeepCollectionEquality().hash(_amenities),
  );

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFloorImplCopyWith<_$CreateFloorImpl> get copyWith =>
      __$$CreateFloorImplCopyWithImpl<_$CreateFloorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String condominiumId) loadFloors,
    required TResult Function(
      String condominiumId,
      String agencyId,
      int floorNumber,
      String? floorName,
      int? totalApartments,
      String? description,
      List<String>? amenities,
    )
    createFloor,
    required TResult Function(Floor floor) updateFloor,
    required TResult Function(String floorId) deleteFloor,
  }) {
    return createFloor(
      condominiumId,
      agencyId,
      floorNumber,
      floorName,
      totalApartments,
      description,
      amenities,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String condominiumId)? loadFloors,
    TResult? Function(
      String condominiumId,
      String agencyId,
      int floorNumber,
      String? floorName,
      int? totalApartments,
      String? description,
      List<String>? amenities,
    )?
    createFloor,
    TResult? Function(Floor floor)? updateFloor,
    TResult? Function(String floorId)? deleteFloor,
  }) {
    return createFloor?.call(
      condominiumId,
      agencyId,
      floorNumber,
      floorName,
      totalApartments,
      description,
      amenities,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String condominiumId)? loadFloors,
    TResult Function(
      String condominiumId,
      String agencyId,
      int floorNumber,
      String? floorName,
      int? totalApartments,
      String? description,
      List<String>? amenities,
    )?
    createFloor,
    TResult Function(Floor floor)? updateFloor,
    TResult Function(String floorId)? deleteFloor,
    required TResult orElse(),
  }) {
    if (createFloor != null) {
      return createFloor(
        condominiumId,
        agencyId,
        floorNumber,
        floorName,
        totalApartments,
        description,
        amenities,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadFloors value) loadFloors,
    required TResult Function(CreateFloor value) createFloor,
    required TResult Function(UpdateFloor value) updateFloor,
    required TResult Function(DeleteFloor value) deleteFloor,
  }) {
    return createFloor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadFloors value)? loadFloors,
    TResult? Function(CreateFloor value)? createFloor,
    TResult? Function(UpdateFloor value)? updateFloor,
    TResult? Function(DeleteFloor value)? deleteFloor,
  }) {
    return createFloor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadFloors value)? loadFloors,
    TResult Function(CreateFloor value)? createFloor,
    TResult Function(UpdateFloor value)? updateFloor,
    TResult Function(DeleteFloor value)? deleteFloor,
    required TResult orElse(),
  }) {
    if (createFloor != null) {
      return createFloor(this);
    }
    return orElse();
  }
}

abstract class CreateFloor implements FloorEvent {
  const factory CreateFloor({
    required final String condominiumId,
    required final String agencyId,
    required final int floorNumber,
    final String? floorName,
    final int? totalApartments,
    final String? description,
    final List<String>? amenities,
  }) = _$CreateFloorImpl;

  String get condominiumId;
  String get agencyId;
  int get floorNumber;
  String? get floorName;
  int? get totalApartments;
  String? get description;
  List<String>? get amenities;

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFloorImplCopyWith<_$CreateFloorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateFloorImplCopyWith<$Res> {
  factory _$$UpdateFloorImplCopyWith(
    _$UpdateFloorImpl value,
    $Res Function(_$UpdateFloorImpl) then,
  ) = __$$UpdateFloorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Floor floor});

  $FloorCopyWith<$Res> get floor;
}

/// @nodoc
class __$$UpdateFloorImplCopyWithImpl<$Res>
    extends _$FloorEventCopyWithImpl<$Res, _$UpdateFloorImpl>
    implements _$$UpdateFloorImplCopyWith<$Res> {
  __$$UpdateFloorImplCopyWithImpl(
    _$UpdateFloorImpl _value,
    $Res Function(_$UpdateFloorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? floor = null}) {
    return _then(
      _$UpdateFloorImpl(
        floor: null == floor
            ? _value.floor
            : floor // ignore: cast_nullable_to_non_nullable
                  as Floor,
      ),
    );
  }

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FloorCopyWith<$Res> get floor {
    return $FloorCopyWith<$Res>(_value.floor, (value) {
      return _then(_value.copyWith(floor: value));
    });
  }
}

/// @nodoc

class _$UpdateFloorImpl implements UpdateFloor {
  const _$UpdateFloorImpl({required this.floor});

  @override
  final Floor floor;

  @override
  String toString() {
    return 'FloorEvent.updateFloor(floor: $floor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFloorImpl &&
            (identical(other.floor, floor) || other.floor == floor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, floor);

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFloorImplCopyWith<_$UpdateFloorImpl> get copyWith =>
      __$$UpdateFloorImplCopyWithImpl<_$UpdateFloorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String condominiumId) loadFloors,
    required TResult Function(
      String condominiumId,
      String agencyId,
      int floorNumber,
      String? floorName,
      int? totalApartments,
      String? description,
      List<String>? amenities,
    )
    createFloor,
    required TResult Function(Floor floor) updateFloor,
    required TResult Function(String floorId) deleteFloor,
  }) {
    return updateFloor(floor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String condominiumId)? loadFloors,
    TResult? Function(
      String condominiumId,
      String agencyId,
      int floorNumber,
      String? floorName,
      int? totalApartments,
      String? description,
      List<String>? amenities,
    )?
    createFloor,
    TResult? Function(Floor floor)? updateFloor,
    TResult? Function(String floorId)? deleteFloor,
  }) {
    return updateFloor?.call(floor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String condominiumId)? loadFloors,
    TResult Function(
      String condominiumId,
      String agencyId,
      int floorNumber,
      String? floorName,
      int? totalApartments,
      String? description,
      List<String>? amenities,
    )?
    createFloor,
    TResult Function(Floor floor)? updateFloor,
    TResult Function(String floorId)? deleteFloor,
    required TResult orElse(),
  }) {
    if (updateFloor != null) {
      return updateFloor(floor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadFloors value) loadFloors,
    required TResult Function(CreateFloor value) createFloor,
    required TResult Function(UpdateFloor value) updateFloor,
    required TResult Function(DeleteFloor value) deleteFloor,
  }) {
    return updateFloor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadFloors value)? loadFloors,
    TResult? Function(CreateFloor value)? createFloor,
    TResult? Function(UpdateFloor value)? updateFloor,
    TResult? Function(DeleteFloor value)? deleteFloor,
  }) {
    return updateFloor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadFloors value)? loadFloors,
    TResult Function(CreateFloor value)? createFloor,
    TResult Function(UpdateFloor value)? updateFloor,
    TResult Function(DeleteFloor value)? deleteFloor,
    required TResult orElse(),
  }) {
    if (updateFloor != null) {
      return updateFloor(this);
    }
    return orElse();
  }
}

abstract class UpdateFloor implements FloorEvent {
  const factory UpdateFloor({required final Floor floor}) = _$UpdateFloorImpl;

  Floor get floor;

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateFloorImplCopyWith<_$UpdateFloorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteFloorImplCopyWith<$Res> {
  factory _$$DeleteFloorImplCopyWith(
    _$DeleteFloorImpl value,
    $Res Function(_$DeleteFloorImpl) then,
  ) = __$$DeleteFloorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String floorId});
}

/// @nodoc
class __$$DeleteFloorImplCopyWithImpl<$Res>
    extends _$FloorEventCopyWithImpl<$Res, _$DeleteFloorImpl>
    implements _$$DeleteFloorImplCopyWith<$Res> {
  __$$DeleteFloorImplCopyWithImpl(
    _$DeleteFloorImpl _value,
    $Res Function(_$DeleteFloorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? floorId = null}) {
    return _then(
      _$DeleteFloorImpl(
        floorId: null == floorId
            ? _value.floorId
            : floorId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteFloorImpl implements DeleteFloor {
  const _$DeleteFloorImpl({required this.floorId});

  @override
  final String floorId;

  @override
  String toString() {
    return 'FloorEvent.deleteFloor(floorId: $floorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteFloorImpl &&
            (identical(other.floorId, floorId) || other.floorId == floorId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, floorId);

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteFloorImplCopyWith<_$DeleteFloorImpl> get copyWith =>
      __$$DeleteFloorImplCopyWithImpl<_$DeleteFloorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String condominiumId) loadFloors,
    required TResult Function(
      String condominiumId,
      String agencyId,
      int floorNumber,
      String? floorName,
      int? totalApartments,
      String? description,
      List<String>? amenities,
    )
    createFloor,
    required TResult Function(Floor floor) updateFloor,
    required TResult Function(String floorId) deleteFloor,
  }) {
    return deleteFloor(floorId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String condominiumId)? loadFloors,
    TResult? Function(
      String condominiumId,
      String agencyId,
      int floorNumber,
      String? floorName,
      int? totalApartments,
      String? description,
      List<String>? amenities,
    )?
    createFloor,
    TResult? Function(Floor floor)? updateFloor,
    TResult? Function(String floorId)? deleteFloor,
  }) {
    return deleteFloor?.call(floorId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String condominiumId)? loadFloors,
    TResult Function(
      String condominiumId,
      String agencyId,
      int floorNumber,
      String? floorName,
      int? totalApartments,
      String? description,
      List<String>? amenities,
    )?
    createFloor,
    TResult Function(Floor floor)? updateFloor,
    TResult Function(String floorId)? deleteFloor,
    required TResult orElse(),
  }) {
    if (deleteFloor != null) {
      return deleteFloor(floorId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadFloors value) loadFloors,
    required TResult Function(CreateFloor value) createFloor,
    required TResult Function(UpdateFloor value) updateFloor,
    required TResult Function(DeleteFloor value) deleteFloor,
  }) {
    return deleteFloor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadFloors value)? loadFloors,
    TResult? Function(CreateFloor value)? createFloor,
    TResult? Function(UpdateFloor value)? updateFloor,
    TResult? Function(DeleteFloor value)? deleteFloor,
  }) {
    return deleteFloor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadFloors value)? loadFloors,
    TResult Function(CreateFloor value)? createFloor,
    TResult Function(UpdateFloor value)? updateFloor,
    TResult Function(DeleteFloor value)? deleteFloor,
    required TResult orElse(),
  }) {
    if (deleteFloor != null) {
      return deleteFloor(this);
    }
    return orElse();
  }
}

abstract class DeleteFloor implements FloorEvent {
  const factory DeleteFloor({required final String floorId}) =
      _$DeleteFloorImpl;

  String get floorId;

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteFloorImplCopyWith<_$DeleteFloorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
