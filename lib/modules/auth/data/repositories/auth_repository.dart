import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/modules/auth/repositories/auth_domain_repository.dart';
import 'package:muze/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class AuthRepository extends AuthDomainRepository {
  @override
  Future<APIResponse> login({required String username, required String password, bool? remember}) async {
    APIResponse myResponse = APIResponse();

    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    String clientName = "";

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      clientName = androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      clientName = iosInfo.name;
    }

    final parameters = {"username": username, "password": password, "client_name": clientName};

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      Constants.loginPath,
      parameters,
    );

    await http.post(url).then((response) {
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });
    return myResponse;
  }

  @override
  Future<APIResponse> register({required String username, required String password, required String passwordConfirmation, required String email}) async {
    APIResponse myResponse = APIResponse();

    final parameters = <String, dynamic>{
      "username": username,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
    };

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      Constants.registerPath,
      parameters,
    );

    await http.post(url).then((response) {
      log(response.body);
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
