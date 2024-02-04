import 'package:muze/app/data/models/api_response.dart';

abstract class PreferencesDomainRepository {
  Future<APIResponse> getGenres({required String token, required String page, String? search});
  Future<APIResponse> getArtists({required String token, required String page, String? search});
  Future<APIResponse> editPreferences({required String token, required String preferenceName, required List<String> preferences});
  Future<APIResponse> me({required String token});
}
