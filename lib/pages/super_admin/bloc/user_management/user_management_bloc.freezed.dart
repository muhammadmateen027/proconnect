// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_management_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserManagementEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String email,
      String fullName,
      UserRole role,
      String password,
      String? condominiumId,
      String? agencyId,
    )
    adminCreateUser,
    required TResult Function(AppUser user) adminUpdateUser,
    required TResult Function(String uid) adminDeleteUser,
    required TResult Function() loadUsers,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String email,
      String fullName,
      UserRole role,
      String password,
      String? condominiumId,
      String? agencyId,
    )?
    adminCreateUser,
    TResult? Function(AppUser user)? adminUpdateUser,
    TResult? Function(String uid)? adminDeleteUser,
    TResult? Function()? loadUsers,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String email,
      String fullName,
      UserRole role,
      String password,
      String? condominiumId,
      String? agencyId,
    )?
    adminCreateUser,
    TResult Function(AppUser user)? adminUpdateUser,
    TResult Function(String uid)? adminDeleteUser,
    TResult Function()? loadUsers,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AdminCreateUser value) adminCreateUser,
    required TResult Function(_AdminUpdateUser value) adminUpdateUser,
    required TResult Function(_AdminDeleteUser value) adminDeleteUser,
    required TResult Function(_LoadUsers value) loadUsers,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AdminCreateUser value)? adminCreateUser,
    TResult? Function(_AdminUpdateUser value)? adminUpdateUser,
    TResult? Function(_AdminDeleteUser value)? adminDeleteUser,
    TResult? Function(_LoadUsers value)? loadUsers,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AdminCreateUser value)? adminCreateUser,
    TResult Function(_AdminUpdateUser value)? adminUpdateUser,
    TResult Function(_AdminDeleteUser value)? adminDeleteUser,
    TResult Function(_LoadUsers value)? loadUsers,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserManagementEventCopyWith<$Res> {
  factory $UserManagementEventCopyWith(
    UserManagementEvent value,
    $Res Function(UserManagementEvent) then,
  ) = _$UserManagementEventCopyWithImpl<$Res, UserManagementEvent>;
}

/// @nodoc
class _$UserManagementEventCopyWithImpl<$Res, $Val extends UserManagementEvent>
    implements $UserManagementEventCopyWith<$Res> {
  _$UserManagementEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AdminCreateUserImplCopyWith<$Res> {
  factory _$$AdminCreateUserImplCopyWith(
    _$AdminCreateUserImpl value,
    $Res Function(_$AdminCreateUserImpl) then,
  ) = __$$AdminCreateUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String email,
    String fullName,
    UserRole role,
    String password,
    String? condominiumId,
    String? agencyId,
  });
}

