import 'package:muze/app/data/models/api_response.dart';

abstract class ResetPasswordDomainRepository {
  Future<APIResponse> sendCodeEmail({required String email});
  Future<APIResponse> enterCode({required String code});
  Future<APIResponse> resetPassword({required String secretToken, required String password, required String passwordConfirm});
}
