import 'dart:convert';
import 'dart:developer';

import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/modules/social/repositories/social_domain_repository.dart';
import 'package:http/http.dart' as http;
import 'package:muze/utils/constants/constants.dart';

class SocialRepository extends SocialDomainRepository {
  @override
  Future<APIResponse> getPosts({required String token, required String page}) async {
    APIResponse myResponse = APIResponse();

    Map<String, dynamic>? parameters = {};

    parameters["page"] = page;

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      Constants.postPath,
      parameters,
    );

    final headers = {"Authorization": "Bearer $token"};

    await http.get(url, headers: headers).then((response) {
      log(response.body);
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });

    return myResponse;
  }

  @override
  Future<APIResponse> likePost({required String token, required String postId, required bool liked}) async {
    APIResponse myResponse = APIResponse();

    Map<String, dynamic>? parameters = {};

    parameters["is_liked"] = liked ? "1" : "0";

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      "${Constants.musicPath}/$postId",
      parameters,
    );

    log("$url");

    final headers = {"Authorization": "Bearer $token"};

    await http.post(url, headers: headers).then((response) {
      log(response.body);
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });

    return myResponse;
  }

  @override
  Future<APIResponse> getLikes({required String token, required String postId, required String page}) async {
    APIResponse myResponse = APIResponse();

    Map<String, dynamic>? parameters = {};

    parameters["page"] = page;

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      "${Constants.musicPath}/$postId/likes",
      parameters,
    );

    final headers = {"Authorization": "Bearer $token"};

    await http.get(url, headers: headers).then((response) {
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });

    return myResponse;
  }

  @override
  Future<APIResponse> followUser({required String token, required String userId, required bool follow}) async {
    APIResponse myResponse = APIResponse();

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      "${Constants.userPath}/$userId/${follow ? "follow" : "unfollow"}",
    );

    final headers = {"Authorization": "Bearer $token"};

    await http.post(url, headers: headers).then((response) {
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });

    return myResponse;
  }

  @override
  Future<APIResponse> getSuggestionPosts({required String token, required String page}) {
    // TODO: implement getSuggestionPosts
    throw UnimplementedError();
  }
}
