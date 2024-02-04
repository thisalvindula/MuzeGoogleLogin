import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/modules/search/app/ui/utils/search_category_type.dart';

abstract class SearchDomainRepository {
  Future<APIResponse> getResult({required String token, required String search, required String page, required SearchCategoryType type});
}
