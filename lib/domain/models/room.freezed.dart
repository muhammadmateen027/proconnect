// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Room _$RoomFromJson(Map<String, dynamic> json) {
  return _Room.fromJson(json);
}

/// @nodoc
mixin _$Room {
  String get id => throw _privateConstructorUsedError;
  RoomType get type => throw _privateConstructorUsedError;
  double get sizeSquareFeet => throw _privateConstructorUsedError;
  String? get name =>
      throw _privateConstructorUsedError; // Custom name for the room
  String? get description => throw _privateConstructorUsedError;
  bool get hasWindow => throw _privateConstructorUsedError;
  bool get hasBalcony => throw _privateConstructorUsedError;
  bool get hasAttachedBathroom => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this Room to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoomCopyWith<Room> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) then) =
      _$RoomCopyWithImpl<$Res, Room>;
  @useResult
  $Res call({
    String id,
    RoomType type,
    double sizeSquareFeet,
    String? name,
    String? description,
    bool hasWindow,
    bool hasBalcony,
    bool hasAttachedBathroom,
    String? notes,
  });
}

/// @nodoc
class _$RoomCopyWithImpl<$Res, $Val extends Room>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? sizeSquareFeet = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? hasWindow = null,
    Object? hasBalcony = null,
    Object? hasAttachedBathroom = null,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as RoomType,
            sizeSquareFeet: null == sizeSquareFeet
                ? _value.sizeSquareFeet
                : sizeSquareFeet // ignore: cast_nullable_to_non_nullable
                      as double,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            hasWindow: null == hasWindow
                ? _value.hasWindow
                : hasWindow // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasBalcony: null == hasBalcony
                ? _value.hasBalcony
                : hasBalcony // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasAttachedBathroom: null == hasAttachedBathroom
                ? _value.hasAttachedBathroom
                : hasAttachedBathroom // ignore: cast_nullable_to_non_nullable
                      as bool,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RoomImplCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$$RoomImplCopyWith(
    _$RoomImpl value,
    $Res Function(_$RoomImpl) then,
  ) = __$$RoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    RoomType type,
    double sizeSquareFeet,
    String? name,
    String? description,
    bool hasWindow,
    bool hasBalcony,
    bool hasAttachedBathroom,
    String? notes,
  });
}

/// @nodoc
class __$$RoomImplCopyWithImpl<$Res>
    extends _$RoomCopyWithImpl<$Res, _$RoomImpl>
    implements _$$RoomImplCopyWith<$Res> {
  __$$RoomImplCopyWithImpl(_$RoomImpl _value, $Res Function(_$RoomImpl) _then)
    : super(_value, _then);

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? sizeSquareFeet = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? hasWindow = null,
    Object? hasBalcony = null,
    Object? hasAttachedBathroom = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$RoomImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as RoomType,
        sizeSquareFeet: null == sizeSquareFeet
            ? _value.sizeSquareFeet
            : sizeSquareFeet // ignore: cast_nullable_to_non_nullable
                  as double,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        hasWindow: null == hasWindow
            ? _value.hasWindow
            : hasWindow // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasBalcony: null == hasBalcony
            ? _value.hasBalcony
            : hasBalcony // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasAttachedBathroom: null == hasAttachedBathroom
            ? _value.hasAttachedBathroom
            : hasAttachedBathroom // ignore: cast_nullable_to_non_nullable
                  as bool,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomImpl implements _Room {
  const _$RoomImpl({
    required this.id,
    required this.type,
    required this.sizeSquareFeet,
    this.name,
    this.description,
    this.hasWindow = false,
    this.hasBalcony = false,
    this.hasAttachedBathroom = false,
    this.notes,
  });

  factory _$RoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomImplFromJson(json);

  @override
  final String id;
  @override
  final RoomType type;
  @override
  final double sizeSquareFeet;
  @override
  final String? name;
  // Custom name for the room
  @override
  final String? description;
  @override
  @JsonKey()
  final bool hasWindow;
  @override
  @JsonKey()
  final bool hasBalcony;
  @override
  @JsonKey()
  final bool hasAttachedBathroom;
  @override
  final String? notes;

  @override
  String toString() {
    return 'Room(id: $id, type: $type, sizeSquareFeet: $sizeSquareFeet, name: $name, description: $description, hasWindow: $hasWindow, hasBalcony: $hasBalcony, hasAttachedBathroom: $hasAttachedBathroom, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sizeSquareFeet, sizeSquareFeet) ||
                other.sizeSquareFeet == sizeSquareFeet) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.hasWindow, hasWindow) ||
                other.hasWindow == hasWindow) &&
            (identical(other.hasBalcony, hasBalcony) ||
                other.hasBalcony == hasBalcony) &&
            (identical(other.hasAttachedBathroom, hasAttachedBathroom) ||
                other.hasAttachedBathroom == hasAttachedBathroom) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    sizeSquareFeet,
    name,
    description,
    hasWindow,
    hasBalcony,
    hasAttachedBathroom,
    notes,
  );

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      __$$RoomImplCopyWithImpl<_$RoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomImplToJson(this);
  }
}

abstract class _Room implements Room {
  const factory _Room({
    required final String id,
    required final RoomType type,
    required final double sizeSquareFeet,
    final String? name,
    final String? description,
    final bool hasWindow,
    final bool hasBalcony,
    final bool hasAttachedBathroom,
    final String? notes,
  }) = _$RoomImpl;

  factory _Room.fromJson(Map<String, dynamic> json) = _$RoomImpl.fromJson;

  @override
  String get id;
  @override
  RoomType get type;
  @override
  double get sizeSquareFeet;
  @override
  String? get name; // Custom name for the room
  @override
  String? get description;
  @override
  bool get hasWindow;
  @override
  bool get hasBalcony;
  @override
  bool get hasAttachedBathroom;
  @override
  String? get notes;

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
