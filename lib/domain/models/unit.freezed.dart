// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Unit _$UnitFromJson(Map<String, dynamic> json) {
  return _Unit.fromJson(json);
}

/// @nodoc
mixin _$Unit {
  String get id => throw _privateConstructorUsedError;
  String get unitNo => throw _privateConstructorUsedError;
  String get condoName => throw _privateConstructorUsedError;
  RentStatus get rentStatus => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError; // Rental Details
  double get rentAmount => throw _privateConstructorUsedError;
  int get rentDueDate => throw _privateConstructorUsedError;
  double get securityDeposit => throw _privateConstructorUsedError;
  List<String> get utilitiesIncluded => throw _privateConstructorUsedError;
  DateTime? get leaseStartDate => throw _privateConstructorUsedError;
  DateTime? get leaseEndDate =>
      throw _privateConstructorUsedError; // Parking Details
  List<String> get allowedParkingSpaces =>
      throw _privateConstructorUsedError; // Unit Specifications
  int get bedrooms => throw _privateConstructorUsedError;
  int get bathrooms => throw _privateConstructorUsedError;
  int get squareFeet => throw _privateConstructorUsedError;
  String? get floorLevel => throw _privateConstructorUsedError;
  FurnishingStatus get furnishing => throw _privateConstructorUsedError;

  /// Serializes this Unit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Unit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnitCopyWith<Unit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitCopyWith<$Res> {
  factory $UnitCopyWith(Unit value, $Res Function(Unit) then) =
      _$UnitCopyWithImpl<$Res, Unit>;
  @useResult
  $Res call({
    String id,
    String unitNo,
    String condoName,
    RentStatus rentStatus,
    String ownerId,
    double rentAmount,
    int rentDueDate,
    double securityDeposit,
    List<String> utilitiesIncluded,
    DateTime? leaseStartDate,
    DateTime? leaseEndDate,
    List<String> allowedParkingSpaces,
    int bedrooms,
    int bathrooms,
    int squareFeet,
    String? floorLevel,
    FurnishingStatus furnishing,
  });
}

/// @nodoc
class _$UnitCopyWithImpl<$Res, $Val extends Unit>
    implements $UnitCopyWith<$Res> {
  _$UnitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Unit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? unitNo = null,
    Object? condoName = null,
    Object? rentStatus = null,
    Object? ownerId = null,
    Object? rentAmount = null,
    Object? rentDueDate = null,
    Object? securityDeposit = null,
    Object? utilitiesIncluded = null,
    Object? leaseStartDate = freezed,
    Object? leaseEndDate = freezed,
    Object? allowedParkingSpaces = null,
    Object? bedrooms = null,
    Object? bathrooms = null,
    Object? squareFeet = null,
    Object? floorLevel = freezed,
    Object? furnishing = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            unitNo: null == unitNo
                ? _value.unitNo
                : unitNo // ignore: cast_nullable_to_non_nullable
                      as String,
            condoName: null == condoName
                ? _value.condoName
                : condoName // ignore: cast_nullable_to_non_nullable
                      as String,
            rentStatus: null == rentStatus
                ? _value.rentStatus
                : rentStatus // ignore: cast_nullable_to_non_nullable
                      as RentStatus,
            ownerId: null == ownerId
                ? _value.ownerId
                : ownerId // ignore: cast_nullable_to_non_nullable
                      as String,
            rentAmount: null == rentAmount
                ? _value.rentAmount
                : rentAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            rentDueDate: null == rentDueDate
                ? _value.rentDueDate
                : rentDueDate // ignore: cast_nullable_to_non_nullable
                      as int,
            securityDeposit: null == securityDeposit
                ? _value.securityDeposit
                : securityDeposit // ignore: cast_nullable_to_non_nullable
                      as double,
            utilitiesIncluded: null == utilitiesIncluded
                ? _value.utilitiesIncluded
                : utilitiesIncluded // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            leaseStartDate: freezed == leaseStartDate
                ? _value.leaseStartDate
                : leaseStartDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            leaseEndDate: freezed == leaseEndDate
                ? _value.leaseEndDate
                : leaseEndDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            allowedParkingSpaces: null == allowedParkingSpaces
                ? _value.allowedParkingSpaces
                : allowedParkingSpaces // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            bedrooms: null == bedrooms
                ? _value.bedrooms
                : bedrooms // ignore: cast_nullable_to_non_nullable
                      as int,
            bathrooms: null == bathrooms
                ? _value.bathrooms
                : bathrooms // ignore: cast_nullable_to_non_nullable
                      as int,
            squareFeet: null == squareFeet
                ? _value.squareFeet
                : squareFeet // ignore: cast_nullable_to_non_nullable
                      as int,
            floorLevel: freezed == floorLevel
                ? _value.floorLevel
                : floorLevel // ignore: cast_nullable_to_non_nullable
                      as String?,
            furnishing: null == furnishing
                ? _value.furnishing
                : furnishing // ignore: cast_nullable_to_non_nullable
                      as FurnishingStatus,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UnitImplCopyWith<$Res> implements $UnitCopyWith<$Res> {
  factory _$$UnitImplCopyWith(
    _$UnitImpl value,
    $Res Function(_$UnitImpl) then,
  ) = __$$UnitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String unitNo,
    String condoName,
    RentStatus rentStatus,
    String ownerId,
    double rentAmount,
    int rentDueDate,
    double securityDeposit,
    List<String> utilitiesIncluded,
    DateTime? leaseStartDate,
    DateTime? leaseEndDate,
    List<String> allowedParkingSpaces,
    int bedrooms,
    int bathrooms,
    int squareFeet,
    String? floorLevel,
    FurnishingStatus furnishing,
  });
}