/// @nodoc
class __$$AdminCreateUserImplCopyWithImpl<$Res>
    extends _$UserManagementEventCopyWithImpl<$Res, _$AdminCreateUserImpl>
    implements _$$AdminCreateUserImplCopyWith<$Res> {
  __$$AdminCreateUserImplCopyWithImpl(
    _$AdminCreateUserImpl _value,
    $Res Function(_$AdminCreateUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? fullName = null,
    Object? role = null,
    Object? password = null,
    Object? condominiumId = freezed,
    Object? agencyId = freezed,
  }) {
    return _then(
      _$AdminCreateUserImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as UserRole,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        condominiumId: freezed == condominiumId
            ? _value.condominiumId
            : condominiumId // ignore: cast_nullable_to_non_nullable
                  as String?,
        agencyId: freezed == agencyId
            ? _value.agencyId
            : agencyId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AdminCreateUserImpl implements _AdminCreateUser {
  const _$AdminCreateUserImpl({
    required this.email,
    required this.fullName,
    required this.role,
    required this.password,
    this.condominiumId,
    this.agencyId,
  });

  @override
  final String email;
  @override
  final String fullName;
  @override
  final UserRole role;
  @override
  final String password;
  @override
  final String? condominiumId;
  @override
  final String? agencyId;

  @override
  String toString() {
    return 'UserManagementEvent.adminCreateUser(email: $email, fullName: $fullName, role: $role, password: $password, condominiumId: $condominiumId, agencyId: $agencyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminCreateUserImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.condominiumId, condominiumId) ||
                other.condominiumId == condominiumId) &&
            (identical(other.agencyId, agencyId) ||
                other.agencyId == agencyId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    email,
    fullName,
    role,
    password,
    condominiumId,
    agencyId,
  );

  /// Create a copy of UserManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminCreateUserImplCopyWith<_$AdminCreateUserImpl> get copyWith =>
      __$$AdminCreateUserImplCopyWithImpl<_$AdminCreateUserImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String email,
      String fullName,
      UserRole role,
      String password,
      String? condominiumId,
      String? agencyId,
    )
    adminCreateUser,
    required TResult Function(AppUser user) adminUpdateUser,
    required TResult Function(String uid) adminDeleteUser,
    required TResult Function() loadUsers,
  }) {
    return adminCreateUser(
      email,
      fullName,
      role,
      password,
      condominiumId,
      agencyId,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String email,
      String fullName,
      UserRole role,
      String password,
      String? condominiumId,
      String? agencyId,
    )?
    adminCreateUser,
    TResult? Function(AppUser user)? adminUpdateUser,
    TResult? Function(String uid)? adminDeleteUser,
    TResult? Function()? loadUsers,
  }) {
    return adminCreateUser?.call(
      email,
      fullName,
      role,
      password,
      condominiumId,
      agencyId,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String email,
      String fullName,
      UserRole role,
      String password,
      String? condominiumId,
      String? agencyId,
    )?
    adminCreateUser,
    TResult Function(AppUser user)? adminUpdateUser,
    TResult Function(String uid)? adminDeleteUser,
    TResult Function()? loadUsers,
    required TResult orElse(),
  }) {
    if (adminCreateUser != null) {
      return adminCreateUser(
        email,
        fullName,
        role,
        password,
        condominiumId,
        agencyId,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AdminCreateUser value) adminCreateUser,
    required TResult Function(_AdminUpdateUser value) adminUpdateUser,
    required TResult Function(_AdminDeleteUser value) adminDeleteUser,
    required TResult Function(_LoadUsers value) loadUsers,
  }) {
    return adminCreateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AdminCreateUser value)? adminCreateUser,
    TResult? Function(_AdminUpdateUser value)? adminUpdateUser,
    TResult? Function(_AdminDeleteUser value)? adminDeleteUser,
    TResult? Function(_LoadUsers value)? loadUsers,
  }) {
    return adminCreateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AdminCreateUser value)? adminCreateUser,
    TResult Function(_AdminUpdateUser value)? adminUpdateUser,
    TResult Function(_AdminDeleteUser value)? adminDeleteUser,
    TResult Function(_LoadUsers value)? loadUsers,
    required TResult orElse(),
  }) {
    if (adminCreateUser != null) {
      return adminCreateUser(this);
    }
    return orElse();
  }
}

abstract class _AdminCreateUser implements UserManagementEvent {
  const factory _AdminCreateUser({
    required final String email,
    required final String fullName,
    required final UserRole role,
    required final String password,
    final String? condominiumId,
    final String? agencyId,
  }) = _$AdminCreateUserImpl;

  String get email;
  String get fullName;
  UserRole get role;
  String get password;
  String? get condominiumId;
  String? get agencyId;

