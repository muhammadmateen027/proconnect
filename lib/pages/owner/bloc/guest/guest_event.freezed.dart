// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GuestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String ownerId) loadInvitations,
    required TResult Function(List<GuestInvitation> invitations)
    invitationsUpdated,
    required TResult Function(GuestInvitation invitation) createInvitation,
    required TResult Function(GuestInvitation invitation) updateInvitation,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String ownerId)? loadInvitations,
    TResult? Function(List<GuestInvitation> invitations)? invitationsUpdated,
    TResult? Function(GuestInvitation invitation)? createInvitation,
    TResult? Function(GuestInvitation invitation)? updateInvitation,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String ownerId)? loadInvitations,
    TResult Function(List<GuestInvitation> invitations)? invitationsUpdated,
    TResult Function(GuestInvitation invitation)? createInvitation,
    TResult Function(GuestInvitation invitation)? updateInvitation,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInvitations value) loadInvitations,
    required TResult Function(_InvitationsUpdated value) invitationsUpdated,
    required TResult Function(_CreateInvitation value) createInvitation,
    required TResult Function(_UpdateInvitation value) updateInvitation,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInvitations value)? loadInvitations,
    TResult? Function(_InvitationsUpdated value)? invitationsUpdated,
    TResult? Function(_CreateInvitation value)? createInvitation,
    TResult? Function(_UpdateInvitation value)? updateInvitation,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInvitations value)? loadInvitations,
    TResult Function(_InvitationsUpdated value)? invitationsUpdated,
    TResult Function(_CreateInvitation value)? createInvitation,
    TResult Function(_UpdateInvitation value)? updateInvitation,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestEventCopyWith<$Res> {
  factory $GuestEventCopyWith(
    GuestEvent value,
    $Res Function(GuestEvent) then,
  ) = _$GuestEventCopyWithImpl<$Res, GuestEvent>;
}

/// @nodoc
class _$GuestEventCopyWithImpl<$Res, $Val extends GuestEvent>
    implements $GuestEventCopyWith<$Res> {
  _$GuestEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadInvitationsImplCopyWith<$Res> {
  factory _$$LoadInvitationsImplCopyWith(
    _$LoadInvitationsImpl value,
    $Res Function(_$LoadInvitationsImpl) then,
  ) = __$$LoadInvitationsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String ownerId});
}

/// @nodoc
class __$$LoadInvitationsImplCopyWithImpl<$Res>
    extends _$GuestEventCopyWithImpl<$Res, _$LoadInvitationsImpl>
    implements _$$LoadInvitationsImplCopyWith<$Res> {
  __$$LoadInvitationsImplCopyWithImpl(
    _$LoadInvitationsImpl _value,
    $Res Function(_$LoadInvitationsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ownerId = null}) {
    return _then(
      _$LoadInvitationsImpl(
        null == ownerId
            ? _value.ownerId
            : ownerId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadInvitationsImpl implements _LoadInvitations {
  const _$LoadInvitationsImpl(this.ownerId);

  @override
  final String ownerId;

  @override
  String toString() {
    return 'GuestEvent.loadInvitations(ownerId: $ownerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadInvitationsImpl &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ownerId);

  /// Create a copy of GuestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadInvitationsImplCopyWith<_$LoadInvitationsImpl> get copyWith =>
      __$$LoadInvitationsImplCopyWithImpl<_$LoadInvitationsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String ownerId) loadInvitations,
    required TResult Function(List<GuestInvitation> invitations)
    invitationsUpdated,
    required TResult Function(GuestInvitation invitation) createInvitation,
    required TResult Function(GuestInvitation invitation) updateInvitation,
  }) {
    return loadInvitations(ownerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String ownerId)? loadInvitations,
    TResult? Function(List<GuestInvitation> invitations)? invitationsUpdated,
    TResult? Function(GuestInvitation invitation)? createInvitation,
    TResult? Function(GuestInvitation invitation)? updateInvitation,
  }) {
    return loadInvitations?.call(ownerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String ownerId)? loadInvitations,
    TResult Function(List<GuestInvitation> invitations)? invitationsUpdated,
    TResult Function(GuestInvitation invitation)? createInvitation,
    TResult Function(GuestInvitation invitation)? updateInvitation,
    required TResult orElse(),
  }) {
    if (loadInvitations != null) {
      return loadInvitations(ownerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInvitations value) loadInvitations,
    required TResult Function(_InvitationsUpdated value) invitationsUpdated,
    required TResult Function(_CreateInvitation value) createInvitation,
    required TResult Function(_UpdateInvitation value) updateInvitation,
  }) {
    return loadInvitations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInvitations value)? loadInvitations,
    TResult? Function(_InvitationsUpdated value)? invitationsUpdated,
    TResult? Function(_CreateInvitation value)? createInvitation,
    TResult? Function(_UpdateInvitation value)? updateInvitation,
  }) {
    return loadInvitations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInvitations value)? loadInvitations,
    TResult Function(_InvitationsUpdated value)? invitationsUpdated,
    TResult Function(_CreateInvitation value)? createInvitation,
    TResult Function(_UpdateInvitation value)? updateInvitation,
    required TResult orElse(),
  }) {
    if (loadInvitations != null) {
      return loadInvitations(this);
    }
    return orElse();
  }
}

