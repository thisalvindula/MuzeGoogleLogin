import 'dart:convert';
import 'dart:developer';

import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/modules/profil/repositories/profil_domain_repository.dart';
import 'package:muze/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class ProfilRepository extends ProfilDomainRepository {
  @override
  Future<APIResponse> getArtist({required String token, required String artistId}) async {
    APIResponse myResponse = APIResponse();

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      "${Constants.artistsPath}/$artistId",
    );

    final headers = {"Authorization": "Bearer $token"};

    await http.get(url, headers: headers).then((response) {
      try {
        log(response.body);
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
  Future<APIResponse> followArtist({required String token, required String artistId}) async {
    APIResponse myResponse = APIResponse();

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      "${Constants.artistsPath}/$artistId/follow",
    );

    final headers = {"Authorization": "Bearer $token"};

    await http.post(url, headers: headers).then((response) {
      try {
        log(response.body);
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
  Future<APIResponse> getAlbums({required String token, required String artistId, required String page}) async {
    APIResponse myResponse = APIResponse();

    final parameters = {
      "page": page,
      "limit": "50",
    };

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      "${Constants.artistsPath}/$artistId/albums",
      parameters,
    );

    final headers = {"Authorization": "Bearer $token"};

    await http.get(url, headers: headers).then((response) {
      try {
        log(response.body);
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
  Future<APIResponse> getUserPosts({required String token, required String userId}) async {
    APIResponse myResponse = APIResponse();

    final parameters = {
      "page": "1",
      "limit": "50",
    };

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      "${Constants.usersPath}/$userId/posts",
      parameters,
    );

    final headers = {"Authorization": "Bearer $token"};

    await http.get(url, headers: headers).then((response) {
      try {
        log(response.body);
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
  Future<APIResponse> getUser({required String token, required String userId}) async {
    APIResponse myResponse = APIResponse();

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      "${Constants.userPath}/$userId/info",
    );

    final headers = {"Authorization": "Bearer $token"};

    await http.get(url, headers: headers).then((response) {
      try {
        log(response.body);
        Map<String, dynamic> result = jsonDecode(response.body);
        myResponse = APIResponse.fromJson(result);
      } catch (e) {
        myResponse.success = false;
        myResponse.data = {};
      }
    });
    return myResponse;
  }
}
