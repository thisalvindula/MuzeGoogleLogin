// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SocialState {
  bool get playing => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  bool get isSuggestion => throw _privateConstructorUsedError;
  int get indexFirstSuggestionPost => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  List<PostDto> get posts => throw _privateConstructorUsedError;
  LikesDto? get likes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SocialStateCopyWith<SocialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialStateCopyWith<$Res> {
  factory $SocialStateCopyWith(
          SocialState value, $Res Function(SocialState) then) =
      _$SocialStateCopyWithImpl<$Res, SocialState>;
  @useResult
  $Res call(
      {bool playing,
      int page,
      bool hasMore,
      bool isSuggestion,
      int indexFirstSuggestionPost,
      int index,
      List<PostDto> posts,
      LikesDto? likes});
}

/// @nodoc
class _$SocialStateCopyWithImpl<$Res, $Val extends SocialState>
    implements $SocialStateCopyWith<$Res> {
  _$SocialStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playing = null,
    Object? page = null,
    Object? hasMore = null,
    Object? isSuggestion = null,
    Object? indexFirstSuggestionPost = null,
    Object? index = null,
    Object? posts = null,
    Object? likes = freezed,
  }) {
    return _then(_value.copyWith(
      playing: null == playing
          ? _value.playing
          : playing // ignore: cast_nullable_to_non_nullable
              as bool,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuggestion: null == isSuggestion
          ? _value.isSuggestion
          : isSuggestion // ignore: cast_nullable_to_non_nullable
              as bool,
      indexFirstSuggestionPost: null == indexFirstSuggestionPost
          ? _value.indexFirstSuggestionPost
          : indexFirstSuggestionPost // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostDto>,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as LikesDto?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialStateImplCopyWith<$Res>
    implements $SocialStateCopyWith<$Res> {
  factory _$$SocialStateImplCopyWith(
          _$SocialStateImpl value, $Res Function(_$SocialStateImpl) then) =
      __$$SocialStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool playing,
      int page,
      bool hasMore,
      bool isSuggestion,
      int indexFirstSuggestionPost,
      int index,
      List<PostDto> posts,
      LikesDto? likes});
}

/// @nodoc
class __$$SocialStateImplCopyWithImpl<$Res>
    extends _$SocialStateCopyWithImpl<$Res, _$SocialStateImpl>
    implements _$$SocialStateImplCopyWith<$Res> {
  __$$SocialStateImplCopyWithImpl(
      _$SocialStateImpl _value, $Res Function(_$SocialStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playing = null,
    Object? page = null,
    Object? hasMore = null,
    Object? isSuggestion = null,
    Object? indexFirstSuggestionPost = null,
    Object? index = null,
    Object? posts = null,
    Object? likes = freezed,
  }) {
    return _then(_$SocialStateImpl(
      playing: null == playing
          ? _value.playing
          : playing // ignore: cast_nullable_to_non_nullable
              as bool,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuggestion: null == isSuggestion
          ? _value.isSuggestion
          : isSuggestion // ignore: cast_nullable_to_non_nullable
              as bool,
      indexFirstSuggestionPost: null == indexFirstSuggestionPost
          ? _value.indexFirstSuggestionPost
          : indexFirstSuggestionPost // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostDto>,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as LikesDto?,
    ));
  }
}

/// @nodoc

class _$SocialStateImpl implements _SocialState {
  const _$SocialStateImpl(
      {this.playing = true,
      this.page = 1,
      this.hasMore = true,
      this.isSuggestion = false,
      this.indexFirstSuggestionPost = -1,
      this.index = -1,
      final List<PostDto> posts = const [],
      this.likes})
      : _posts = posts;

  @override
  @JsonKey()
  final bool playing;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final bool isSuggestion;
  @override
  @JsonKey()
  final int indexFirstSuggestionPost;
  @override
  @JsonKey()
  final int index;
  final List<PostDto> _posts;
  @override
  @JsonKey()
  List<PostDto> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final LikesDto? likes;

  @override
  String toString() {
    return 'SocialState(playing: $playing, page: $page, hasMore: $hasMore, isSuggestion: $isSuggestion, indexFirstSuggestionPost: $indexFirstSuggestionPost, index: $index, posts: $posts, likes: $likes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialStateImpl &&
            (identical(other.playing, playing) || other.playing == playing) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.isSuggestion, isSuggestion) ||
                other.isSuggestion == isSuggestion) &&
            (identical(
                    other.indexFirstSuggestionPost, indexFirstSuggestionPost) ||
                other.indexFirstSuggestionPost == indexFirstSuggestionPost) &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.likes, likes) || other.likes == likes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      playing,
      page,
      hasMore,
      isSuggestion,
      indexFirstSuggestionPost,
      index,
      const DeepCollectionEquality().hash(_posts),
      likes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialStateImplCopyWith<_$SocialStateImpl> get copyWith =>
      __$$SocialStateImplCopyWithImpl<_$SocialStateImpl>(this, _$identity);
}

abstract class _SocialState implements SocialState {
  const factory _SocialState(
      {final bool playing,
      final int page,
      final bool hasMore,
      final bool isSuggestion,
      final int indexFirstSuggestionPost,
      final int index,
      final List<PostDto> posts,
      final LikesDto? likes}) = _$SocialStateImpl;

  @override
  bool get playing;
  @override
  int get page;
  @override
  bool get hasMore;
  @override
  bool get isSuggestion;
  @override
  int get indexFirstSuggestionPost;
  @override
  int get index;
  @override
  List<PostDto> get posts;
  @override
  LikesDto? get likes;
  @override
  @JsonKey(ignore: true)
  _$$SocialStateImplCopyWith<_$SocialStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
