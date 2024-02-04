import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:muze/modules/search/app/ui/utils/search_category_type.dart';
import 'package:muze/modules/search/data/dtos/search_dto.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(true) bool hasMore,
    @Default("") String search,
    @Default(1) int page,
    @Default(SearchCategoryType.artist) SearchCategoryType searchCategoryType,
    DataSearchDto? searchDto,
  }) = _SearchState;
}
