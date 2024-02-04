// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResetPasswordState {
  int get index => throw _privateConstructorUsedError;
  String get secretToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordStateCopyWith<ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateCopyWith(
          ResetPasswordState value, $Res Function(ResetPasswordState) then) =
      _$ResetPasswordStateCopyWithImpl<$Res, ResetPasswordState>;
  @useResult
  $Res call({int index, String secretToken});
}

/// @nodoc
class _$ResetPasswordStateCopyWithImpl<$Res, $Val extends ResetPasswordState>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? secretToken = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      secretToken: null == secretToken
          ? _value.secretToken
          : secretToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordStateeImplCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordStateeImplCopyWith(_$ResetPasswordStateeImpl value,
          $Res Function(_$ResetPasswordStateeImpl) then) =
      __$$ResetPasswordStateeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, String secretToken});
}

/// @nodoc
class __$$ResetPasswordStateeImplCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res, _$ResetPasswordStateeImpl>
    implements _$$ResetPasswordStateeImplCopyWith<$Res> {
  __$$ResetPasswordStateeImplCopyWithImpl(_$ResetPasswordStateeImpl _value,
      $Res Function(_$ResetPasswordStateeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? secretToken = null,
  }) {
    return _then(_$ResetPasswordStateeImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      secretToken: null == secretToken
          ? _value.secretToken
          : secretToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResetPasswordStateeImpl implements _ResetPasswordStatee {
  const _$ResetPasswordStateeImpl({this.index = 0, this.secretToken = ""});

  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final String secretToken;

  @override
  String toString() {
    return 'ResetPasswordState(index: $index, secretToken: $secretToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordStateeImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.secretToken, secretToken) ||
                other.secretToken == secretToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, secretToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordStateeImplCopyWith<_$ResetPasswordStateeImpl> get copyWith =>
      __$$ResetPasswordStateeImplCopyWithImpl<_$ResetPasswordStateeImpl>(
          this, _$identity);
}

abstract class _ResetPasswordStatee implements ResetPasswordState {
  const factory _ResetPasswordStatee(
      {final int index, final String secretToken}) = _$ResetPasswordStateeImpl;

  @override
  int get index;
  @override
  String get secretToken;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordStateeImplCopyWith<_$ResetPasswordStateeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