  /// Create a copy of UserManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminCreateUserImplCopyWith<_$AdminCreateUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminUpdateUserImplCopyWith<$Res> {
  factory _$$AdminUpdateUserImplCopyWith(
    _$AdminUpdateUserImpl value,
    $Res Function(_$AdminUpdateUserImpl) then,
  ) = __$$AdminUpdateUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppUser user});

  $AppUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AdminUpdateUserImplCopyWithImpl<$Res>
    extends _$UserManagementEventCopyWithImpl<$Res, _$AdminUpdateUserImpl>
    implements _$$AdminUpdateUserImplCopyWith<$Res> {
  __$$AdminUpdateUserImplCopyWithImpl(
    _$AdminUpdateUserImpl _value,
    $Res Function(_$AdminUpdateUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null}) {
    return _then(
      _$AdminUpdateUserImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as AppUser,
      ),
    );
  }

  /// Create a copy of UserManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res> get user {
    return $AppUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AdminUpdateUserImpl implements _AdminUpdateUser {
  const _$AdminUpdateUserImpl({required this.user});

  @override
  final AppUser user;

  @override
  String toString() {
    return 'UserManagementEvent.adminUpdateUser(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminUpdateUserImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of UserManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminUpdateUserImplCopyWith<_$AdminUpdateUserImpl> get copyWith =>
      __$$AdminUpdateUserImplCopyWithImpl<_$AdminUpdateUserImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String email,
      String fullName,
      UserRole role,
      String password,
      String? condominiumId,
      String? agencyId,
    )
    adminCreateUser,
    required TResult Function(AppUser user) adminUpdateUser,
    required TResult Function(String uid) adminDeleteUser,
    required TResult Function() loadUsers,
  }) {
    return adminUpdateUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String email,
      String fullName,
      UserRole role,
      String password,
      String? condominiumId,
      String? agencyId,
    )?
    adminCreateUser,
    TResult? Function(AppUser user)? adminUpdateUser,
    TResult? Function(String uid)? adminDeleteUser,
    TResult? Function()? loadUsers,
  }) {
    return adminUpdateUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String email,
      String fullName,
      UserRole role,
      String password,
      String? condominiumId,
      String? agencyId,
    )?
    adminCreateUser,
    TResult Function(AppUser user)? adminUpdateUser,
    TResult Function(String uid)? adminDeleteUser,
    TResult Function()? loadUsers,
    required TResult orElse(),
  }) {
    if (adminUpdateUser != null) {
      return adminUpdateUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AdminCreateUser value) adminCreateUser,
    required TResult Function(_AdminUpdateUser value) adminUpdateUser,
    required TResult Function(_AdminDeleteUser value) adminDeleteUser,
    required TResult Function(_LoadUsers value) loadUsers,
  }) {
    return adminUpdateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AdminCreateUser value)? adminCreateUser,
    TResult? Function(_AdminUpdateUser value)? adminUpdateUser,
    TResult? Function(_AdminDeleteUser value)? adminDeleteUser,
    TResult? Function(_LoadUsers value)? loadUsers,
  }) {
    return adminUpdateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AdminCreateUser value)? adminCreateUser,
    TResult Function(_AdminUpdateUser value)? adminUpdateUser,
    TResult Function(_AdminDeleteUser value)? adminDeleteUser,
    TResult Function(_LoadUsers value)? loadUsers,
    required TResult orElse(),
  }) {
    if (adminUpdateUser != null) {
      return adminUpdateUser(this);
    }
    return orElse();
  }
}

abstract class _AdminUpdateUser implements UserManagementEvent {
  const factory _AdminUpdateUser({required final AppUser user}) =
      _$AdminUpdateUserImpl;

  AppUser get user;

