// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner_apartment_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OwnerApartmentDetailEvent {
  String get apartmentId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String apartmentId) loadApartment,
    required TResult Function(String apartmentId, Map<String, dynamic> updates)
    updateApartmentDetails,
    required TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )
    assignTenant,
    required TResult Function(String apartmentId) removeTenant,
    required TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )
    startLease,
    required TResult Function(String apartmentId) endLease,
    required TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )
    updateRentalPrice,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apartmentId)? loadApartment,
    TResult? Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult? Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult? Function(String apartmentId)? removeTenant,
    TResult? Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult? Function(String apartmentId)? endLease,
    TResult? Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apartmentId)? loadApartment,
    TResult Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult Function(String apartmentId)? removeTenant,
    TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult Function(String apartmentId)? endLease,
    TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadApartment value) loadApartment,
    required TResult Function(_UpdateApartmentDetails value)
    updateApartmentDetails,
    required TResult Function(_AssignTenant value) assignTenant,
    required TResult Function(_RemoveTenant value) removeTenant,
    required TResult Function(_StartLease value) startLease,
    required TResult Function(_EndLease value) endLease,
    required TResult Function(_UpdateRentalPrice value) updateRentalPrice,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadApartment value)? loadApartment,
    TResult? Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult? Function(_AssignTenant value)? assignTenant,
    TResult? Function(_RemoveTenant value)? removeTenant,
    TResult? Function(_StartLease value)? startLease,
    TResult? Function(_EndLease value)? endLease,
    TResult? Function(_UpdateRentalPrice value)? updateRentalPrice,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadApartment value)? loadApartment,
    TResult Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult Function(_AssignTenant value)? assignTenant,
    TResult Function(_RemoveTenant value)? removeTenant,
    TResult Function(_StartLease value)? startLease,
    TResult Function(_EndLease value)? endLease,
    TResult Function(_UpdateRentalPrice value)? updateRentalPrice,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OwnerApartmentDetailEventCopyWith<OwnerApartmentDetailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerApartmentDetailEventCopyWith<$Res> {
  factory $OwnerApartmentDetailEventCopyWith(
    OwnerApartmentDetailEvent value,
    $Res Function(OwnerApartmentDetailEvent) then,
  ) = _$OwnerApartmentDetailEventCopyWithImpl<$Res, OwnerApartmentDetailEvent>;
  @useResult
  $Res call({String apartmentId});
}

/// @nodoc
class _$OwnerApartmentDetailEventCopyWithImpl<
  $Res,
  $Val extends OwnerApartmentDetailEvent
>
    implements $OwnerApartmentDetailEventCopyWith<$Res> {
  _$OwnerApartmentDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apartmentId = null}) {
    return _then(
      _value.copyWith(
            apartmentId: null == apartmentId
                ? _value.apartmentId
                : apartmentId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoadApartmentImplCopyWith<$Res>
    implements $OwnerApartmentDetailEventCopyWith<$Res> {
  factory _$$LoadApartmentImplCopyWith(
    _$LoadApartmentImpl value,
    $Res Function(_$LoadApartmentImpl) then,
  ) = __$$LoadApartmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String apartmentId});
}

/// @nodoc
class __$$LoadApartmentImplCopyWithImpl<$Res>
    extends _$OwnerApartmentDetailEventCopyWithImpl<$Res, _$LoadApartmentImpl>
    implements _$$LoadApartmentImplCopyWith<$Res> {
  __$$LoadApartmentImplCopyWithImpl(
    _$LoadApartmentImpl _value,
    $Res Function(_$LoadApartmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apartmentId = null}) {
    return _then(
      _$LoadApartmentImpl(
        null == apartmentId
            ? _value.apartmentId
            : apartmentId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadApartmentImpl implements _LoadApartment {
  const _$LoadApartmentImpl(this.apartmentId);

  @override
  final String apartmentId;

  @override
  String toString() {
    return 'OwnerApartmentDetailEvent.loadApartment(apartmentId: $apartmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadApartmentImpl &&
            (identical(other.apartmentId, apartmentId) ||
                other.apartmentId == apartmentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apartmentId);

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadApartmentImplCopyWith<_$LoadApartmentImpl> get copyWith =>
      __$$LoadApartmentImplCopyWithImpl<_$LoadApartmentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String apartmentId) loadApartment,
    required TResult Function(String apartmentId, Map<String, dynamic> updates)
    updateApartmentDetails,
    required TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )
    assignTenant,
    required TResult Function(String apartmentId) removeTenant,
    required TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )
    startLease,
    required TResult Function(String apartmentId) endLease,
    required TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )
    updateRentalPrice,
  }) {
    return loadApartment(apartmentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apartmentId)? loadApartment,
    TResult? Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult? Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult? Function(String apartmentId)? removeTenant,
    TResult? Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult? Function(String apartmentId)? endLease,
    TResult? Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
  }) {
    return loadApartment?.call(apartmentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apartmentId)? loadApartment,
    TResult Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult Function(String apartmentId)? removeTenant,
    TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult Function(String apartmentId)? endLease,
    TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
    required TResult orElse(),
  }) {
    if (loadApartment != null) {
      return loadApartment(apartmentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadApartment value) loadApartment,
    required TResult Function(_UpdateApartmentDetails value)
    updateApartmentDetails,
    required TResult Function(_AssignTenant value) assignTenant,
    required TResult Function(_RemoveTenant value) removeTenant,
    required TResult Function(_StartLease value) startLease,
    required TResult Function(_EndLease value) endLease,
    required TResult Function(_UpdateRentalPrice value) updateRentalPrice,
  }) {
    return loadApartment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadApartment value)? loadApartment,
    TResult? Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult? Function(_AssignTenant value)? assignTenant,
    TResult? Function(_RemoveTenant value)? removeTenant,
    TResult? Function(_StartLease value)? startLease,
    TResult? Function(_EndLease value)? endLease,
    TResult? Function(_UpdateRentalPrice value)? updateRentalPrice,
  }) {
    return loadApartment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadApartment value)? loadApartment,
    TResult Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult Function(_AssignTenant value)? assignTenant,
    TResult Function(_RemoveTenant value)? removeTenant,
    TResult Function(_StartLease value)? startLease,
    TResult Function(_EndLease value)? endLease,
    TResult Function(_UpdateRentalPrice value)? updateRentalPrice,
    required TResult orElse(),
  }) {
    if (loadApartment != null) {
      return loadApartment(this);
    }
    return orElse();
  }
}

