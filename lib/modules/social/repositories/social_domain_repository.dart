import 'package:muze/app/data/models/api_response.dart';

abstract class SocialDomainRepository {
  Future<APIResponse> getPosts({required String token, required String page});
  Future<APIResponse> getSuggestionPosts({required String token, required String page});
  Future<APIResponse> likePost({required String token, required String postId, required bool liked});
  Future<APIResponse> getLikes({required String token, required String postId, required String page});
  Future<APIResponse> followUser({required String token, required String userId, required bool follow});
}
