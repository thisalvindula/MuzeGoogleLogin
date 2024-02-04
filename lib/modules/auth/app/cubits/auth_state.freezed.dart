// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  String get token => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  AuthType get authType => throw _privateConstructorUsedError;
  StartAppStatus get status => throw _privateConstructorUsedError;
  UserDto? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {String token,
      bool loading,
      AuthType authType,
      StartAppStatus status,
      UserDto? user});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? loading = null,
    Object? authType = null,
    Object? status = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      authType: null == authType
          ? _value.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as AuthType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StartAppStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String token,
      bool loading,
      AuthType authType,
      StartAppStatus status,
      UserDto? user});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? loading = null,
    Object? authType = null,
    Object? status = null,
    Object? user = freezed,
  }) {
    return _then(_$AuthStateImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      authType: null == authType
          ? _value.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as AuthType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StartAppStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {this.token = "",
      this.loading = false,
      this.authType = AuthType.signin,
      this.status = StartAppStatus.auth,
      this.user});

  @override
  @JsonKey()
  final String token;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final AuthType authType;
  @override
  @JsonKey()
  final StartAppStatus status;
  @override
  final UserDto? user;

  @override
  String toString() {
    return 'AuthState(token: $token, loading: $loading, authType: $authType, status: $status, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.authType, authType) ||
                other.authType == authType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, token, loading, authType, status, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final String token,
      final bool loading,
      final AuthType authType,
      final StartAppStatus status,
      final UserDto? user}) = _$AuthStateImpl;

  @override
  String get token;
  @override
  bool get loading;
  @override
  AuthType get authType;
  @override
  StartAppStatus get status;
  @override
  UserDto? get user;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
