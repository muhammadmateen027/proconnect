// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apartment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Apartment _$ApartmentFromJson(Map<String, dynamic> json) {
  return _Apartment.fromJson(json);
}

/// @nodoc
mixin _$Apartment {
  String get id => throw _privateConstructorUsedError;
  String get condominiumId => throw _privateConstructorUsedError;
  String get agencyId => throw _privateConstructorUsedError;
  String get floorId => throw _privateConstructorUsedError;
  String get apartmentNumber =>
      throw _privateConstructorUsedError; // e.g., "A-12-03", "101", "2B", // Apartment Details
  double get totalSizeSquareFeet => throw _privateConstructorUsedError;
  String? get condoName => throw _privateConstructorUsedError; // Ownership
  String? get ownerId =>
      throw _privateConstructorUsedError; // Owner who manages this apartment
  String? get ownerName => throw _privateConstructorUsedError;
  String? get ownerEmail => throw _privateConstructorUsedError;
  String? get ownerPhone =>
      throw _privateConstructorUsedError; // Tenant Information (managed by owner)
  String? get tenantId => throw _privateConstructorUsedError;
  String? get tenantName => throw _privateConstructorUsedError;
  String? get tenantEmail => throw _privateConstructorUsedError;
  String? get tenantPhone => throw _privateConstructorUsedError;
  List<Room> get rooms => throw _privateConstructorUsedError;
  int get totalBedrooms => throw _privateConstructorUsedError;
  int get totalBathrooms => throw _privateConstructorUsedError;
  FurnishingStatus get furnishing =>
      throw _privateConstructorUsedError; // Status and Availability
  ApartmentStatus get status => throw _privateConstructorUsedError;
  DateTime? get vacantFrom =>
      throw _privateConstructorUsedError; // When apartment became/will become vacant
  DateTime? get availableFrom =>
      throw _privateConstructorUsedError; // When apartment is ready to move in
  // Rental Information
  double? get monthlyRent => throw _privateConstructorUsedError;
  double? get securityDeposit => throw _privateConstructorUsedError;
  List<String> get utilitiesIncluded =>
      throw _privateConstructorUsedError; // Lease Information
  DateTime? get leaseStartDate => throw _privateConstructorUsedError;
  DateTime? get leaseEndDate => throw _privateConstructorUsedError;
  int? get rentDueDay =>
      throw _privateConstructorUsedError; // Day of month rent is due (1-31)
  // Parking
  List<String> get parkingSpaces =>
      throw _privateConstructorUsedError; // Assigned parking space numbers
  // Additional Features
  List<String> get amenities =>
      throw _privateConstructorUsedError; // Apartment-specific amenities
  String? get description => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError; // Metadata
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Apartment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Apartment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApartmentCopyWith<Apartment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApartmentCopyWith<$Res> {
  factory $ApartmentCopyWith(Apartment value, $Res Function(Apartment) then) =
      _$ApartmentCopyWithImpl<$Res, Apartment>;
  @useResult
  $Res call({
    String id,
    String condominiumId,
    String agencyId,
    String floorId,
    String apartmentNumber,
    double totalSizeSquareFeet,
    String? condoName,
    String? ownerId,
    String? ownerName,
    String? ownerEmail,
    String? ownerPhone,
    String? tenantId,
    String? tenantName,
    String? tenantEmail,
    String? tenantPhone,
    List<Room> rooms,
    int totalBedrooms,
    int totalBathrooms,
    FurnishingStatus furnishing,
    ApartmentStatus status,
    DateTime? vacantFrom,
    DateTime? availableFrom,
    double? monthlyRent,
    double? securityDeposit,
    List<String> utilitiesIncluded,
    DateTime? leaseStartDate,
    DateTime? leaseEndDate,
    int? rentDueDay,
    List<String> parkingSpaces,
    List<String> amenities,
    String? description,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$ApartmentCopyWithImpl<$Res, $Val extends Apartment>
    implements $ApartmentCopyWith<$Res> {
  _$ApartmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Apartment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? condominiumId = null,
    Object? agencyId = null,
    Object? floorId = null,
    Object? apartmentNumber = null,
    Object? totalSizeSquareFeet = null,
    Object? condoName = freezed,
    Object? ownerId = freezed,
    Object? ownerName = freezed,
    Object? ownerEmail = freezed,
    Object? ownerPhone = freezed,
    Object? tenantId = freezed,
    Object? tenantName = freezed,
    Object? tenantEmail = freezed,
    Object? tenantPhone = freezed,
    Object? rooms = null,
    Object? totalBedrooms = null,
    Object? totalBathrooms = null,
    Object? furnishing = null,
    Object? status = null,
    Object? vacantFrom = freezed,
    Object? availableFrom = freezed,
    Object? monthlyRent = freezed,
    Object? securityDeposit = freezed,
    Object? utilitiesIncluded = null,
    Object? leaseStartDate = freezed,
    Object? leaseEndDate = freezed,
    Object? rentDueDay = freezed,
    Object? parkingSpaces = null,
    Object? amenities = null,
    Object? description = freezed,
    Object? notes = freezed,
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
            floorId: null == floorId
                ? _value.floorId
                : floorId // ignore: cast_nullable_to_non_nullable
                      as String,
            apartmentNumber: null == apartmentNumber
                ? _value.apartmentNumber
                : apartmentNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            totalSizeSquareFeet: null == totalSizeSquareFeet
                ? _value.totalSizeSquareFeet
                : totalSizeSquareFeet // ignore: cast_nullable_to_non_nullable
                      as double,
            condoName: freezed == condoName
                ? _value.condoName
                : condoName // ignore: cast_nullable_to_non_nullable
                      as String?,
            ownerId: freezed == ownerId
                ? _value.ownerId
                : ownerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            ownerName: freezed == ownerName
                ? _value.ownerName
                : ownerName // ignore: cast_nullable_to_non_nullable
                      as String?,
            ownerEmail: freezed == ownerEmail
                ? _value.ownerEmail
                : ownerEmail // ignore: cast_nullable_to_non_nullable
                      as String?,
            ownerPhone: freezed == ownerPhone
                ? _value.ownerPhone
                : ownerPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            tenantId: freezed == tenantId
                ? _value.tenantId
                : tenantId // ignore: cast_nullable_to_non_nullable
                      as String?,
            tenantName: freezed == tenantName
                ? _value.tenantName
                : tenantName // ignore: cast_nullable_to_non_nullable
                      as String?,
            tenantEmail: freezed == tenantEmail
                ? _value.tenantEmail
                : tenantEmail // ignore: cast_nullable_to_non_nullable
                      as String?,
            tenantPhone: freezed == tenantPhone
                ? _value.tenantPhone
                : tenantPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            rooms: null == rooms
                ? _value.rooms
                : rooms // ignore: cast_nullable_to_non_nullable
                      as List<Room>,
            totalBedrooms: null == totalBedrooms
                ? _value.totalBedrooms
                : totalBedrooms // ignore: cast_nullable_to_non_nullable
                      as int,
            totalBathrooms: null == totalBathrooms
                ? _value.totalBathrooms
                : totalBathrooms // ignore: cast_nullable_to_non_nullable
                      as int,
            furnishing: null == furnishing
                ? _value.furnishing
                : furnishing // ignore: cast_nullable_to_non_nullable
                      as FurnishingStatus,
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
            monthlyRent: freezed == monthlyRent
                ? _value.monthlyRent
                : monthlyRent // ignore: cast_nullable_to_non_nullable
                      as double?,
            securityDeposit: freezed == securityDeposit
                ? _value.securityDeposit
                : securityDeposit // ignore: cast_nullable_to_non_nullable
                      as double?,
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
            rentDueDay: freezed == rentDueDay
                ? _value.rentDueDay
                : rentDueDay // ignore: cast_nullable_to_non_nullable
                      as int?,
            parkingSpaces: null == parkingSpaces
                ? _value.parkingSpaces
                : parkingSpaces // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            amenities: null == amenities
                ? _value.amenities
                : amenities // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$ApartmentImplCopyWith<$Res>
    implements $ApartmentCopyWith<$Res> {
  factory _$$ApartmentImplCopyWith(
    _$ApartmentImpl value,
    $Res Function(_$ApartmentImpl) then,
  ) = __$$ApartmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String condominiumId,
    String agencyId,
    String floorId,
    String apartmentNumber,
    double totalSizeSquareFeet,
    String? condoName,
    String? ownerId,
    String? ownerName,
    String? ownerEmail,
    String? ownerPhone,
    String? tenantId,
    String? tenantName,
    String? tenantEmail,
    String? tenantPhone,
    List<Room> rooms,
    int totalBedrooms,
    int totalBathrooms,
    FurnishingStatus furnishing,
    ApartmentStatus status,
    DateTime? vacantFrom,
    DateTime? availableFrom,
    double? monthlyRent,
    double? securityDeposit,
    List<String> utilitiesIncluded,
    DateTime? leaseStartDate,
    DateTime? leaseEndDate,
    int? rentDueDay,
    List<String> parkingSpaces,
    List<String> amenities,
    String? description,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$ApartmentImplCopyWithImpl<$Res>
    extends _$ApartmentCopyWithImpl<$Res, _$ApartmentImpl>
    implements _$$ApartmentImplCopyWith<$Res> {
  __$$ApartmentImplCopyWithImpl(
    _$ApartmentImpl _value,
    $Res Function(_$ApartmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Apartment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? condominiumId = null,
    Object? agencyId = null,
    Object? floorId = null,
    Object? apartmentNumber = null,
    Object? totalSizeSquareFeet = null,
    Object? condoName = freezed,
    Object? ownerId = freezed,
    Object? ownerName = freezed,
    Object? ownerEmail = freezed,
    Object? ownerPhone = freezed,
    Object? tenantId = freezed,
    Object? tenantName = freezed,
    Object? tenantEmail = freezed,
    Object? tenantPhone = freezed,
    Object? rooms = null,
    Object? totalBedrooms = null,
    Object? totalBathrooms = null,
    Object? furnishing = null,
    Object? status = null,
    Object? vacantFrom = freezed,
    Object? availableFrom = freezed,
    Object? monthlyRent = freezed,
    Object? securityDeposit = freezed,
    Object? utilitiesIncluded = null,
    Object? leaseStartDate = freezed,
    Object? leaseEndDate = freezed,
    Object? rentDueDay = freezed,
    Object? parkingSpaces = null,
    Object? amenities = null,
    Object? description = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ApartmentImpl(
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
        floorId: null == floorId
            ? _value.floorId
            : floorId // ignore: cast_nullable_to_non_nullable
                  as String,
        apartmentNumber: null == apartmentNumber
            ? _value.apartmentNumber
            : apartmentNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        totalSizeSquareFeet: null == totalSizeSquareFeet
            ? _value.totalSizeSquareFeet
            : totalSizeSquareFeet // ignore: cast_nullable_to_non_nullable
                  as double,
        condoName: freezed == condoName
            ? _value.condoName
            : condoName // ignore: cast_nullable_to_non_nullable
                  as String?,
        ownerId: freezed == ownerId
            ? _value.ownerId
            : ownerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        ownerName: freezed == ownerName
            ? _value.ownerName
            : ownerName // ignore: cast_nullable_to_non_nullable
                  as String?,
        ownerEmail: freezed == ownerEmail
            ? _value.ownerEmail
            : ownerEmail // ignore: cast_nullable_to_non_nullable
                  as String?,
        ownerPhone: freezed == ownerPhone
            ? _value.ownerPhone
            : ownerPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        tenantId: freezed == tenantId
            ? _value.tenantId
            : tenantId // ignore: cast_nullable_to_non_nullable
                  as String?,
        tenantName: freezed == tenantName
            ? _value.tenantName
            : tenantName // ignore: cast_nullable_to_non_nullable
                  as String?,
        tenantEmail: freezed == tenantEmail
            ? _value.tenantEmail
            : tenantEmail // ignore: cast_nullable_to_non_nullable
                  as String?,
        tenantPhone: freezed == tenantPhone
            ? _value.tenantPhone
            : tenantPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        rooms: null == rooms
            ? _value._rooms
            : rooms // ignore: cast_nullable_to_non_nullable
                  as List<Room>,
        totalBedrooms: null == totalBedrooms
            ? _value.totalBedrooms
            : totalBedrooms // ignore: cast_nullable_to_non_nullable
                  as int,
        totalBathrooms: null == totalBathrooms
            ? _value.totalBathrooms
            : totalBathrooms // ignore: cast_nullable_to_non_nullable
                  as int,
        furnishing: null == furnishing
            ? _value.furnishing
            : furnishing // ignore: cast_nullable_to_non_nullable
                  as FurnishingStatus,
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
        monthlyRent: freezed == monthlyRent
            ? _value.monthlyRent
            : monthlyRent // ignore: cast_nullable_to_non_nullable
                  as double?,
        securityDeposit: freezed == securityDeposit
            ? _value.securityDeposit
            : securityDeposit // ignore: cast_nullable_to_non_nullable
                  as double?,
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
        rentDueDay: freezed == rentDueDay
            ? _value.rentDueDay
            : rentDueDay // ignore: cast_nullable_to_non_nullable
                  as int?,
        parkingSpaces: null == parkingSpaces
            ? _value._parkingSpaces
            : parkingSpaces // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        amenities: null == amenities
            ? _value._amenities
            : amenities // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$ApartmentImpl extends _Apartment {
  const _$ApartmentImpl({
    required this.id,
    required this.condominiumId,
    required this.agencyId,
    required this.floorId,
    required this.apartmentNumber,
    required this.totalSizeSquareFeet,
    this.condoName,
    this.ownerId,
    this.ownerName,
    this.ownerEmail,
    this.ownerPhone,
    this.tenantId,
    this.tenantName,
    this.tenantEmail,
    this.tenantPhone,
    final List<Room> rooms = const [],
    this.totalBedrooms = 0,
    this.totalBathrooms = 0,
    this.furnishing = FurnishingStatus.unfurnished,
    this.status = ApartmentStatus.vacant,
    this.vacantFrom,
    this.availableFrom,
    this.monthlyRent,
    this.securityDeposit,
    final List<String> utilitiesIncluded = const [],
    this.leaseStartDate,
    this.leaseEndDate,
    this.rentDueDay,
    final List<String> parkingSpaces = const [],
    final List<String> amenities = const [],
    this.description,
    this.notes,
    this.createdAt,
    this.updatedAt,
  }) : _rooms = rooms,
       _utilitiesIncluded = utilitiesIncluded,
       _parkingSpaces = parkingSpaces,
       _amenities = amenities,
       super._();

  factory _$ApartmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApartmentImplFromJson(json);

  @override
  final String id;
  @override
  final String condominiumId;
  @override
  final String agencyId;
  @override
  final String floorId;
  @override
  final String apartmentNumber;
  // e.g., "A-12-03", "101", "2B", // Apartment Details
  @override
  final double totalSizeSquareFeet;
  @override
  final String? condoName;
  // Ownership
  @override
  final String? ownerId;
  // Owner who manages this apartment
  @override
  final String? ownerName;
  @override
  final String? ownerEmail;
  @override
  final String? ownerPhone;
  // Tenant Information (managed by owner)
  @override
  final String? tenantId;
  @override
  final String? tenantName;
  @override
  final String? tenantEmail;
  @override
  final String? tenantPhone;
  final List<Room> _rooms;
  @override
  @JsonKey()
  List<Room> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  @override
  @JsonKey()
  final int totalBedrooms;
  @override
  @JsonKey()
  final int totalBathrooms;
  @override
  @JsonKey()
  final FurnishingStatus furnishing;
  // Status and Availability
  @override
  @JsonKey()
  final ApartmentStatus status;
  @override
  final DateTime? vacantFrom;
  // When apartment became/will become vacant
  @override
  final DateTime? availableFrom;
  // When apartment is ready to move in
  // Rental Information
  @override
  final double? monthlyRent;
  @override
  final double? securityDeposit;
  final List<String> _utilitiesIncluded;
  @override
  @JsonKey()
  List<String> get utilitiesIncluded {
    if (_utilitiesIncluded is EqualUnmodifiableListView)
      return _utilitiesIncluded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_utilitiesIncluded);
  }

  // Lease Information
  @override
  final DateTime? leaseStartDate;
  @override
  final DateTime? leaseEndDate;
  @override
  final int? rentDueDay;
  // Day of month rent is due (1-31)
  // Parking
  final List<String> _parkingSpaces;
  // Day of month rent is due (1-31)
  // Parking
  @override
  @JsonKey()
  List<String> get parkingSpaces {
    if (_parkingSpaces is EqualUnmodifiableListView) return _parkingSpaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parkingSpaces);
  }

  // Assigned parking space numbers
  // Additional Features
  final List<String> _amenities;
  // Assigned parking space numbers
  // Additional Features
  @override
  @JsonKey()
  List<String> get amenities {
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_amenities);
  }

  // Apartment-specific amenities
  @override
  final String? description;
  @override
  final String? notes;
  // Metadata
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Apartment(id: $id, condominiumId: $condominiumId, agencyId: $agencyId, floorId: $floorId, apartmentNumber: $apartmentNumber, totalSizeSquareFeet: $totalSizeSquareFeet, condoName: $condoName, ownerId: $ownerId, ownerName: $ownerName, ownerEmail: $ownerEmail, ownerPhone: $ownerPhone, tenantId: $tenantId, tenantName: $tenantName, tenantEmail: $tenantEmail, tenantPhone: $tenantPhone, rooms: $rooms, totalBedrooms: $totalBedrooms, totalBathrooms: $totalBathrooms, furnishing: $furnishing, status: $status, vacantFrom: $vacantFrom, availableFrom: $availableFrom, monthlyRent: $monthlyRent, securityDeposit: $securityDeposit, utilitiesIncluded: $utilitiesIncluded, leaseStartDate: $leaseStartDate, leaseEndDate: $leaseEndDate, rentDueDay: $rentDueDay, parkingSpaces: $parkingSpaces, amenities: $amenities, description: $description, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApartmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.condominiumId, condominiumId) ||
                other.condominiumId == condominiumId) &&
            (identical(other.agencyId, agencyId) ||
                other.agencyId == agencyId) &&
            (identical(other.floorId, floorId) || other.floorId == floorId) &&
            (identical(other.apartmentNumber, apartmentNumber) ||
                other.apartmentNumber == apartmentNumber) &&
            (identical(other.totalSizeSquareFeet, totalSizeSquareFeet) ||
                other.totalSizeSquareFeet == totalSizeSquareFeet) &&
            (identical(other.condoName, condoName) ||
                other.condoName == condoName) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.ownerEmail, ownerEmail) ||
                other.ownerEmail == ownerEmail) &&
            (identical(other.ownerPhone, ownerPhone) ||
                other.ownerPhone == ownerPhone) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.tenantName, tenantName) ||
                other.tenantName == tenantName) &&
            (identical(other.tenantEmail, tenantEmail) ||
                other.tenantEmail == tenantEmail) &&
            (identical(other.tenantPhone, tenantPhone) ||
                other.tenantPhone == tenantPhone) &&
            const DeepCollectionEquality().equals(other._rooms, _rooms) &&
            (identical(other.totalBedrooms, totalBedrooms) ||
                other.totalBedrooms == totalBedrooms) &&
            (identical(other.totalBathrooms, totalBathrooms) ||
                other.totalBathrooms == totalBathrooms) &&
            (identical(other.furnishing, furnishing) ||
                other.furnishing == furnishing) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.vacantFrom, vacantFrom) ||
                other.vacantFrom == vacantFrom) &&
            (identical(other.availableFrom, availableFrom) ||
                other.availableFrom == availableFrom) &&
            (identical(other.monthlyRent, monthlyRent) ||
                other.monthlyRent == monthlyRent) &&
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
            (identical(other.rentDueDay, rentDueDay) ||
                other.rentDueDay == rentDueDay) &&
            const DeepCollectionEquality().equals(
              other._parkingSpaces,
              _parkingSpaces,
            ) &&
            const DeepCollectionEquality().equals(
              other._amenities,
              _amenities,
            ) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    condominiumId,
    agencyId,
    floorId,
    apartmentNumber,
    totalSizeSquareFeet,
    condoName,
    ownerId,
    ownerName,
    ownerEmail,
    ownerPhone,
    tenantId,
    tenantName,
    tenantEmail,
    tenantPhone,
    const DeepCollectionEquality().hash(_rooms),
    totalBedrooms,
    totalBathrooms,
    furnishing,
    status,
    vacantFrom,
    availableFrom,
    monthlyRent,
    securityDeposit,
    const DeepCollectionEquality().hash(_utilitiesIncluded),
    leaseStartDate,
    leaseEndDate,
    rentDueDay,
    const DeepCollectionEquality().hash(_parkingSpaces),
    const DeepCollectionEquality().hash(_amenities),
    description,
    notes,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of Apartment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApartmentImplCopyWith<_$ApartmentImpl> get copyWith =>
      __$$ApartmentImplCopyWithImpl<_$ApartmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApartmentImplToJson(this);
  }
}