abstract class _LoadApartment implements OwnerApartmentDetailEvent {
  const factory _LoadApartment(final String apartmentId) = _$LoadApartmentImpl;

  @override
  String get apartmentId;

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadApartmentImplCopyWith<_$LoadApartmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateApartmentDetailsImplCopyWith<$Res>
    implements $OwnerApartmentDetailEventCopyWith<$Res> {
  factory _$$UpdateApartmentDetailsImplCopyWith(
    _$UpdateApartmentDetailsImpl value,
    $Res Function(_$UpdateApartmentDetailsImpl) then,
  ) = __$$UpdateApartmentDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String apartmentId, Map<String, dynamic> updates});
}

/// @nodoc
class __$$UpdateApartmentDetailsImplCopyWithImpl<$Res>
    extends
        _$OwnerApartmentDetailEventCopyWithImpl<
          $Res,
          _$UpdateApartmentDetailsImpl
        >
    implements _$$UpdateApartmentDetailsImplCopyWith<$Res> {
  __$$UpdateApartmentDetailsImplCopyWithImpl(
    _$UpdateApartmentDetailsImpl _value,
    $Res Function(_$UpdateApartmentDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apartmentId = null, Object? updates = null}) {
    return _then(
      _$UpdateApartmentDetailsImpl(
        apartmentId: null == apartmentId
            ? _value.apartmentId
            : apartmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        updates: null == updates
            ? _value._updates
            : updates // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$UpdateApartmentDetailsImpl implements _UpdateApartmentDetails {
  const _$UpdateApartmentDetailsImpl({
    required this.apartmentId,
    required final Map<String, dynamic> updates,
  }) : _updates = updates;

  @override
  final String apartmentId;
  final Map<String, dynamic> _updates;
  @override
  Map<String, dynamic> get updates {
    if (_updates is EqualUnmodifiableMapView) return _updates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_updates);
  }

  @override
  String toString() {
    return 'OwnerApartmentDetailEvent.updateApartmentDetails(apartmentId: $apartmentId, updates: $updates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateApartmentDetailsImpl &&
            (identical(other.apartmentId, apartmentId) ||
                other.apartmentId == apartmentId) &&
            const DeepCollectionEquality().equals(other._updates, _updates));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    apartmentId,
    const DeepCollectionEquality().hash(_updates),
  );

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateApartmentDetailsImplCopyWith<_$UpdateApartmentDetailsImpl>
  get copyWith =>
      __$$UpdateApartmentDetailsImplCopyWithImpl<_$UpdateApartmentDetailsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String apartmentId) loadApartment,
    required TResult Function(String apartmentId, Map<String, dynamic> updates)
    updateApartmentDetails,
    required TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )
    assignTenant,
    required TResult Function(String apartmentId) removeTenant,
    required TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )
    startLease,
    required TResult Function(String apartmentId) endLease,
    required TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )
    updateRentalPrice,
  }) {
    return updateApartmentDetails(apartmentId, updates);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apartmentId)? loadApartment,
    TResult? Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult? Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult? Function(String apartmentId)? removeTenant,
    TResult? Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult? Function(String apartmentId)? endLease,
    TResult? Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
  }) {
    return updateApartmentDetails?.call(apartmentId, updates);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apartmentId)? loadApartment,
    TResult Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult Function(String apartmentId)? removeTenant,
    TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult Function(String apartmentId)? endLease,
    TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
    required TResult orElse(),
  }) {
    if (updateApartmentDetails != null) {
      return updateApartmentDetails(apartmentId, updates);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadApartment value) loadApartment,
    required TResult Function(_UpdateApartmentDetails value)
    updateApartmentDetails,
    required TResult Function(_AssignTenant value) assignTenant,
    required TResult Function(_RemoveTenant value) removeTenant,
    required TResult Function(_StartLease value) startLease,
    required TResult Function(_EndLease value) endLease,
    required TResult Function(_UpdateRentalPrice value) updateRentalPrice,
  }) {
    return updateApartmentDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadApartment value)? loadApartment,
    TResult? Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult? Function(_AssignTenant value)? assignTenant,
    TResult? Function(_RemoveTenant value)? removeTenant,
    TResult? Function(_StartLease value)? startLease,
    TResult? Function(_EndLease value)? endLease,
    TResult? Function(_UpdateRentalPrice value)? updateRentalPrice,
  }) {
    return updateApartmentDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadApartment value)? loadApartment,
    TResult Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult Function(_AssignTenant value)? assignTenant,
    TResult Function(_RemoveTenant value)? removeTenant,
    TResult Function(_StartLease value)? startLease,
    TResult Function(_EndLease value)? endLease,
    TResult Function(_UpdateRentalPrice value)? updateRentalPrice,
    required TResult orElse(),
  }) {
    if (updateApartmentDetails != null) {
      return updateApartmentDetails(this);
    }
    return orElse();
  }
}

