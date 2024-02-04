import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/search/app/cubits/search_state.dart';
import 'package:muze/modules/search/app/ui/utils/search_category_type.dart';
import 'package:muze/modules/search/data/dtos/search_dto.dart';
import 'package:muze/modules/search/repositories/search_domain_repository.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchDomainRepository searchDomainRepository;
  SearchCubit({required this.searchDomainRepository}) : super(const SearchState());

  Future<void> getResult({String? search, required String page}) async {
    APIResponse myResponse = await searchDomainRepository.getResult(token: locator<AuthCubit>().state.token, page: page, search: search ?? "", type: state.searchCategoryType);

    if (!myResponse.success!) return;

    DataSearchDto searchDto = DataSearchDto.fromJson(myResponse.data!);

    if (searchDto.pagination!.to == searchDto.pagination!.total) {
      changeHasMore(false);
    } else {
      changeHasMore(true);
    }

    addResult(searchDto);
  }

  void addResult(DataSearchDto newSearch) {
    DataSearchDto search = DataSearchDto(content: []);
    state.searchDto != null ? search.content?.addAll(state.searchDto!.content!) : null;
    search.content?.addAll(newSearch.content!);
    emit(state.copyWith(searchDto: search));
  }

  void clearResult() {
    emit(state.copyWith(searchDto: null));
  }

  void setSearch(String search) {
    emit(state.copyWith(search: search));
  }

  void clearSearch() {
    emit(state.copyWith(search: ""));
  }

  void increasePage() {
    emit(state.copyWith(page: state.page + 1));
  }

  void clearPage() {
    emit(state.copyWith(page: 1));
  }

  void changeHasMore(bool hasMore) {
    emit(state.copyWith(hasMore: hasMore));
  }

  void changeSearchCategoryType(SearchCategoryType searchCategoryType) {
    emit(state.copyWith(searchCategoryType: searchCategoryType));
  }
}
