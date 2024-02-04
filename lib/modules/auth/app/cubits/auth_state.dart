import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:muze/modules/auth/app/ui/utils/auth_select_type.dart';
import 'package:muze/modules/auth/data/dtos/user_dto.dart';

part 'auth_state.freezed.dart';

enum StartAppStatus {
  auth,
  genres,
  artists,
  home,
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default("") String token,
    @Default(false) bool loading,
    @Default(AuthType.signin) AuthType authType,
    @Default(StartAppStatus.auth) StartAppStatus status,
    UserDto? user,
  }) = _AuthState;
}
