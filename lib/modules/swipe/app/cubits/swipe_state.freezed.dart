// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'swipe_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SwipeState {
  List<MusicDto> get musics => throw _privateConstructorUsedError;
  List<List<String>> get genres => throw _privateConstructorUsedError;
  List<String> get selectedGenres => throw _privateConstructorUsedError;
  List<PlaylistDto> get playlists => throw _privateConstructorUsedError;
  bool get havePlaylists => throw _privateConstructorUsedError;
  List<PlaylistDto> get selectedPlaylists => throw _privateConstructorUsedError;
  bool get playing => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SwipeStateCopyWith<SwipeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwipeStateCopyWith<$Res> {
  factory $SwipeStateCopyWith(
          SwipeState value, $Res Function(SwipeState) then) =
      _$SwipeStateCopyWithImpl<$Res, SwipeState>;
  @useResult
  $Res call(
      {List<MusicDto> musics,
      List<List<String>> genres,
      List<String> selectedGenres,
      List<PlaylistDto> playlists,
      bool havePlaylists,
      List<PlaylistDto> selectedPlaylists,
      bool playing,
      int index});
}

/// @nodoc
class _$SwipeStateCopyWithImpl<$Res, $Val extends SwipeState>
    implements $SwipeStateCopyWith<$Res> {
  _$SwipeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musics = null,
    Object? genres = null,
    Object? selectedGenres = null,
    Object? playlists = null,
    Object? havePlaylists = null,
    Object? selectedPlaylists = null,
    Object? playing = null,
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      musics: null == musics
          ? _value.musics
          : musics // ignore: cast_nullable_to_non_nullable
              as List<MusicDto>,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      selectedGenres: null == selectedGenres
          ? _value.selectedGenres
          : selectedGenres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      playlists: null == playlists
          ? _value.playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<PlaylistDto>,
      havePlaylists: null == havePlaylists
          ? _value.havePlaylists
          : havePlaylists // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPlaylists: null == selectedPlaylists
          ? _value.selectedPlaylists
          : selectedPlaylists // ignore: cast_nullable_to_non_nullable
              as List<PlaylistDto>,
      playing: null == playing
          ? _value.playing
          : playing // ignore: cast_nullable_to_non_nullable
              as bool,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SwipeStateImplCopyWith<$Res>
    implements $SwipeStateCopyWith<$Res> {
  factory _$$SwipeStateImplCopyWith(
          _$SwipeStateImpl value, $Res Function(_$SwipeStateImpl) then) =
      __$$SwipeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MusicDto> musics,
      List<List<String>> genres,
      List<String> selectedGenres,
      List<PlaylistDto> playlists,
      bool havePlaylists,
      List<PlaylistDto> selectedPlaylists,
      bool playing,
      int index});
}