/// @nodoc
class __$$UnitImplCopyWithImpl<$Res>
    extends _$UnitCopyWithImpl<$Res, _$UnitImpl>
    implements _$$UnitImplCopyWith<$Res> {
  __$$UnitImplCopyWithImpl(_$UnitImpl _value, $Res Function(_$UnitImpl) _then)
    : super(_value, _then);

  /// Create a copy of Unit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? unitNo = null,
    Object? condoName = null,
    Object? rentStatus = null,
    Object? ownerId = null,
    Object? rentAmount = null,
    Object? rentDueDate = null,
    Object? securityDeposit = null,
    Object? utilitiesIncluded = null,
    Object? leaseStartDate = freezed,
    Object? leaseEndDate = freezed,
    Object? allowedParkingSpaces = null,
    Object? bedrooms = null,
    Object? bathrooms = null,
    Object? squareFeet = null,
    Object? floorLevel = freezed,
    Object? furnishing = null,
  }) {
    return _then(
      _$UnitImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        unitNo: null == unitNo
            ? _value.unitNo
            : unitNo // ignore: cast_nullable_to_non_nullable
                  as String,
        condoName: null == condoName
            ? _value.condoName
            : condoName // ignore: cast_nullable_to_non_nullable
                  as String,
        rentStatus: null == rentStatus
            ? _value.rentStatus
            : rentStatus // ignore: cast_nullable_to_non_nullable
                  as RentStatus,
        ownerId: null == ownerId
            ? _value.ownerId
            : ownerId // ignore: cast_nullable_to_non_nullable
                  as String,
        rentAmount: null == rentAmount
            ? _value.rentAmount
            : rentAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        rentDueDate: null == rentDueDate
            ? _value.rentDueDate
            : rentDueDate // ignore: cast_nullable_to_non_nullable
                  as int,
        securityDeposit: null == securityDeposit
            ? _value.securityDeposit
            : securityDeposit // ignore: cast_nullable_to_non_nullable
                  as double,
        utilitiesIncluded: null == utilitiesIncluded
            ? _value._utilitiesIncluded
            : utilitiesIncluded // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        leaseStartDate: freezed == leaseStartDate
            ? _value.leaseStartDate
            : leaseStartDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        leaseEndDate: freezed == leaseEndDate
            ? _value.leaseEndDate
            : leaseEndDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        allowedParkingSpaces: null == allowedParkingSpaces
            ? _value._allowedParkingSpaces
            : allowedParkingSpaces // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        bedrooms: null == bedrooms
            ? _value.bedrooms
            : bedrooms // ignore: cast_nullable_to_non_nullable
                  as int,
        bathrooms: null == bathrooms
            ? _value.bathrooms
            : bathrooms // ignore: cast_nullable_to_non_nullable
                  as int,
        squareFeet: null == squareFeet
            ? _value.squareFeet
            : squareFeet // ignore: cast_nullable_to_non_nullable
                  as int,
        floorLevel: freezed == floorLevel
            ? _value.floorLevel
            : floorLevel // ignore: cast_nullable_to_non_nullable
                  as String?,
        furnishing: null == furnishing
            ? _value.furnishing
            : furnishing // ignore: cast_nullable_to_non_nullable
                  as FurnishingStatus,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UnitImpl implements _Unit {
  const _$UnitImpl({
    required this.id,
    required this.unitNo,
    required this.condoName,
    required this.rentStatus,
    required this.ownerId,
    required this.rentAmount,
    required this.rentDueDate,
    required this.securityDeposit,
    required final List<String> utilitiesIncluded,
    this.leaseStartDate,
    this.leaseEndDate,
    final List<String> allowedParkingSpaces = const [],
    this.bedrooms = 0,
    this.bathrooms = 0,
    this.squareFeet = 0,
    this.floorLevel,
    this.furnishing = FurnishingStatus.none,
  }) : _utilitiesIncluded = utilitiesIncluded,
       _allowedParkingSpaces = allowedParkingSpaces;

  factory _$UnitImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitImplFromJson(json);

  @override
  final String id;
  @override
  final String unitNo;
  @override
  final String condoName;
  @override
  final RentStatus rentStatus;
  @override
  final String ownerId;
  // Rental Details
  @override
  final double rentAmount;
  @override
  final int rentDueDate;
  @override
  final double securityDeposit;
  final List<String> _utilitiesIncluded;
  @override
  List<String> get utilitiesIncluded {
    if (_utilitiesIncluded is EqualUnmodifiableListView)
      return _utilitiesIncluded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_utilitiesIncluded);
  }

  @override
  final DateTime? leaseStartDate;
  @override
  final DateTime? leaseEndDate;
  // Parking Details
  final List<String> _allowedParkingSpaces;
  // Parking Details
  @override
  @JsonKey()
  List<String> get allowedParkingSpaces {
    if (_allowedParkingSpaces is EqualUnmodifiableListView)
      return _allowedParkingSpaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedParkingSpaces);
  }

  // Unit Specifications
  @override
  @JsonKey()
  final int bedrooms;
  @override
  @JsonKey()
  final int bathrooms;
  @override
  @JsonKey()
  final int squareFeet;
  @override
  final String? floorLevel;
  @override
  @JsonKey()
  final FurnishingStatus furnishing;

  @override
  String toString() {
    return 'Unit(id: $id, unitNo: $unitNo, condoName: $condoName, rentStatus: $rentStatus, ownerId: $ownerId, rentAmount: $rentAmount, rentDueDate: $rentDueDate, securityDeposit: $securityDeposit, utilitiesIncluded: $utilitiesIncluded, leaseStartDate: $leaseStartDate, leaseEndDate: $leaseEndDate, allowedParkingSpaces: $allowedParkingSpaces, bedrooms: $bedrooms, bathrooms: $bathrooms, squareFeet: $squareFeet, floorLevel: $floorLevel, furnishing: $furnishing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.unitNo, unitNo) || other.unitNo == unitNo) &&
            (identical(other.condoName, condoName) ||
                other.condoName == condoName) &&
            (identical(other.rentStatus, rentStatus) ||
                other.rentStatus == rentStatus) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.rentAmount, rentAmount) ||
                other.rentAmount == rentAmount) &&
            (identical(other.rentDueDate, rentDueDate) ||
                other.rentDueDate == rentDueDate) &&
            (identical(other.securityDeposit, securityDeposit) ||
                other.securityDeposit == securityDeposit) &&
            const DeepCollectionEquality().equals(
              other._utilitiesIncluded,
              _utilitiesIncluded,
            ) &&
            (identical(other.leaseStartDate, leaseStartDate) ||
                other.leaseStartDate == leaseStartDate) &&
            (identical(other.leaseEndDate, leaseEndDate) ||
                other.leaseEndDate == leaseEndDate) &&
            const DeepCollectionEquality().equals(
              other._allowedParkingSpaces,
              _allowedParkingSpaces,
            ) &&
            (identical(other.bedrooms, bedrooms) ||
                other.bedrooms == bedrooms) &&
            (identical(other.bathrooms, bathrooms) ||
                other.bathrooms == bathrooms) &&
            (identical(other.squareFeet, squareFeet) ||
                other.squareFeet == squareFeet) &&
            (identical(other.floorLevel, floorLevel) ||
                other.floorLevel == floorLevel) &&
            (identical(other.furnishing, furnishing) ||
                other.furnishing == furnishing));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    unitNo,
    condoName,
    rentStatus,
    ownerId,
    rentAmount,
    rentDueDate,
    securityDeposit,
    const DeepCollectionEquality().hash(_utilitiesIncluded),
    leaseStartDate,
    leaseEndDate,
    const DeepCollectionEquality().hash(_allowedParkingSpaces),
    bedrooms,
    bathrooms,
    squareFeet,
    floorLevel,
    furnishing,
  );

  /// Create a copy of Unit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitImplCopyWith<_$UnitImpl> get copyWith =>
      __$$UnitImplCopyWithImpl<_$UnitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitImplToJson(this);
  }
}

