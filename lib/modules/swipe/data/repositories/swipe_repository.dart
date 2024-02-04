import 'dart:convert';
import 'dart:developer';

import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/modules/swipe/repositories/swipe_domain_repository.dart';
import 'package:muze/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:muze/utils/thirdparty/spotify/spotify_utils.dart';

enum LikeType {
  like,
  dislike,
}

class SwipeRepository extends SwipeDomainRepository {
  @override
  Future<APIResponse> getMusic({required String token, String? artistId, String? trackID, List<String>? genres}) async {
    APIResponse myResponse = APIResponse();

    Map<String, dynamic>? parameters = {};

    if (genres != null) {
      for (int i = 0; i < genres.length; i++) {
        parameters["genres[$i]"] = genres[i];
      }
    }

    trackID != null ? parameters["track_id"] = trackID : null;
    artistId != null ? parameters["artist_id"] = artistId : null;

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      Constants.musicPath,
      parameters,
    );

    log("$url");

    final headers = {"Authorization": "Bearer $token"};

    await http.get(url, headers: headers).then((response) {
      log(response.body);
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });

    return myResponse;
  }

  @override
  Future<APIResponse> likeMusic({required String token, required String musicId, required LikeType type, String? spotifyToken}) async {
    APIResponse myResponse = APIResponse();

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      "${Constants.tracksPath}/$musicId/${type.name}",
    );

    log("$url");

    final headers = {"Authorization": "Bearer $token"};
    if (spotifyToken != "") {
      bool response = await SpotifyUtils.verifyAccessToken(spotifyToken!);
      if (!response) {
        spotifyToken = await SpotifyUtils.getNewAccessToken();
      }
      headers.addAll({"spotify-auth": spotifyToken});
    }

    await http.get(url, headers: headers).then((response) {
      log(response.body);
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });

    return myResponse;
  }

  @override
  Future<APIResponse> shareMusic({required String token, required String musicId, required String comment}) async {
    APIResponse myResponse = APIResponse();

    Map<String, dynamic>? parameters = {};

    comment.isNotEmpty ? parameters["comment"] = comment : null;

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      "${Constants.musicPath}/$musicId/share",
      parameters,
    );

    log("$url");

    final headers = {"Authorization": "Bearer $token"};

    await http.post(url, headers: headers).then((response) {
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });

    return myResponse;
  }

  @override
  Future<APIResponse> getGenres({required String token}) async {
    APIResponse myResponse = APIResponse();

    final parameters = {
      "page": "1",
      "limit": "10",
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
  Future<APIResponse> getPlaylists({required String token, required String spotifyToken}) async {
    APIResponse myResponse = APIResponse();

    final parameters = {"limit": "50"};

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      Constants.spotifyPlaylists,
      parameters,
    );

    bool response = await SpotifyUtils.verifyAccessToken(spotifyToken);
    if (!response) {
      try {
        spotifyToken = await SpotifyUtils.getNewAccessToken();
      } catch (e) {
        return APIResponse(success: false);
      }
    }

    log("getting playlist with this token : $spotifyToken");

    final headers = {"Authorization": "Bearer $token", "spotify-auth": spotifyToken};

    await http.get(url, headers: headers).then((response) {
      log(response.body);
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });

    return myResponse;
  }

  @override
  Future<APIResponse> addTrackToPlaylist({required String token, required String spotifyToken, required String trackId, required String playlistId}) async {
    APIResponse myResponse = APIResponse();

    final parameters = {"track_id": trackId};

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      "${Constants.spotifyPlaylists}/$playlistId/add",
      parameters,
    );

    bool response = await SpotifyUtils.verifyAccessToken(spotifyToken);
    if (!response) {
      spotifyToken = await SpotifyUtils.getNewAccessToken();
    }

    log("add track : $trackId to playlist : $playlistId with token : $spotifyToken");

    final headers = {"Authorization": "Bearer $token", "spotify-auth": spotifyToken};

    await http.post(url, headers: headers).then((response) {
      try {
        Map<String, dynamic> result = jsonDecode(response.body);
        myResponse = APIResponse.fromJson(result);
      } catch (e) {
        myResponse = APIResponse(success: false);
      }
    });

    return myResponse;
  }
}
