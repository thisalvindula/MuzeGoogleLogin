// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  bool get hasMore => throw _privateConstructorUsedError;
  String get search => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  SearchCategoryType get searchCategoryType =>
      throw _privateConstructorUsedError;
  DataSearchDto? get searchDto => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {bool hasMore,
      String search,
      int page,
      SearchCategoryType searchCategoryType,
      DataSearchDto? searchDto});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasMore = null,
    Object? search = null,
    Object? page = null,
    Object? searchCategoryType = null,
    Object? searchDto = freezed,
  }) {
    return _then(_value.copyWith(
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      searchCategoryType: null == searchCategoryType
          ? _value.searchCategoryType
          : searchCategoryType // ignore: cast_nullable_to_non_nullable
              as SearchCategoryType,
      searchDto: freezed == searchDto
          ? _value.searchDto
          : searchDto // ignore: cast_nullable_to_non_nullable
              as DataSearchDto?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
          _$SearchStateImpl value, $Res Function(_$SearchStateImpl) then) =
      __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hasMore,
      String search,
      int page,
      SearchCategoryType searchCategoryType,
      DataSearchDto? searchDto});
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
      _$SearchStateImpl _value, $Res Function(_$SearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasMore = null,
    Object? search = null,
    Object? page = null,
    Object? searchCategoryType = null,
    Object? searchDto = freezed,
  }) {
    return _then(_$SearchStateImpl(
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      searchCategoryType: null == searchCategoryType
          ? _value.searchCategoryType
          : searchCategoryType // ignore: cast_nullable_to_non_nullable
              as SearchCategoryType,
      searchDto: freezed == searchDto
          ? _value.searchDto
          : searchDto // ignore: cast_nullable_to_non_nullable
              as DataSearchDto?,
    ));
  }
}

/// @nodoc

class _$SearchStateImpl implements _SearchState {
  const _$SearchStateImpl(
      {this.hasMore = true,
      this.search = "",
      this.page = 1,
      this.searchCategoryType = SearchCategoryType.artist,
      this.searchDto});

  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final String search;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final SearchCategoryType searchCategoryType;
  @override
  final DataSearchDto? searchDto;

  @override
  String toString() {
    return 'SearchState(hasMore: $hasMore, search: $search, page: $page, searchCategoryType: $searchCategoryType, searchDto: $searchDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.searchCategoryType, searchCategoryType) ||
                other.searchCategoryType == searchCategoryType) &&
            (identical(other.searchDto, searchDto) ||
                other.searchDto == searchDto));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, hasMore, search, page, searchCategoryType, searchDto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {final bool hasMore,
      final String search,
      final int page,
      final SearchCategoryType searchCategoryType,
      final DataSearchDto? searchDto}) = _$SearchStateImpl;

  @override
  bool get hasMore;
  @override
  String get search;
  @override
  int get page;
  @override
  SearchCategoryType get searchCategoryType;
  @override
  DataSearchDto? get searchDto;
  @override
  @JsonKey(ignore: true)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
