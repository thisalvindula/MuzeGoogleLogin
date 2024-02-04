import 'package:muze/app/data/models/api_response.dart';

abstract class AuthDomainRepository {
  Future<APIResponse> login({required String username, required String password, bool? remember});
  Future<APIResponse> register({required String username, required String password, required String passwordConfirmation, required String email});
  Future<APIResponse> me({required String token});
}
