import 'dart:convert';
import 'dart:developer';

import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/modules/reset_password/repositories/reset_password_domain_repository.dart';
import 'package:muze/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class ResetPasswordRepository extends ResetPasswordDomainRepository {
  @override
  Future<APIResponse> sendCodeEmail({required String email}) async {
    APIResponse myResponse = APIResponse();

    final parameters = {
      "email": email,
    };

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      Constants.forgotPasswordPath,
      parameters,
    );

    await http.post(url).then((response) {
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });
    return myResponse;
  }

  @override
  Future<APIResponse> enterCode({required String code}) async {
    APIResponse myResponse = APIResponse();

    final parameters = {
      "password_reset_code": code,
    };

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      Constants.resetPasswordTokenPath,
      parameters,
    );

    await http.post(url).then((response) {
      Map<String, dynamic> result = jsonDecode(response.body);
      myResponse = APIResponse.fromJson(result);
    });
    return myResponse;
  }

  @override
  Future<APIResponse> resetPassword({required String secretToken, required String password, required String passwordConfirm}) async {
    APIResponse myResponse = APIResponse();

    final parameters = {
      "password_reset_token": secretToken,
      "password": password,
      "password_confirmation": passwordConfirm,
    };

    final Uri url = Uri.https(
      Constants.apiBaseUrl,
      Constants.newPasswordPath,
      parameters,
    );

    await http.post(url).then((response) {
      Map<String, dynamic> result = jsonDecode(response.body);
      log(response.body);
      myResponse = APIResponse.fromJson(result);
    });
    return myResponse;
  }
}