abstract class _UpdateApartmentDetails implements OwnerApartmentDetailEvent {
  const factory _UpdateApartmentDetails({
    required final String apartmentId,
    required final Map<String, dynamic> updates,
  }) = _$UpdateApartmentDetailsImpl;

  @override
  String get apartmentId;
  Map<String, dynamic> get updates;

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateApartmentDetailsImplCopyWith<_$UpdateApartmentDetailsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssignTenantImplCopyWith<$Res>
    implements $OwnerApartmentDetailEventCopyWith<$Res> {
  factory _$$AssignTenantImplCopyWith(
    _$AssignTenantImpl value,
    $Res Function(_$AssignTenantImpl) then,
  ) = __$$AssignTenantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String apartmentId,
    String tenantName,
    String tenantEmail,
    String tenantPhone,
  });
}

/// @nodoc
class __$$AssignTenantImplCopyWithImpl<$Res>
    extends _$OwnerApartmentDetailEventCopyWithImpl<$Res, _$AssignTenantImpl>
    implements _$$AssignTenantImplCopyWith<$Res> {
  __$$AssignTenantImplCopyWithImpl(
    _$AssignTenantImpl _value,
    $Res Function(_$AssignTenantImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apartmentId = null,
    Object? tenantName = null,
    Object? tenantEmail = null,
    Object? tenantPhone = null,
  }) {
    return _then(
      _$AssignTenantImpl(
        apartmentId: null == apartmentId
            ? _value.apartmentId
            : apartmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        tenantName: null == tenantName
            ? _value.tenantName
            : tenantName // ignore: cast_nullable_to_non_nullable
                  as String,
        tenantEmail: null == tenantEmail
            ? _value.tenantEmail
            : tenantEmail // ignore: cast_nullable_to_non_nullable
                  as String,
        tenantPhone: null == tenantPhone
            ? _value.tenantPhone
            : tenantPhone // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AssignTenantImpl implements _AssignTenant {
  const _$AssignTenantImpl({
    required this.apartmentId,
    required this.tenantName,
    required this.tenantEmail,
    required this.tenantPhone,
  });

  @override
  final String apartmentId;
  @override
  final String tenantName;
  @override
  final String tenantEmail;
  @override
  final String tenantPhone;

  @override
  String toString() {
    return 'OwnerApartmentDetailEvent.assignTenant(apartmentId: $apartmentId, tenantName: $tenantName, tenantEmail: $tenantEmail, tenantPhone: $tenantPhone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignTenantImpl &&
            (identical(other.apartmentId, apartmentId) ||
                other.apartmentId == apartmentId) &&
            (identical(other.tenantName, tenantName) ||
                other.tenantName == tenantName) &&
            (identical(other.tenantEmail, tenantEmail) ||
                other.tenantEmail == tenantEmail) &&
            (identical(other.tenantPhone, tenantPhone) ||
                other.tenantPhone == tenantPhone));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    apartmentId,
    tenantName,
    tenantEmail,
    tenantPhone,
  );

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignTenantImplCopyWith<_$AssignTenantImpl> get copyWith =>
      __$$AssignTenantImplCopyWithImpl<_$AssignTenantImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String apartmentId) loadApartment,
    required TResult Function(String apartmentId, Map<String, dynamic> updates)
    updateApartmentDetails,
    required TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )
    assignTenant,
    required TResult Function(String apartmentId) removeTenant,
    required TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )
    startLease,
    required TResult Function(String apartmentId) endLease,
    required TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )
    updateRentalPrice,
  }) {
    return assignTenant(apartmentId, tenantName, tenantEmail, tenantPhone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apartmentId)? loadApartment,
    TResult? Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult? Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult? Function(String apartmentId)? removeTenant,
    TResult? Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult? Function(String apartmentId)? endLease,
    TResult? Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
  }) {
    return assignTenant?.call(
      apartmentId,
      tenantName,
      tenantEmail,
      tenantPhone,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apartmentId)? loadApartment,
    TResult Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult Function(String apartmentId)? removeTenant,
    TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult Function(String apartmentId)? endLease,
    TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
    required TResult orElse(),
  }) {
    if (assignTenant != null) {
      return assignTenant(apartmentId, tenantName, tenantEmail, tenantPhone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadApartment value) loadApartment,
    required TResult Function(_UpdateApartmentDetails value)
    updateApartmentDetails,
    required TResult Function(_AssignTenant value) assignTenant,
    required TResult Function(_RemoveTenant value) removeTenant,
    required TResult Function(_StartLease value) startLease,
    required TResult Function(_EndLease value) endLease,
    required TResult Function(_UpdateRentalPrice value) updateRentalPrice,
  }) {
    return assignTenant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadApartment value)? loadApartment,
    TResult? Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult? Function(_AssignTenant value)? assignTenant,
    TResult? Function(_RemoveTenant value)? removeTenant,
    TResult? Function(_StartLease value)? startLease,
    TResult? Function(_EndLease value)? endLease,
    TResult? Function(_UpdateRentalPrice value)? updateRentalPrice,
  }) {
    return assignTenant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadApartment value)? loadApartment,
    TResult Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult Function(_AssignTenant value)? assignTenant,
    TResult Function(_RemoveTenant value)? removeTenant,
    TResult Function(_StartLease value)? startLease,
    TResult Function(_EndLease value)? endLease,
    TResult Function(_UpdateRentalPrice value)? updateRentalPrice,
    required TResult orElse(),
  }) {
    if (assignTenant != null) {
      return assignTenant(this);
    }
    return orElse();
  }
}

