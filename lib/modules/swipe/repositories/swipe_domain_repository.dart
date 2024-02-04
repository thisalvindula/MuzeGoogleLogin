import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/modules/swipe/data/repositories/swipe_repository.dart';

abstract class SwipeDomainRepository {
  Future<APIResponse> getMusic({required String token, String? artistId, String? trackID, List<String>? genres});
  Future<APIResponse> likeMusic({required String token, required String musicId, required LikeType type, String? spotifyToken});
  Future<APIResponse> shareMusic({required String token, required String musicId, required String comment});
  Future<APIResponse> getGenres({required String token});
  Future<APIResponse> getPlaylists({required String token, required String spotifyToken});
  Future<APIResponse> addTrackToPlaylist({required String token, required String spotifyToken, required String trackId, required String playlistId});
}
