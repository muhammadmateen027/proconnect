// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Floor _$FloorFromJson(Map<String, dynamic> json) {
  return _Floor.fromJson(json);
}

/// @nodoc
mixin _$Floor {
  String get id => throw _privateConstructorUsedError;
  String get condominiumId => throw _privateConstructorUsedError;
  String get agencyId => throw _privateConstructorUsedError;
  int get floorNumber => throw _privateConstructorUsedError;
  String? get floorName =>
      throw _privateConstructorUsedError; // e.g., "Ground Floor", "Penthouse Level"
  int? get totalApartments => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get amenities =>
      throw _privateConstructorUsedError; // Floor-specific amenities
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Floor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Floor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FloorCopyWith<Floor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorCopyWith<$Res> {
  factory $FloorCopyWith(Floor value, $Res Function(Floor) then) =
      _$FloorCopyWithImpl<$Res, Floor>;
  @useResult
  $Res call({
    String id,
    String condominiumId,
    String agencyId,
    int floorNumber,
    String? floorName,
    int? totalApartments,
    String? description,
    List<String> amenities,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$FloorCopyWithImpl<$Res, $Val extends Floor>
    implements $FloorCopyWith<$Res> {
  _$FloorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Floor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? condominiumId = null,
    Object? agencyId = null,
    Object? floorNumber = null,
    Object? floorName = freezed,
    Object? totalApartments = freezed,
    Object? description = freezed,
    Object? amenities = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
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
            amenities: null == amenities
                ? _value.amenities
                : amenities // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FloorImplCopyWith<$Res> implements $FloorCopyWith<$Res> {
  factory _$$FloorImplCopyWith(
    _$FloorImpl value,
    $Res Function(_$FloorImpl) then,
  ) = __$$FloorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String condominiumId,
    String agencyId,
    int floorNumber,
    String? floorName,
    int? totalApartments,
    String? description,
    List<String> amenities,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$FloorImplCopyWithImpl<$Res>
    extends _$FloorCopyWithImpl<$Res, _$FloorImpl>
    implements _$$FloorImplCopyWith<$Res> {
  __$$FloorImplCopyWithImpl(
    _$FloorImpl _value,
    $Res Function(_$FloorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Floor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? condominiumId = null,
    Object? agencyId = null,
    Object? floorNumber = null,
    Object? floorName = freezed,
    Object? totalApartments = freezed,
    Object? description = freezed,
    Object? amenities = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$FloorImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
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
        amenities: null == amenities
            ? _value._amenities
            : amenities // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FloorImpl implements _Floor {
  const _$FloorImpl({
    required this.id,
    required this.condominiumId,
    required this.agencyId,
    required this.floorNumber,
    this.floorName,
    this.totalApartments,
    this.description,
    final List<String> amenities = const [],
    this.createdAt,
    this.updatedAt,
  }) : _amenities = amenities;

  factory _$FloorImpl.fromJson(Map<String, dynamic> json) =>
      _$$FloorImplFromJson(json);

  @override
  final String id;
  @override
  final String condominiumId;
  @override
  final String agencyId;
  @override
  final int floorNumber;
  @override
  final String? floorName;
  // e.g., "Ground Floor", "Penthouse Level"
  @override
  final int? totalApartments;
  @override
  final String? description;
  final List<String> _amenities;
  @override
  @JsonKey()
  List<String> get amenities {
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_amenities);
  }

  // Floor-specific amenities
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Floor(id: $id, condominiumId: $condominiumId, agencyId: $agencyId, floorNumber: $floorNumber, floorName: $floorName, totalApartments: $totalApartments, description: $description, amenities: $amenities, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorImpl &&
            (identical(other.id, id) || other.id == id) &&
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
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    condominiumId,
    agencyId,
    floorNumber,
    floorName,
    totalApartments,
    description,
    const DeepCollectionEquality().hash(_amenities),
    createdAt,
    updatedAt,
  );

  /// Create a copy of Floor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FloorImplCopyWith<_$FloorImpl> get copyWith =>
      __$$FloorImplCopyWithImpl<_$FloorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FloorImplToJson(this);
  }
}

abstract class _Floor implements Floor {
  const factory _Floor({
    required final String id,
    required final String condominiumId,
    required final String agencyId,
    required final int floorNumber,
    final String? floorName,
    final int? totalApartments,
    final String? description,
    final List<String> amenities,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$FloorImpl;

  factory _Floor.fromJson(Map<String, dynamic> json) = _$FloorImpl.fromJson;

  @override
  String get id;
  @override
  String get condominiumId;
  @override
  String get agencyId;
  @override
  int get floorNumber;
  @override
  String? get floorName; // e.g., "Ground Floor", "Penthouse Level"
  @override
  int? get totalApartments;
  @override
  String? get description;
  @override
  List<String> get amenities; // Floor-specific amenities
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Floor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FloorImplCopyWith<_$FloorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