  /// Create a copy of UserManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminUpdateUserImplCopyWith<_$AdminUpdateUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminDeleteUserImplCopyWith<$Res> {
  factory _$$AdminDeleteUserImplCopyWith(
    _$AdminDeleteUserImpl value,
    $Res Function(_$AdminDeleteUserImpl) then,
  ) = __$$AdminDeleteUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$AdminDeleteUserImplCopyWithImpl<$Res>
    extends _$UserManagementEventCopyWithImpl<$Res, _$AdminDeleteUserImpl>
    implements _$$AdminDeleteUserImplCopyWith<$Res> {
  __$$AdminDeleteUserImplCopyWithImpl(
    _$AdminDeleteUserImpl _value,
    $Res Function(_$AdminDeleteUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? uid = null}) {
    return _then(
      _$AdminDeleteUserImpl(
        uid: null == uid
            ? _value.uid
            : uid // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AdminDeleteUserImpl implements _AdminDeleteUser {
  const _$AdminDeleteUserImpl({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'UserManagementEvent.adminDeleteUser(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminDeleteUserImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  /// Create a copy of UserManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminDeleteUserImplCopyWith<_$AdminDeleteUserImpl> get copyWith =>
      __$$AdminDeleteUserImplCopyWithImpl<_$AdminDeleteUserImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String email,
      String fullName,
      UserRole role,
      String password,
      String? condominiumId,
      String? agencyId,
    )
    adminCreateUser,
    required TResult Function(AppUser user) adminUpdateUser,
    required TResult Function(String uid) adminDeleteUser,
    required TResult Function() loadUsers,
  }) {
    return adminDeleteUser(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String email,
      String fullName,
      UserRole role,
      String password,
      String? condominiumId,
      String? agencyId,
    )?
    adminCreateUser,
    TResult? Function(AppUser user)? adminUpdateUser,
    TResult? Function(String uid)? adminDeleteUser,
    TResult? Function()? loadUsers,
  }) {
    return adminDeleteUser?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String email,
      String fullName,
      UserRole role,
      String password,
      String? condominiumId,
      String? agencyId,
    )?
    adminCreateUser,
    TResult Function(AppUser user)? adminUpdateUser,
    TResult Function(String uid)? adminDeleteUser,
    TResult Function()? loadUsers,
    required TResult orElse(),
  }) {
    if (adminDeleteUser != null) {
      return adminDeleteUser(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AdminCreateUser value) adminCreateUser,
    required TResult Function(_AdminUpdateUser value) adminUpdateUser,
    required TResult Function(_AdminDeleteUser value) adminDeleteUser,
    required TResult Function(_LoadUsers value) loadUsers,
  }) {
    return adminDeleteUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AdminCreateUser value)? adminCreateUser,
    TResult? Function(_AdminUpdateUser value)? adminUpdateUser,
    TResult? Function(_AdminDeleteUser value)? adminDeleteUser,
    TResult? Function(_LoadUsers value)? loadUsers,
  }) {
    return adminDeleteUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AdminCreateUser value)? adminCreateUser,
    TResult Function(_AdminUpdateUser value)? adminUpdateUser,
    TResult Function(_AdminDeleteUser value)? adminDeleteUser,
    TResult Function(_LoadUsers value)? loadUsers,
    required TResult orElse(),
  }) {
    if (adminDeleteUser != null) {
      return adminDeleteUser(this);
    }
    return orElse();
  }
}

abstract class _AdminDeleteUser implements UserManagementEvent {
  const factory _AdminDeleteUser({required final String uid}) =
      _$AdminDeleteUserImpl;

  String get uid;

  /// Create a copy of UserManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminDeleteUserImplCopyWith<_$AdminDeleteUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadUsersImplCopyWith<$Res> {
  factory _$$LoadUsersImplCopyWith(
    _$LoadUsersImpl value,
    $Res Function(_$LoadUsersImpl) then,
  ) = __$$LoadUsersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadUsersImplCopyWithImpl<$Res>
    extends _$UserManagementEventCopyWithImpl<$Res, _$LoadUsersImpl>
    implements _$$LoadUsersImplCopyWith<$Res> {
  __$$LoadUsersImplCopyWithImpl(
    _$LoadUsersImpl _value,
    $Res Function(_$LoadUsersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadUsersImpl implements _LoadUsers {
  const _$LoadUsersImpl();

  @override
  String toString() {
    return 'UserManagementEvent.loadUsers()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadUsersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String email,
      String fullName,
      UserRole role,
      String password,
      String? condominiumId,
      String? agencyId,
    )
    adminCreateUser,
    required TResult Function(AppUser user) adminUpdateUser,
    required TResult Function(String uid) adminDeleteUser,
    required TResult Function() loadUsers,
  }) {
    return loadUsers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String email,
      String fullName,
      UserRole role,
      String password,
      String? condominiumId,
      String? agencyId,
    )?
    adminCreateUser,
    TResult? Function(AppUser user)? adminUpdateUser,
    TResult? Function(String uid)? adminDeleteUser,
    TResult? Function()? loadUsers,
  }) {
    return loadUsers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String email,
      String fullName,
      UserRole role,
      String password,
      String? condominiumId,
      String? agencyId,
    )?
    adminCreateUser,
    TResult Function(AppUser user)? adminUpdateUser,
    TResult Function(String uid)? adminDeleteUser,
    TResult Function()? loadUsers,
    required TResult orElse(),
  }) {
    if (loadUsers != null) {
      return loadUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AdminCreateUser value) adminCreateUser,
    required TResult Function(_AdminUpdateUser value) adminUpdateUser,
    required TResult Function(_AdminDeleteUser value) adminDeleteUser,
    required TResult Function(_LoadUsers value) loadUsers,
  }) {
    return loadUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AdminCreateUser value)? adminCreateUser,
    TResult? Function(_AdminUpdateUser value)? adminUpdateUser,
    TResult? Function(_AdminDeleteUser value)? adminDeleteUser,
    TResult? Function(_LoadUsers value)? loadUsers,
  }) {
    return loadUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AdminCreateUser value)? adminCreateUser,
    TResult Function(_AdminUpdateUser value)? adminUpdateUser,
    TResult Function(_AdminDeleteUser value)? adminDeleteUser,
    TResult Function(_LoadUsers value)? loadUsers,
    required TResult orElse(),
  }) {
    if (loadUsers != null) {
      return loadUsers(this);
    }
    return orElse();
  }
}

