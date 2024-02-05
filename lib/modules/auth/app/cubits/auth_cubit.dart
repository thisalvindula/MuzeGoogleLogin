import 'dart:developer';

import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/modules/auth/app/cubits/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muze/modules/auth/app/ui/utils/auth_select_type.dart';
import 'package:muze/modules/auth/data/dtos/user_dto.dart';
import 'package:muze/modules/auth/repositories/auth_domain_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthDomainRepository authDomainRepository;
  AuthCubit({required this.authDomainRepository}) : super(const AuthState());

  // LOGIN
  Future<void> login(
      {required String username, required String password}) async {
    final APIResponse myResponse = await authDomainRepository.login(
        username: username, password: password);

    if (myResponse.message == null) throw "Null";
    if (myResponse.message == "Invalid Credential.") throw "Invalid Credential";

    String token = myResponse.data!["content"]["token"];

    log(token);

    saveToken(token: token);
    emit(state.copyWith(token: token));
  }

  // REGISTER
  Future<void> register(
      {required String username,
      required String email,
      required String password,
      required String passwordConfirmation}) async {
    final APIResponse myResponse = await authDomainRepository.register(
        username: username,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation);

    if (myResponse.data == null) throw "";
    print(myResponse);

    String token = myResponse.data!["content"]["token"];
    saveToken(token: token);
    emit(state.copyWith(token: token));
  }

  // TOKEN
  void saveToken({required String token}) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString("userToken", token);
  }

  void clearToken() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString("userToken", "");
    emit(state.copyWith(token: ""));
  }

  Future<void> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("userToken") ?? "";
    log("token from sharedPreferences : $token");
    emit(state.copyWith(token: token));
  }

  // LOADING
  void changeLoading(bool value) {
    emit(state.copyWith(loading: value));
  }

  // AUTHTYPE
  void changeAuthSelectedType(AuthType type) {
    emit(state.copyWith(authType: type));
  }

  // STATUS
  Future<StartAppStatus> getStatus() async {
    await getToken();
    log("status using this token : ${state.token}");

    if (state.token.isEmpty) {
      setStatus(StartAppStatus.auth);
      return StartAppStatus.auth;
    }

    APIResponse response = await userInfo();

    if (response.success == null || !response.success!) {
      setStatus(StartAppStatus.auth);
      return StartAppStatus.auth;
    }
/*
    bool spotifyConnected = false;

    String token = await SpotifyUtils.getRefreshToken();

    spotifyConnected = token.isNotEmpty;

    if (spotifyConnected) {
      setStatus(StartAppStatus.home);
      return StartAppStatus.home;
    }
*/
    if (state.user!.preferences is List<dynamic>) {
      setStatus(StartAppStatus.genres);
      return StartAppStatus.genres;
    }

    if (state.user!.preferences["artists"] == null) {
      setStatus(StartAppStatus.artists);
      return StartAppStatus.artists;
    }
    setStatus(StartAppStatus.home);
    return StartAppStatus.home;
  }

  void setStatus(StartAppStatus status) {
    emit(state.copyWith(status: status));
  }

  // USER INFO
  Future<APIResponse> userInfo() async {
    APIResponse response = await authDomainRepository.me(token: state.token);

    if (response.message == "Need to be connected") {
      return APIResponse(success: false);
    }

    UserDto userDto = UserDto.fromJson(response.data!["content"]);

    emit(state.copyWith(user: userDto));
    return response;
  }
}