abstract class _Apartment extends Apartment {
  const factory _Apartment({
    required final String id,
    required final String condominiumId,
    required final String agencyId,
    required final String floorId,
    required final String apartmentNumber,
    required final double totalSizeSquareFeet,
    final String? condoName,
    final String? ownerId,
    final String? ownerName,
    final String? ownerEmail,
    final String? ownerPhone,
    final String? tenantId,
    final String? tenantName,
    final String? tenantEmail,
    final String? tenantPhone,
    final List<Room> rooms,
    final int totalBedrooms,
    final int totalBathrooms,
    final FurnishingStatus furnishing,
    final ApartmentStatus status,
    final DateTime? vacantFrom,
    final DateTime? availableFrom,
    final double? monthlyRent,
    final double? securityDeposit,
    final List<String> utilitiesIncluded,
    final DateTime? leaseStartDate,
    final DateTime? leaseEndDate,
    final int? rentDueDay,
    final List<String> parkingSpaces,
    final List<String> amenities,
    final String? description,
    final String? notes,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$ApartmentImpl;
  const _Apartment._() : super._();

  factory _Apartment.fromJson(Map<String, dynamic> json) =
      _$ApartmentImpl.fromJson;

  @override
  String get id;
  @override
  String get condominiumId;
  @override
  String get agencyId;
  @override
  String get floorId;
  @override
  String get apartmentNumber; // e.g., "A-12-03", "101", "2B", // Apartment Details
  @override
  double get totalSizeSquareFeet;
  @override
  String? get condoName; // Ownership
  @override
  String? get ownerId; // Owner who manages this apartment
  @override
  String? get ownerName;
  @override
  String? get ownerEmail;
  @override
  String? get ownerPhone; // Tenant Information (managed by owner)
  @override
  String? get tenantId;
  @override
  String? get tenantName;
  @override
  String? get tenantEmail;
  @override
  String? get tenantPhone;
  @override
  List<Room> get rooms;
  @override
  int get totalBedrooms;
  @override
  int get totalBathrooms;
  @override
  FurnishingStatus get furnishing; // Status and Availability
  @override
  ApartmentStatus get status;
  @override
  DateTime? get vacantFrom; // When apartment became/will become vacant
  @override
  DateTime? get availableFrom; // When apartment is ready to move in
  // Rental Information
  @override
  double? get monthlyRent;
  @override
  double? get securityDeposit;
  @override
  List<String> get utilitiesIncluded; // Lease Information
  @override
  DateTime? get leaseStartDate;
  @override
  DateTime? get leaseEndDate;
  @override
  int? get rentDueDay; // Day of month rent is due (1-31)
  // Parking
  @override
  List<String> get parkingSpaces; // Assigned parking space numbers
  // Additional Features
  @override
  List<String> get amenities; // Apartment-specific amenities
  @override
  String? get description;
  @override
  String? get notes; // Metadata
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Apartment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApartmentImplCopyWith<_$ApartmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