abstract class _Unit implements Unit {
  const factory _Unit({
    required final String id,
    required final String unitNo,
    required final String condoName,
    required final RentStatus rentStatus,
    required final String ownerId,
    required final double rentAmount,
    required final int rentDueDate,
    required final double securityDeposit,
    required final List<String> utilitiesIncluded,
    final DateTime? leaseStartDate,
    final DateTime? leaseEndDate,
    final List<String> allowedParkingSpaces,
    final int bedrooms,
    final int bathrooms,
    final int squareFeet,
    final String? floorLevel,
    final FurnishingStatus furnishing,
  }) = _$UnitImpl;

  factory _Unit.fromJson(Map<String, dynamic> json) = _$UnitImpl.fromJson;

  @override
  String get id;
  @override
  String get unitNo;
  @override
  String get condoName;
  @override
  RentStatus get rentStatus;
  @override
  String get ownerId; // Rental Details
  @override
  double get rentAmount;
  @override
  int get rentDueDate;
  @override
  double get securityDeposit;
  @override
  List<String> get utilitiesIncluded;
  @override
  DateTime? get leaseStartDate;
  @override
  DateTime? get leaseEndDate; // Parking Details
  @override
  List<String> get allowedParkingSpaces; // Unit Specifications
  @override
  int get bedrooms;
  @override
  int get bathrooms;
  @override
  int get squareFeet;
  @override
  String? get floorLevel;
  @override
  FurnishingStatus get furnishing;

  /// Create a copy of Unit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnitImplCopyWith<_$UnitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
