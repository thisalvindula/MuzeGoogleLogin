import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default([]) List news,
  }) = _NewsState;
}
