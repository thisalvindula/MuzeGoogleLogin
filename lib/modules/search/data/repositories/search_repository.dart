import 'dart:convert';

import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/search/app/cubits/search_cubit.dart';
import 'package:muze/modules/search/app/ui/utils/search_category_type.dart';
import 'package:muze/modules/search/repositories/search_domain_repository.dart';
import 'package:muze/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class SearchRepository extends SearchDomainRepository {
  @override
  Future<APIResponse> getResult({required String token, required String search, required String page, required SearchCategoryType type}) async {
    APIResponse myResponse = APIResponse();

    final parameters = {
      "search": search,
      "page": page,
      "limit": "20",
    };

    String path = "";
    switch (type) {
      case SearchCategoryType.artist:
        path = Constants.artistsPath;
        break;
      case SearchCategoryType.user:
        path = Constants.usersPath;
        break;
      case SearchCategoryType.music:
        path = Constants.tracksPath;
        break;
    }

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      path,
      parameters,
    );

    final headers = {"Authorization": "Bearer $token"};

    await http.get(url, headers: headers).then((response) {
      if (type != locator<SearchCubit>().state.searchCategoryType) {
        myResponse.success = false;
        myResponse.data = {};
      } else {
        try {
          Map<String, dynamic> result = jsonDecode(response.body);
          myResponse = APIResponse.fromJson(result);
        } catch (e) {
          myResponse.success = false;
          myResponse.data = {};
        }
      }
    });
    return myResponse;
  }
}