abstract class _LoadInvitations implements GuestEvent {
  const factory _LoadInvitations(final String ownerId) = _$LoadInvitationsImpl;

  String get ownerId;

  /// Create a copy of GuestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadInvitationsImplCopyWith<_$LoadInvitationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvitationsUpdatedImplCopyWith<$Res> {
  factory _$$InvitationsUpdatedImplCopyWith(
    _$InvitationsUpdatedImpl value,
    $Res Function(_$InvitationsUpdatedImpl) then,
  ) = __$$InvitationsUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GuestInvitation> invitations});
}

/// @nodoc
class __$$InvitationsUpdatedImplCopyWithImpl<$Res>
    extends _$GuestEventCopyWithImpl<$Res, _$InvitationsUpdatedImpl>
    implements _$$InvitationsUpdatedImplCopyWith<$Res> {
  __$$InvitationsUpdatedImplCopyWithImpl(
    _$InvitationsUpdatedImpl _value,
    $Res Function(_$InvitationsUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? invitations = null}) {
    return _then(
      _$InvitationsUpdatedImpl(
        null == invitations
            ? _value._invitations
            : invitations // ignore: cast_nullable_to_non_nullable
                  as List<GuestInvitation>,
      ),
    );
  }
}

/// @nodoc

class _$InvitationsUpdatedImpl implements _InvitationsUpdated {
  const _$InvitationsUpdatedImpl(final List<GuestInvitation> invitations)
    : _invitations = invitations;

  final List<GuestInvitation> _invitations;
  @override
  List<GuestInvitation> get invitations {
    if (_invitations is EqualUnmodifiableListView) return _invitations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invitations);
  }

  @override
  String toString() {
    return 'GuestEvent.invitationsUpdated(invitations: $invitations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationsUpdatedImpl &&
            const DeepCollectionEquality().equals(
              other._invitations,
              _invitations,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_invitations),
  );

  /// Create a copy of GuestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationsUpdatedImplCopyWith<_$InvitationsUpdatedImpl> get copyWith =>
      __$$InvitationsUpdatedImplCopyWithImpl<_$InvitationsUpdatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String ownerId) loadInvitations,
    required TResult Function(List<GuestInvitation> invitations)
    invitationsUpdated,
    required TResult Function(GuestInvitation invitation) createInvitation,
    required TResult Function(GuestInvitation invitation) updateInvitation,
  }) {
    return invitationsUpdated(invitations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String ownerId)? loadInvitations,
    TResult? Function(List<GuestInvitation> invitations)? invitationsUpdated,
    TResult? Function(GuestInvitation invitation)? createInvitation,
    TResult? Function(GuestInvitation invitation)? updateInvitation,
  }) {
    return invitationsUpdated?.call(invitations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String ownerId)? loadInvitations,
    TResult Function(List<GuestInvitation> invitations)? invitationsUpdated,
    TResult Function(GuestInvitation invitation)? createInvitation,
    TResult Function(GuestInvitation invitation)? updateInvitation,
    required TResult orElse(),
  }) {
    if (invitationsUpdated != null) {
      return invitationsUpdated(invitations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInvitations value) loadInvitations,
    required TResult Function(_InvitationsUpdated value) invitationsUpdated,
    required TResult Function(_CreateInvitation value) createInvitation,
    required TResult Function(_UpdateInvitation value) updateInvitation,
  }) {
    return invitationsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInvitations value)? loadInvitations,
    TResult? Function(_InvitationsUpdated value)? invitationsUpdated,
    TResult? Function(_CreateInvitation value)? createInvitation,
    TResult? Function(_UpdateInvitation value)? updateInvitation,
  }) {
    return invitationsUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInvitations value)? loadInvitations,
    TResult Function(_InvitationsUpdated value)? invitationsUpdated,
    TResult Function(_CreateInvitation value)? createInvitation,
    TResult Function(_UpdateInvitation value)? updateInvitation,
    required TResult orElse(),
  }) {
    if (invitationsUpdated != null) {
      return invitationsUpdated(this);
    }
    return orElse();
  }
}