abstract class _AssignTenant implements OwnerApartmentDetailEvent {
  const factory _AssignTenant({
    required final String apartmentId,
    required final String tenantName,
    required final String tenantEmail,
    required final String tenantPhone,
  }) = _$AssignTenantImpl;

  @override
  String get apartmentId;
  String get tenantName;
  String get tenantEmail;
  String get tenantPhone;

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssignTenantImplCopyWith<_$AssignTenantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveTenantImplCopyWith<$Res>
    implements $OwnerApartmentDetailEventCopyWith<$Res> {
  factory _$$RemoveTenantImplCopyWith(
    _$RemoveTenantImpl value,
    $Res Function(_$RemoveTenantImpl) then,
  ) = __$$RemoveTenantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String apartmentId});
}

/// @nodoc
class __$$RemoveTenantImplCopyWithImpl<$Res>
    extends _$OwnerApartmentDetailEventCopyWithImpl<$Res, _$RemoveTenantImpl>
    implements _$$RemoveTenantImplCopyWith<$Res> {
  __$$RemoveTenantImplCopyWithImpl(
    _$RemoveTenantImpl _value,
    $Res Function(_$RemoveTenantImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apartmentId = null}) {
    return _then(
      _$RemoveTenantImpl(
        null == apartmentId
            ? _value.apartmentId
            : apartmentId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RemoveTenantImpl implements _RemoveTenant {
  const _$RemoveTenantImpl(this.apartmentId);

  @override
  final String apartmentId;

  @override
  String toString() {
    return 'OwnerApartmentDetailEvent.removeTenant(apartmentId: $apartmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveTenantImpl &&
            (identical(other.apartmentId, apartmentId) ||
                other.apartmentId == apartmentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apartmentId);

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveTenantImplCopyWith<_$RemoveTenantImpl> get copyWith =>
      __$$RemoveTenantImplCopyWithImpl<_$RemoveTenantImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String apartmentId) loadApartment,
    required TResult Function(String apartmentId, Map<String, dynamic> updates)
    updateApartmentDetails,
    required TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )
    assignTenant,
    required TResult Function(String apartmentId) removeTenant,
    required TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )
    startLease,
    required TResult Function(String apartmentId) endLease,
    required TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )
    updateRentalPrice,
  }) {
    return removeTenant(apartmentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apartmentId)? loadApartment,
    TResult? Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult? Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult? Function(String apartmentId)? removeTenant,
    TResult? Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult? Function(String apartmentId)? endLease,
    TResult? Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
  }) {
    return removeTenant?.call(apartmentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apartmentId)? loadApartment,
    TResult Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult Function(String apartmentId)? removeTenant,
    TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult Function(String apartmentId)? endLease,
    TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
    required TResult orElse(),
  }) {
    if (removeTenant != null) {
      return removeTenant(apartmentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadApartment value) loadApartment,
    required TResult Function(_UpdateApartmentDetails value)
    updateApartmentDetails,
    required TResult Function(_AssignTenant value) assignTenant,
    required TResult Function(_RemoveTenant value) removeTenant,
    required TResult Function(_StartLease value) startLease,
    required TResult Function(_EndLease value) endLease,
    required TResult Function(_UpdateRentalPrice value) updateRentalPrice,
  }) {
    return removeTenant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadApartment value)? loadApartment,
    TResult? Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult? Function(_AssignTenant value)? assignTenant,
    TResult? Function(_RemoveTenant value)? removeTenant,
    TResult? Function(_StartLease value)? startLease,
    TResult? Function(_EndLease value)? endLease,
    TResult? Function(_UpdateRentalPrice value)? updateRentalPrice,
  }) {
    return removeTenant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadApartment value)? loadApartment,
    TResult Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult Function(_AssignTenant value)? assignTenant,
    TResult Function(_RemoveTenant value)? removeTenant,
    TResult Function(_StartLease value)? startLease,
    TResult Function(_EndLease value)? endLease,
    TResult Function(_UpdateRentalPrice value)? updateRentalPrice,
    required TResult orElse(),
  }) {
    if (removeTenant != null) {
      return removeTenant(this);
    }
    return orElse();
  }
}

