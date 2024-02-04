import 'package:muze/app/data/models/api_response.dart';

abstract class ProfilDomainRepository {
  Future<APIResponse> getArtist({required String token, required String artistId});
  Future<APIResponse> getAlbums({required String token, required String artistId, required String page});
  Future<APIResponse> followArtist({required String token, required String artistId});
  Future<APIResponse> getUserPosts({required String token, required String userId});
  Future<APIResponse> getUser({required String token, required String userId});
}