abstract class _InvitationsUpdated implements GuestEvent {
  const factory _InvitationsUpdated(final List<GuestInvitation> invitations) =
      _$InvitationsUpdatedImpl;

  List<GuestInvitation> get invitations;

  /// Create a copy of GuestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvitationsUpdatedImplCopyWith<_$InvitationsUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateInvitationImplCopyWith<$Res> {
  factory _$$CreateInvitationImplCopyWith(
    _$CreateInvitationImpl value,
    $Res Function(_$CreateInvitationImpl) then,
  ) = __$$CreateInvitationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GuestInvitation invitation});

  $GuestInvitationCopyWith<$Res> get invitation;
}

/// @nodoc
class __$$CreateInvitationImplCopyWithImpl<$Res>
    extends _$GuestEventCopyWithImpl<$Res, _$CreateInvitationImpl>
    implements _$$CreateInvitationImplCopyWith<$Res> {
  __$$CreateInvitationImplCopyWithImpl(
    _$CreateInvitationImpl _value,
    $Res Function(_$CreateInvitationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? invitation = null}) {
    return _then(
      _$CreateInvitationImpl(
        null == invitation
            ? _value.invitation
            : invitation // ignore: cast_nullable_to_non_nullable
                  as GuestInvitation,
      ),
    );
  }

  /// Create a copy of GuestEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GuestInvitationCopyWith<$Res> get invitation {
    return $GuestInvitationCopyWith<$Res>(_value.invitation, (value) {
      return _then(_value.copyWith(invitation: value));
    });
  }
}

/// @nodoc

class _$CreateInvitationImpl implements _CreateInvitation {
  const _$CreateInvitationImpl(this.invitation);

  @override
  final GuestInvitation invitation;

  @override
  String toString() {
    return 'GuestEvent.createInvitation(invitation: $invitation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateInvitationImpl &&
            (identical(other.invitation, invitation) ||
                other.invitation == invitation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invitation);

  /// Create a copy of GuestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateInvitationImplCopyWith<_$CreateInvitationImpl> get copyWith =>
      __$$CreateInvitationImplCopyWithImpl<_$CreateInvitationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String ownerId) loadInvitations,
    required TResult Function(List<GuestInvitation> invitations)
    invitationsUpdated,
    required TResult Function(GuestInvitation invitation) createInvitation,
    required TResult Function(GuestInvitation invitation) updateInvitation,
  }) {
    return createInvitation(invitation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String ownerId)? loadInvitations,
    TResult? Function(List<GuestInvitation> invitations)? invitationsUpdated,
    TResult? Function(GuestInvitation invitation)? createInvitation,
    TResult? Function(GuestInvitation invitation)? updateInvitation,
  }) {
    return createInvitation?.call(invitation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String ownerId)? loadInvitations,
    TResult Function(List<GuestInvitation> invitations)? invitationsUpdated,
    TResult Function(GuestInvitation invitation)? createInvitation,
    TResult Function(GuestInvitation invitation)? updateInvitation,
    required TResult orElse(),
  }) {
    if (createInvitation != null) {
      return createInvitation(invitation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInvitations value) loadInvitations,
    required TResult Function(_InvitationsUpdated value) invitationsUpdated,
    required TResult Function(_CreateInvitation value) createInvitation,
    required TResult Function(_UpdateInvitation value) updateInvitation,
  }) {
    return createInvitation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInvitations value)? loadInvitations,
    TResult? Function(_InvitationsUpdated value)? invitationsUpdated,
    TResult? Function(_CreateInvitation value)? createInvitation,
    TResult? Function(_UpdateInvitation value)? updateInvitation,
  }) {
    return createInvitation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInvitations value)? loadInvitations,
    TResult Function(_InvitationsUpdated value)? invitationsUpdated,
    TResult Function(_CreateInvitation value)? createInvitation,
    TResult Function(_UpdateInvitation value)? updateInvitation,
    required TResult orElse(),
  }) {
    if (createInvitation != null) {
      return createInvitation(this);
    }
    return orElse();
  }
}

