// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner_selection_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OwnerSelectionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOwners,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchOwners,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOwners,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOwners value) fetchOwners,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOwners value)? fetchOwners,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOwners value)? fetchOwners,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerSelectionEventCopyWith<$Res> {
  factory $OwnerSelectionEventCopyWith(
    OwnerSelectionEvent value,
    $Res Function(OwnerSelectionEvent) then,
  ) = _$OwnerSelectionEventCopyWithImpl<$Res, OwnerSelectionEvent>;
}

/// @nodoc
class _$OwnerSelectionEventCopyWithImpl<$Res, $Val extends OwnerSelectionEvent>
    implements $OwnerSelectionEventCopyWith<$Res> {
  _$OwnerSelectionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OwnerSelectionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchOwnersImplCopyWith<$Res> {
  factory _$$FetchOwnersImplCopyWith(
    _$FetchOwnersImpl value,
    $Res Function(_$FetchOwnersImpl) then,
  ) = __$$FetchOwnersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchOwnersImplCopyWithImpl<$Res>
    extends _$OwnerSelectionEventCopyWithImpl<$Res, _$FetchOwnersImpl>
    implements _$$FetchOwnersImplCopyWith<$Res> {
  __$$FetchOwnersImplCopyWithImpl(
    _$FetchOwnersImpl _value,
    $Res Function(_$FetchOwnersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OwnerSelectionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchOwnersImpl implements _FetchOwners {
  const _$FetchOwnersImpl();

  @override
  String toString() {
    return 'OwnerSelectionEvent.fetchOwners()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchOwnersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOwners,
  }) {
    return fetchOwners();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchOwners,
  }) {
    return fetchOwners?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOwners,
    required TResult orElse(),
  }) {
    if (fetchOwners != null) {
      return fetchOwners();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOwners value) fetchOwners,
  }) {
    return fetchOwners(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOwners value)? fetchOwners,
  }) {
    return fetchOwners?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOwners value)? fetchOwners,
    required TResult orElse(),
  }) {
    if (fetchOwners != null) {
      return fetchOwners(this);
    }
    return orElse();
  }
}

abstract class _FetchOwners implements OwnerSelectionEvent {
  const factory _FetchOwners() = _$FetchOwnersImpl;
}
