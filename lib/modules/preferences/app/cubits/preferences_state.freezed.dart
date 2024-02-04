// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PreferencesState {
  List<List<String>> get preferences => throw _privateConstructorUsedError;
  List<String> get selectedPreferences => throw _privateConstructorUsedError;
  String get search => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreferencesStateCopyWith<PreferencesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesStateCopyWith<$Res> {
  factory $PreferencesStateCopyWith(
          PreferencesState value, $Res Function(PreferencesState) then) =
      _$PreferencesStateCopyWithImpl<$Res, PreferencesState>;
  @useResult
  $Res call(
      {List<List<String>> preferences,
      List<String> selectedPreferences,
      String search,
      int page,
      bool hasMore});
}

/// @nodoc
class _$PreferencesStateCopyWithImpl<$Res, $Val extends PreferencesState>
    implements $PreferencesStateCopyWith<$Res> {
  _$PreferencesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferences = null,
    Object? selectedPreferences = null,
    Object? search = null,
    Object? page = null,
    Object? hasMore = null,
  }) {
    return _then(_value.copyWith(
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      selectedPreferences: null == selectedPreferences
          ? _value.selectedPreferences
          : selectedPreferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferencesStateImplCopyWith<$Res>
    implements $PreferencesStateCopyWith<$Res> {
  factory _$$PreferencesStateImplCopyWith(_$PreferencesStateImpl value,
          $Res Function(_$PreferencesStateImpl) then) =
      __$$PreferencesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<String>> preferences,
      List<String> selectedPreferences,
      String search,
      int page,
      bool hasMore});
}

/// @nodoc
class __$$PreferencesStateImplCopyWithImpl<$Res>
    extends _$PreferencesStateCopyWithImpl<$Res, _$PreferencesStateImpl>
    implements _$$PreferencesStateImplCopyWith<$Res> {
  __$$PreferencesStateImplCopyWithImpl(_$PreferencesStateImpl _value,
      $Res Function(_$PreferencesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferences = null,
    Object? selectedPreferences = null,
    Object? search = null,
    Object? page = null,
    Object? hasMore = null,
  }) {
    return _then(_$PreferencesStateImpl(
      preferences: null == preferences
          ? _value._preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      selectedPreferences: null == selectedPreferences
          ? _value._selectedPreferences
          : selectedPreferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PreferencesStateImpl implements _PreferencesState {
  const _$PreferencesStateImpl(
      {final List<List<String>> preferences = const [],
      final List<String> selectedPreferences = const [],
      this.search = "",
      this.page = 1,
      this.hasMore = true})
      : _preferences = preferences,
        _selectedPreferences = selectedPreferences;

  final List<List<String>> _preferences;
  @override
  @JsonKey()
  List<List<String>> get preferences {
    if (_preferences is EqualUnmodifiableListView) return _preferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferences);
  }

  final List<String> _selectedPreferences;
  @override
  @JsonKey()
  List<String> get selectedPreferences {
    if (_selectedPreferences is EqualUnmodifiableListView)
      return _selectedPreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedPreferences);
  }

  @override
  @JsonKey()
  final String search;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool hasMore;

  @override
  String toString() {
    return 'PreferencesState(preferences: $preferences, selectedPreferences: $selectedPreferences, search: $search, page: $page, hasMore: $hasMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferencesStateImpl &&
            const DeepCollectionEquality()
                .equals(other._preferences, _preferences) &&
            const DeepCollectionEquality()
                .equals(other._selectedPreferences, _selectedPreferences) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_preferences),
      const DeepCollectionEquality().hash(_selectedPreferences),
      search,
      page,
      hasMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferencesStateImplCopyWith<_$PreferencesStateImpl> get copyWith =>
      __$$PreferencesStateImplCopyWithImpl<_$PreferencesStateImpl>(
          this, _$identity);
}

abstract class _PreferencesState implements PreferencesState {
  const factory _PreferencesState(
      {final List<List<String>> preferences,
      final List<String> selectedPreferences,
      final String search,
      final int page,
      final bool hasMore}) = _$PreferencesStateImpl;

  @override
  List<List<String>> get preferences;
  @override
  List<String> get selectedPreferences;
  @override
  String get search;
  @override
  int get page;
  @override
  bool get hasMore;
  @override
  @JsonKey(ignore: true)
  _$$PreferencesStateImplCopyWith<_$PreferencesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