abstract class _CreateInvitation implements GuestEvent {
  const factory _CreateInvitation(final GuestInvitation invitation) =
      _$CreateInvitationImpl;

  GuestInvitation get invitation;

  /// Create a copy of GuestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateInvitationImplCopyWith<_$CreateInvitationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateInvitationImplCopyWith<$Res> {
  factory _$$UpdateInvitationImplCopyWith(
    _$UpdateInvitationImpl value,
    $Res Function(_$UpdateInvitationImpl) then,
  ) = __$$UpdateInvitationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GuestInvitation invitation});

  $GuestInvitationCopyWith<$Res> get invitation;
}

/// @nodoc
class __$$UpdateInvitationImplCopyWithImpl<$Res>
    extends _$GuestEventCopyWithImpl<$Res, _$UpdateInvitationImpl>
    implements _$$UpdateInvitationImplCopyWith<$Res> {
  __$$UpdateInvitationImplCopyWithImpl(
    _$UpdateInvitationImpl _value,
    $Res Function(_$UpdateInvitationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? invitation = null}) {
    return _then(
      _$UpdateInvitationImpl(
        null == invitation
            ? _value.invitation
            : invitation // ignore: cast_nullable_to_non_nullable
                  as GuestInvitation,
      ),
    );
  }

  /// Create a copy of GuestEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GuestInvitationCopyWith<$Res> get invitation {
    return $GuestInvitationCopyWith<$Res>(_value.invitation, (value) {
      return _then(_value.copyWith(invitation: value));
    });
  }
}

/// @nodoc

class _$UpdateInvitationImpl implements _UpdateInvitation {
  const _$UpdateInvitationImpl(this.invitation);

  @override
  final GuestInvitation invitation;

  @override
  String toString() {
    return 'GuestEvent.updateInvitation(invitation: $invitation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateInvitationImpl &&
            (identical(other.invitation, invitation) ||
                other.invitation == invitation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invitation);

  /// Create a copy of GuestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateInvitationImplCopyWith<_$UpdateInvitationImpl> get copyWith =>
      __$$UpdateInvitationImplCopyWithImpl<_$UpdateInvitationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String ownerId) loadInvitations,
    required TResult Function(List<GuestInvitation> invitations)
    invitationsUpdated,
    required TResult Function(GuestInvitation invitation) createInvitation,
    required TResult Function(GuestInvitation invitation) updateInvitation,
  }) {
    return updateInvitation(invitation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String ownerId)? loadInvitations,
    TResult? Function(List<GuestInvitation> invitations)? invitationsUpdated,
    TResult? Function(GuestInvitation invitation)? createInvitation,
    TResult? Function(GuestInvitation invitation)? updateInvitation,
  }) {
    return updateInvitation?.call(invitation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String ownerId)? loadInvitations,
    TResult Function(List<GuestInvitation> invitations)? invitationsUpdated,
    TResult Function(GuestInvitation invitation)? createInvitation,
    TResult Function(GuestInvitation invitation)? updateInvitation,
    required TResult orElse(),
  }) {
    if (updateInvitation != null) {
      return updateInvitation(invitation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInvitations value) loadInvitations,
    required TResult Function(_InvitationsUpdated value) invitationsUpdated,
    required TResult Function(_CreateInvitation value) createInvitation,
    required TResult Function(_UpdateInvitation value) updateInvitation,
  }) {
    return updateInvitation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInvitations value)? loadInvitations,
    TResult? Function(_InvitationsUpdated value)? invitationsUpdated,
    TResult? Function(_CreateInvitation value)? createInvitation,
    TResult? Function(_UpdateInvitation value)? updateInvitation,
  }) {
    return updateInvitation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInvitations value)? loadInvitations,
    TResult Function(_InvitationsUpdated value)? invitationsUpdated,
    TResult Function(_CreateInvitation value)? createInvitation,
    TResult Function(_UpdateInvitation value)? updateInvitation,
    required TResult orElse(),
  }) {
    if (updateInvitation != null) {
      return updateInvitation(this);
    }
    return orElse();
  }
}

abstract class _UpdateInvitation implements GuestEvent {
  const factory _UpdateInvitation(final GuestInvitation invitation) =
      _$UpdateInvitationImpl;

  GuestInvitation get invitation;

  /// Create a copy of GuestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateInvitationImplCopyWith<_$UpdateInvitationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
