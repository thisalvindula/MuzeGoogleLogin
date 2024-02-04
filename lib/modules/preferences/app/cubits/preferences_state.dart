import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences_state.freezed.dart';

@freezed
class PreferencesState with _$PreferencesState {
  const factory PreferencesState({
    @Default([]) List<List<String>> preferences,
    @Default([]) List<String> selectedPreferences,
    @Default("") String search,
    @Default(1) int page,
    @Default(true) bool hasMore,
  }) = _PreferencesState;
}