/// @nodoc
class __$$SwipeStateImplCopyWithImpl<$Res>
    extends _$SwipeStateCopyWithImpl<$Res, _$SwipeStateImpl>
    implements _$$SwipeStateImplCopyWith<$Res> {
  __$$SwipeStateImplCopyWithImpl(
      _$SwipeStateImpl _value, $Res Function(_$SwipeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musics = null,
    Object? genres = null,
    Object? selectedGenres = null,
    Object? playlists = null,
    Object? havePlaylists = null,
    Object? selectedPlaylists = null,
    Object? playing = null,
    Object? index = null,
  }) {
    return _then(_$SwipeStateImpl(
      musics: null == musics
          ? _value._musics
          : musics // ignore: cast_nullable_to_non_nullable
              as List<MusicDto>,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      selectedGenres: null == selectedGenres
          ? _value._selectedGenres
          : selectedGenres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      playlists: null == playlists
          ? _value._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<PlaylistDto>,
      havePlaylists: null == havePlaylists
          ? _value.havePlaylists
          : havePlaylists // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPlaylists: null == selectedPlaylists
          ? _value._selectedPlaylists
          : selectedPlaylists // ignore: cast_nullable_to_non_nullable
              as List<PlaylistDto>,
      playing: null == playing
          ? _value.playing
          : playing // ignore: cast_nullable_to_non_nullable
              as bool,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SwipeStateImpl implements _SwipeState {
  const _$SwipeStateImpl(
      {final List<MusicDto> musics = const [],
      final List<List<String>> genres = const [],
      final List<String> selectedGenres = const [],
      final List<PlaylistDto> playlists = const [],
      this.havePlaylists = true,
      final List<PlaylistDto> selectedPlaylists = const [],
      this.playing = true,
      this.index = 0})
      : _musics = musics,
        _genres = genres,
        _selectedGenres = selectedGenres,
        _playlists = playlists,
        _selectedPlaylists = selectedPlaylists;

  final List<MusicDto> _musics;
  @override
  @JsonKey()
  List<MusicDto> get musics {
    if (_musics is EqualUnmodifiableListView) return _musics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_musics);
  }

  final List<List<String>> _genres;
  @override
  @JsonKey()
  List<List<String>> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  final List<String> _selectedGenres;
  @override
  @JsonKey()
  List<String> get selectedGenres {
    if (_selectedGenres is EqualUnmodifiableListView) return _selectedGenres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedGenres);
  }

  final List<PlaylistDto> _playlists;
  @override
  @JsonKey()
  List<PlaylistDto> get playlists {
    if (_playlists is EqualUnmodifiableListView) return _playlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlists);
  }

  @override
  @JsonKey()
  final bool havePlaylists;
  final List<PlaylistDto> _selectedPlaylists;
  @override
  @JsonKey()
  List<PlaylistDto> get selectedPlaylists {
    if (_selectedPlaylists is EqualUnmodifiableListView)
      return _selectedPlaylists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedPlaylists);
  }

  @override
  @JsonKey()
  final bool playing;
  @override
  @JsonKey()
  final int index;

  @override
  String toString() {
    return 'SwipeState(musics: $musics, genres: $genres, selectedGenres: $selectedGenres, playlists: $playlists, havePlaylists: $havePlaylists, selectedPlaylists: $selectedPlaylists, playing: $playing, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwipeStateImpl &&
            const DeepCollectionEquality().equals(other._musics, _musics) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality()
                .equals(other._selectedGenres, _selectedGenres) &&
            const DeepCollectionEquality()
                .equals(other._playlists, _playlists) &&
            (identical(other.havePlaylists, havePlaylists) ||
                other.havePlaylists == havePlaylists) &&
            const DeepCollectionEquality()
                .equals(other._selectedPlaylists, _selectedPlaylists) &&
            (identical(other.playing, playing) || other.playing == playing) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_musics),
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(_selectedGenres),
      const DeepCollectionEquality().hash(_playlists),
      havePlaylists,
      const DeepCollectionEquality().hash(_selectedPlaylists),
      playing,
      index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwipeStateImplCopyWith<_$SwipeStateImpl> get copyWith =>
      __$$SwipeStateImplCopyWithImpl<_$SwipeStateImpl>(this, _$identity);
}

abstract class _SwipeState implements SwipeState {
  const factory _SwipeState(
      {final List<MusicDto> musics,
      final List<List<String>> genres,
      final List<String> selectedGenres,
      final List<PlaylistDto> playlists,
      final bool havePlaylists,
      final List<PlaylistDto> selectedPlaylists,
      final bool playing,
      final int index}) = _$SwipeStateImpl;

  @override
  List<MusicDto> get musics;
  @override
  List<List<String>> get genres;
  @override
  List<String> get selectedGenres;
  @override
  List<PlaylistDto> get playlists;
  @override
  bool get havePlaylists;
  @override
  List<PlaylistDto> get selectedPlaylists;
  @override
  bool get playing;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$SwipeStateImplCopyWith<_$SwipeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
