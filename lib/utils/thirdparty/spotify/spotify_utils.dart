import 'dart:convert';
import 'dart:developer';

import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/utils/constants/constants.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/authorization_response.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SpotifyUtils {
  // CONNECT SPOTIFY
  static Future<bool> connectToSpotify() async {
    try {
      AccessTokenResponse? accessTokenResponse;

      var client = SpotifyOAuth2Client(
        redirectUri: "muze.app://callback",
        customUriScheme: "muze.app",
      );

      AuthorizationResponse response = await client.requestAuthorization(
        clientId: Constants.clientId,
        customParams: {'show_dialog': 'true'},
        scopes: [
          'user-read-private',
          'playlist-read-private',
          'playlist-modify-public',
          'ugc-image-upload',
          'playlist-modify-private',
          'user-library-read',
          'user-library-modify',
          'user-follow-read',
          'user-follow-modify',
          'user-top-read'
        ],
      );

      accessTokenResponse = await client.requestAccessToken(code: response.code.toString(), clientId: Constants.clientId, clientSecret: Constants.clientSecret);

      storeRefreshToken(accessTokenResponse.refreshToken ?? "");
      storeAccessToken(accessTokenResponse.accessToken ?? "");
      return true;
    } catch (e) {
      return false;
    }
  }

  static void disconnectSpotify() {
    storeRefreshToken("");
    storeAccessToken("");
  }

  static Future<bool> getUserPreferencesFromSpotify() async {
    String accessToken = await getAccessToken();
    if (!await verifyAccessToken(accessToken)) {
      accessToken = await getNewAccessToken();
    }

    APIResponse myResponse = APIResponse(success: false);

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      Constants.spotifyTop,
    );

    final headers = {"Authorization": "Bearer ${locator<AuthCubit>().state.token}", "spotify-auth": accessToken};

    await http.get(url, headers: headers).then((response) {
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });

    return myResponse.success!;
  }

  // REFRESH TOKEN
  static void storeRefreshToken(String refreshToken) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("refreshToken", refreshToken);
  }

  static Future<String> getRefreshToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("refreshToken") ?? "";
  }

  // ACCESS TOKEN
  static void storeAccessToken(String accessToken) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("accessToken", accessToken);
  }

  static Future<String> getAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("accessToken") ?? "";
  }

  static Future<bool> verifyAccessToken(String accessToken) async {
    APIResponse myResponse = APIResponse();

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      Constants.spotifyMe,
    );

    final headers = {"Authorization": "Bearer ${locator<AuthCubit>().state.token}", "spotify-auth": accessToken};

    await http.get(url, headers: headers).then((response) {
      log(response.body);
      try {
        Map<String, dynamic> result = jsonDecode(response.body);
        myResponse = APIResponse.fromJson(result);
      } catch (e) {
        myResponse = APIResponse(success: false);
      }
    });

    log("access token is good : ${myResponse.success}");

    return myResponse.success ?? false;
  }

  static Future<String> getNewAccessToken() async {
    APIResponse myResponse = APIResponse();

    String refreshToken = await getRefreshToken();

    final parameters = {"refresh_token": refreshToken};

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      Constants.spotifyRefreshTokenPath,
      parameters,
    );

    log("$url");

    final headers = {"Authorization": "Bearer ${locator<AuthCubit>().state.token}"};

    log("getting new access token with this refresh token : $refreshToken");

    await http.get(url, headers: headers).then((response) {
      log(response.body);
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });

    if (myResponse.success ?? false) {
      log("storing access token");
      String accessToken = myResponse.data!["content"]["token"];
      storeAccessToken(accessToken);
      return accessToken;
    }
    return "";
  }
}