abstract class _RemoveTenant implements OwnerApartmentDetailEvent {
  const factory _RemoveTenant(final String apartmentId) = _$RemoveTenantImpl;

  @override
  String get apartmentId;

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveTenantImplCopyWith<_$RemoveTenantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartLeaseImplCopyWith<$Res>
    implements $OwnerApartmentDetailEventCopyWith<$Res> {
  factory _$$StartLeaseImplCopyWith(
    _$StartLeaseImpl value,
    $Res Function(_$StartLeaseImpl) then,
  ) = __$$StartLeaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String apartmentId,
    DateTime leaseStartDate,
    DateTime leaseEndDate,
    double monthlyRent,
    double securityDeposit,
    int rentDueDay,
  });
}

/// @nodoc
class __$$StartLeaseImplCopyWithImpl<$Res>
    extends _$OwnerApartmentDetailEventCopyWithImpl<$Res, _$StartLeaseImpl>
    implements _$$StartLeaseImplCopyWith<$Res> {
  __$$StartLeaseImplCopyWithImpl(
    _$StartLeaseImpl _value,
    $Res Function(_$StartLeaseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apartmentId = null,
    Object? leaseStartDate = null,
    Object? leaseEndDate = null,
    Object? monthlyRent = null,
    Object? securityDeposit = null,
    Object? rentDueDay = null,
  }) {
    return _then(
      _$StartLeaseImpl(
        apartmentId: null == apartmentId
            ? _value.apartmentId
            : apartmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        leaseStartDate: null == leaseStartDate
            ? _value.leaseStartDate
            : leaseStartDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        leaseEndDate: null == leaseEndDate
            ? _value.leaseEndDate
            : leaseEndDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        monthlyRent: null == monthlyRent
            ? _value.monthlyRent
            : monthlyRent // ignore: cast_nullable_to_non_nullable
                  as double,
        securityDeposit: null == securityDeposit
            ? _value.securityDeposit
            : securityDeposit // ignore: cast_nullable_to_non_nullable
                  as double,
        rentDueDay: null == rentDueDay
            ? _value.rentDueDay
            : rentDueDay // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$StartLeaseImpl implements _StartLease {
  const _$StartLeaseImpl({
    required this.apartmentId,
    required this.leaseStartDate,
    required this.leaseEndDate,
    required this.monthlyRent,
    required this.securityDeposit,
    required this.rentDueDay,
  });

  @override
  final String apartmentId;
  @override
  final DateTime leaseStartDate;
  @override
  final DateTime leaseEndDate;
  @override
  final double monthlyRent;
  @override
  final double securityDeposit;
  @override
  final int rentDueDay;

  @override
  String toString() {
    return 'OwnerApartmentDetailEvent.startLease(apartmentId: $apartmentId, leaseStartDate: $leaseStartDate, leaseEndDate: $leaseEndDate, monthlyRent: $monthlyRent, securityDeposit: $securityDeposit, rentDueDay: $rentDueDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartLeaseImpl &&
            (identical(other.apartmentId, apartmentId) ||
                other.apartmentId == apartmentId) &&
            (identical(other.leaseStartDate, leaseStartDate) ||
                other.leaseStartDate == leaseStartDate) &&
            (identical(other.leaseEndDate, leaseEndDate) ||
                other.leaseEndDate == leaseEndDate) &&
            (identical(other.monthlyRent, monthlyRent) ||
                other.monthlyRent == monthlyRent) &&
            (identical(other.securityDeposit, securityDeposit) ||
                other.securityDeposit == securityDeposit) &&
            (identical(other.rentDueDay, rentDueDay) ||
                other.rentDueDay == rentDueDay));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    apartmentId,
    leaseStartDate,
    leaseEndDate,
    monthlyRent,
    securityDeposit,
    rentDueDay,
  );

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartLeaseImplCopyWith<_$StartLeaseImpl> get copyWith =>
      __$$StartLeaseImplCopyWithImpl<_$StartLeaseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String apartmentId) loadApartment,
    required TResult Function(String apartmentId, Map<String, dynamic> updates)
    updateApartmentDetails,
    required TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )
    assignTenant,
    required TResult Function(String apartmentId) removeTenant,
    required TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )
    startLease,
    required TResult Function(String apartmentId) endLease,
    required TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )
    updateRentalPrice,
  }) {
    return startLease(
      apartmentId,
      leaseStartDate,
      leaseEndDate,
      monthlyRent,
      securityDeposit,
      rentDueDay,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apartmentId)? loadApartment,
    TResult? Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult? Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult? Function(String apartmentId)? removeTenant,
    TResult? Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult? Function(String apartmentId)? endLease,
    TResult? Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
  }) {
    return startLease?.call(
      apartmentId,
      leaseStartDate,
      leaseEndDate,
      monthlyRent,
      securityDeposit,
      rentDueDay,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apartmentId)? loadApartment,
    TResult Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult Function(String apartmentId)? removeTenant,
    TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult Function(String apartmentId)? endLease,
    TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
    required TResult orElse(),
  }) {
    if (startLease != null) {
      return startLease(
        apartmentId,
        leaseStartDate,
        leaseEndDate,
        monthlyRent,
        securityDeposit,
        rentDueDay,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadApartment value) loadApartment,
    required TResult Function(_UpdateApartmentDetails value)
    updateApartmentDetails,
    required TResult Function(_AssignTenant value) assignTenant,
    required TResult Function(_RemoveTenant value) removeTenant,
    required TResult Function(_StartLease value) startLease,
    required TResult Function(_EndLease value) endLease,
    required TResult Function(_UpdateRentalPrice value) updateRentalPrice,
  }) {
    return startLease(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadApartment value)? loadApartment,
    TResult? Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult? Function(_AssignTenant value)? assignTenant,
    TResult? Function(_RemoveTenant value)? removeTenant,
    TResult? Function(_StartLease value)? startLease,
    TResult? Function(_EndLease value)? endLease,
    TResult? Function(_UpdateRentalPrice value)? updateRentalPrice,
  }) {
    return startLease?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadApartment value)? loadApartment,
    TResult Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult Function(_AssignTenant value)? assignTenant,
    TResult Function(_RemoveTenant value)? removeTenant,
    TResult Function(_StartLease value)? startLease,
    TResult Function(_EndLease value)? endLease,
    TResult Function(_UpdateRentalPrice value)? updateRentalPrice,
    required TResult orElse(),
  }) {
    if (startLease != null) {
      return startLease(this);
    }
    return orElse();
  }
}