abstract class _LoadUsers implements UserManagementEvent {
  const factory _LoadUsers() = _$LoadUsersImpl;
}

/// @nodoc
mixin _$UserManagementState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<AppUser> users) loaded,
    required TResult Function(String errorKey) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<AppUser> users)? loaded,
    TResult? Function(String errorKey)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<AppUser> users)? loaded,
    TResult Function(String errorKey)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserManagementStateCopyWith<$Res> {
  factory $UserManagementStateCopyWith(
    UserManagementState value,
    $Res Function(UserManagementState) then,
  ) = _$UserManagementStateCopyWithImpl<$Res, UserManagementState>;
}

/// @nodoc
class _$UserManagementStateCopyWithImpl<$Res, $Val extends UserManagementState>
    implements $UserManagementStateCopyWith<$Res> {
  _$UserManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UserManagementStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'UserManagementState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<AppUser> users) loaded,
    required TResult Function(String errorKey) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<AppUser> users)? loaded,
    TResult? Function(String errorKey)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<AppUser> users)? loaded,
    TResult Function(String errorKey)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UserManagementState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$UserManagementStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'UserManagementState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<AppUser> users) loaded,
    required TResult Function(String errorKey) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<AppUser> users)? loaded,
    TResult? Function(String errorKey)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<AppUser> users)? loaded,
    TResult Function(String errorKey)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserManagementState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$UserManagementStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'UserManagementState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<AppUser> users) loaded,
    required TResult Function(String errorKey) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<AppUser> users)? loaded,
    TResult? Function(String errorKey)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<AppUser> users)? loaded,
    TResult Function(String errorKey)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements UserManagementState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AppUser> users});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$UserManagementStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? users = null}) {
    return _then(
      _$LoadedImpl(
        users: null == users
            ? _value._users
            : users // ignore: cast_nullable_to_non_nullable
                  as List<AppUser>,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required final List<AppUser> users}) : _users = users;

  final List<AppUser> _users;
  @override
  List<AppUser> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'UserManagementState.loaded(users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  /// Create a copy of UserManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<AppUser> users) loaded,
    required TResult Function(String errorKey) failure,
  }) {
    return loaded(users);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<AppUser> users)? loaded,
    TResult? Function(String errorKey)? failure,
  }) {
    return loaded?.call(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<AppUser> users)? loaded,
    TResult Function(String errorKey)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements UserManagementState {
  const factory _Loaded({required final List<AppUser> users}) = _$LoadedImpl;

  List<AppUser> get users;

  /// Create a copy of UserManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
    _$FailureImpl value,
    $Res Function(_$FailureImpl) then,
  ) = __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorKey});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$UserManagementStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
    _$FailureImpl _value,
    $Res Function(_$FailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? errorKey = null}) {
    return _then(
      _$FailureImpl(
        errorKey: null == errorKey
            ? _value.errorKey
            : errorKey // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl({required this.errorKey});

  @override
  final String errorKey;

  @override
  String toString() {
    return 'UserManagementState.failure(errorKey: $errorKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.errorKey, errorKey) ||
                other.errorKey == errorKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorKey);

  /// Create a copy of UserManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<AppUser> users) loaded,
    required TResult Function(String errorKey) failure,
  }) {
    return failure(errorKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<AppUser> users)? loaded,
    TResult? Function(String errorKey)? failure,
  }) {
    return failure?.call(errorKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<AppUser> users)? loaded,
    TResult Function(String errorKey)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements UserManagementState {
  const factory _Failure({required final String errorKey}) = _$FailureImpl;

  String get errorKey;

  /// Create a copy of UserManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
