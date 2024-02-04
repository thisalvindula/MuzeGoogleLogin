import 'dart:convert';
import 'dart:developer';

import 'package:muze/app/data/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:muze/modules/preferences/repositories/preferences_domain_repository.dart';
import 'package:muze/utils/constants/constants.dart';

class PreferencesRepository implements PreferencesDomainRepository {
  @override
  Future<APIResponse> getGenres({required String token, required String page, String? search}) async {
    APIResponse myResponse = APIResponse();

    final parameters = {
      "search": search ?? "",
      "page": page,
      "limit": "20",
    };

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      Constants.genresPath,
      parameters,
    );

    log("$url");

    final headers = {"Authorization": "Bearer $token"};

    await http.get(url, headers: headers).then((response) {
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });
    return myResponse;
  }

  @override
  Future<APIResponse> getArtists({required String token, required String page, String? search}) async {
    APIResponse myResponse = APIResponse();

    final parameters = {
      "search": search,
      "page": page,
      "limit": "20",
    };

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      Constants.artistsPath,
      parameters,
    );

    log("$url");

    final headers = {"Authorization": "Bearer $token"};

    await http.get(url, headers: headers).then((response) {
      try {
        Map<String, dynamic> result = jsonDecode(response.body);
        myResponse = APIResponse.fromJson(result);
      } catch (e) {
        myResponse.success = false;
        myResponse.data = {};
      }
    });
    return myResponse;
  }

  @override
  Future<APIResponse> editPreferences({required String token, required String preferenceName, required List<String> preferences}) async {
    APIResponse myResponse = APIResponse();

    final parameters = {
      "preference_name": preferenceName,
    };

    for (int i = 0; i < preferences.length; i++) {
      parameters["preference_value[$i]"] = preferences[i].replaceAll(" ", "_");
    }

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      Constants.editPreferencesPath,
      parameters,
    );

    final headers = {"Authorization": "Bearer $token"};

    await http.post(url, headers: headers).then((response) {
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });
    return myResponse;
  }

  @override
  Future<APIResponse> me({required String token}) async {
    APIResponse myResponse = APIResponse();

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      Constants.mePath,
    );

    final headers = {"Authorization": "Bearer $token"};

    await http.get(url, headers: headers).then((response) {
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });

    return myResponse;
  }
}