abstract class _StartLease implements OwnerApartmentDetailEvent {
  const factory _StartLease({
    required final String apartmentId,
    required final DateTime leaseStartDate,
    required final DateTime leaseEndDate,
    required final double monthlyRent,
    required final double securityDeposit,
    required final int rentDueDay,
  }) = _$StartLeaseImpl;

  @override
  String get apartmentId;
  DateTime get leaseStartDate;
  DateTime get leaseEndDate;
  double get monthlyRent;
  double get securityDeposit;
  int get rentDueDay;

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartLeaseImplCopyWith<_$StartLeaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EndLeaseImplCopyWith<$Res>
    implements $OwnerApartmentDetailEventCopyWith<$Res> {
  factory _$$EndLeaseImplCopyWith(
    _$EndLeaseImpl value,
    $Res Function(_$EndLeaseImpl) then,
  ) = __$$EndLeaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String apartmentId});
}

/// @nodoc
class __$$EndLeaseImplCopyWithImpl<$Res>
    extends _$OwnerApartmentDetailEventCopyWithImpl<$Res, _$EndLeaseImpl>
    implements _$$EndLeaseImplCopyWith<$Res> {
  __$$EndLeaseImplCopyWithImpl(
    _$EndLeaseImpl _value,
    $Res Function(_$EndLeaseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apartmentId = null}) {
    return _then(
      _$EndLeaseImpl(
        null == apartmentId
            ? _value.apartmentId
            : apartmentId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$EndLeaseImpl implements _EndLease {
  const _$EndLeaseImpl(this.apartmentId);

  @override
  final String apartmentId;

  @override
  String toString() {
    return 'OwnerApartmentDetailEvent.endLease(apartmentId: $apartmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EndLeaseImpl &&
            (identical(other.apartmentId, apartmentId) ||
                other.apartmentId == apartmentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apartmentId);

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EndLeaseImplCopyWith<_$EndLeaseImpl> get copyWith =>
      __$$EndLeaseImplCopyWithImpl<_$EndLeaseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String apartmentId) loadApartment,
    required TResult Function(String apartmentId, Map<String, dynamic> updates)
    updateApartmentDetails,
    required TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )
    assignTenant,
    required TResult Function(String apartmentId) removeTenant,
    required TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )
    startLease,
    required TResult Function(String apartmentId) endLease,
    required TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )
    updateRentalPrice,
  }) {
    return endLease(apartmentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apartmentId)? loadApartment,
    TResult? Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult? Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult? Function(String apartmentId)? removeTenant,
    TResult? Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult? Function(String apartmentId)? endLease,
    TResult? Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
  }) {
    return endLease?.call(apartmentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apartmentId)? loadApartment,
    TResult Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult Function(String apartmentId)? removeTenant,
    TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult Function(String apartmentId)? endLease,
    TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
    required TResult orElse(),
  }) {
    if (endLease != null) {
      return endLease(apartmentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadApartment value) loadApartment,
    required TResult Function(_UpdateApartmentDetails value)
    updateApartmentDetails,
    required TResult Function(_AssignTenant value) assignTenant,
    required TResult Function(_RemoveTenant value) removeTenant,
    required TResult Function(_StartLease value) startLease,
    required TResult Function(_EndLease value) endLease,
    required TResult Function(_UpdateRentalPrice value) updateRentalPrice,
  }) {
    return endLease(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadApartment value)? loadApartment,
    TResult? Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult? Function(_AssignTenant value)? assignTenant,
    TResult? Function(_RemoveTenant value)? removeTenant,
    TResult? Function(_StartLease value)? startLease,
    TResult? Function(_EndLease value)? endLease,
    TResult? Function(_UpdateRentalPrice value)? updateRentalPrice,
  }) {
    return endLease?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadApartment value)? loadApartment,
    TResult Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult Function(_AssignTenant value)? assignTenant,
    TResult Function(_RemoveTenant value)? removeTenant,
    TResult Function(_StartLease value)? startLease,
    TResult Function(_EndLease value)? endLease,
    TResult Function(_UpdateRentalPrice value)? updateRentalPrice,
    required TResult orElse(),
  }) {
    if (endLease != null) {
      return endLease(this);
    }
    return orElse();
  }
}

abstract class _EndLease implements OwnerApartmentDetailEvent {
  const factory _EndLease(final String apartmentId) = _$EndLeaseImpl;

  @override
  String get apartmentId;

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EndLeaseImplCopyWith<_$EndLeaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateRentalPriceImplCopyWith<$Res>
    implements $OwnerApartmentDetailEventCopyWith<$Res> {
  factory _$$UpdateRentalPriceImplCopyWith(
    _$UpdateRentalPriceImpl value,
    $Res Function(_$UpdateRentalPriceImpl) then,
  ) = __$$UpdateRentalPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String apartmentId, double monthlyRent, double securityDeposit});
}

/// @nodoc
class __$$UpdateRentalPriceImplCopyWithImpl<$Res>
    extends
        _$OwnerApartmentDetailEventCopyWithImpl<$Res, _$UpdateRentalPriceImpl>
    implements _$$UpdateRentalPriceImplCopyWith<$Res> {
  __$$UpdateRentalPriceImplCopyWithImpl(
    _$UpdateRentalPriceImpl _value,
    $Res Function(_$UpdateRentalPriceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apartmentId = null,
    Object? monthlyRent = null,
    Object? securityDeposit = null,
  }) {
    return _then(
      _$UpdateRentalPriceImpl(
        apartmentId: null == apartmentId
            ? _value.apartmentId
            : apartmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        monthlyRent: null == monthlyRent
            ? _value.monthlyRent
            : monthlyRent // ignore: cast_nullable_to_non_nullable
                  as double,
        securityDeposit: null == securityDeposit
            ? _value.securityDeposit
            : securityDeposit // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$UpdateRentalPriceImpl implements _UpdateRentalPrice {
  const _$UpdateRentalPriceImpl({
    required this.apartmentId,
    required this.monthlyRent,
    required this.securityDeposit,
  });

  @override
  final String apartmentId;
  @override
  final double monthlyRent;
  @override
  final double securityDeposit;

  @override
  String toString() {
    return 'OwnerApartmentDetailEvent.updateRentalPrice(apartmentId: $apartmentId, monthlyRent: $monthlyRent, securityDeposit: $securityDeposit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRentalPriceImpl &&
            (identical(other.apartmentId, apartmentId) ||
                other.apartmentId == apartmentId) &&
            (identical(other.monthlyRent, monthlyRent) ||
                other.monthlyRent == monthlyRent) &&
            (identical(other.securityDeposit, securityDeposit) ||
                other.securityDeposit == securityDeposit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, apartmentId, monthlyRent, securityDeposit);

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRentalPriceImplCopyWith<_$UpdateRentalPriceImpl> get copyWith =>
      __$$UpdateRentalPriceImplCopyWithImpl<_$UpdateRentalPriceImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String apartmentId) loadApartment,
    required TResult Function(String apartmentId, Map<String, dynamic> updates)
    updateApartmentDetails,
    required TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )
    assignTenant,
    required TResult Function(String apartmentId) removeTenant,
    required TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )
    startLease,
    required TResult Function(String apartmentId) endLease,
    required TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )
    updateRentalPrice,
  }) {
    return updateRentalPrice(apartmentId, monthlyRent, securityDeposit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apartmentId)? loadApartment,
    TResult? Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult? Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult? Function(String apartmentId)? removeTenant,
    TResult? Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult? Function(String apartmentId)? endLease,
    TResult? Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
  }) {
    return updateRentalPrice?.call(apartmentId, monthlyRent, securityDeposit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apartmentId)? loadApartment,
    TResult Function(String apartmentId, Map<String, dynamic> updates)?
    updateApartmentDetails,
    TResult Function(
      String apartmentId,
      String tenantName,
      String tenantEmail,
      String tenantPhone,
    )?
    assignTenant,
    TResult Function(String apartmentId)? removeTenant,
    TResult Function(
      String apartmentId,
      DateTime leaseStartDate,
      DateTime leaseEndDate,
      double monthlyRent,
      double securityDeposit,
      int rentDueDay,
    )?
    startLease,
    TResult Function(String apartmentId)? endLease,
    TResult Function(
      String apartmentId,
      double monthlyRent,
      double securityDeposit,
    )?
    updateRentalPrice,
    required TResult orElse(),
  }) {
    if (updateRentalPrice != null) {
      return updateRentalPrice(apartmentId, monthlyRent, securityDeposit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadApartment value) loadApartment,
    required TResult Function(_UpdateApartmentDetails value)
    updateApartmentDetails,
    required TResult Function(_AssignTenant value) assignTenant,
    required TResult Function(_RemoveTenant value) removeTenant,
    required TResult Function(_StartLease value) startLease,
    required TResult Function(_EndLease value) endLease,
    required TResult Function(_UpdateRentalPrice value) updateRentalPrice,
  }) {
    return updateRentalPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadApartment value)? loadApartment,
    TResult? Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult? Function(_AssignTenant value)? assignTenant,
    TResult? Function(_RemoveTenant value)? removeTenant,
    TResult? Function(_StartLease value)? startLease,
    TResult? Function(_EndLease value)? endLease,
    TResult? Function(_UpdateRentalPrice value)? updateRentalPrice,
  }) {
    return updateRentalPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadApartment value)? loadApartment,
    TResult Function(_UpdateApartmentDetails value)? updateApartmentDetails,
    TResult Function(_AssignTenant value)? assignTenant,
    TResult Function(_RemoveTenant value)? removeTenant,
    TResult Function(_StartLease value)? startLease,
    TResult Function(_EndLease value)? endLease,
    TResult Function(_UpdateRentalPrice value)? updateRentalPrice,
    required TResult orElse(),
  }) {
    if (updateRentalPrice != null) {
      return updateRentalPrice(this);
    }
    return orElse();
  }
}

abstract class _UpdateRentalPrice implements OwnerApartmentDetailEvent {
  const factory _UpdateRentalPrice({
    required final String apartmentId,
    required final double monthlyRent,
    required final double securityDeposit,
  }) = _$UpdateRentalPriceImpl;

  @override
  String get apartmentId;
  double get monthlyRent;
  double get securityDeposit;

  /// Create a copy of OwnerApartmentDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateRentalPriceImplCopyWith<_$UpdateRentalPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
