import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/reset_password/app/cubits/reset_password_state.dart';
import 'package:muze/modules/reset_password/repositories/reset_password_domain_repository.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordDomainRepository resetPasswordDomainRepository;
  ResetPasswordCubit({required this.resetPasswordDomainRepository}) : super(const ResetPasswordState());

  Future<String?> sendCodeEmail(BuildContext context, {required String email}) async {
    final APIResponse myResponse = await resetPasswordDomainRepository.sendCodeEmail(email: email);
    if (!myResponse.success!) if (myResponse.data![0] == "The selected email is invalid." && context.mounted) return AppLocalizations.of(context)!.email_not_exist_text;
    return null;
  }

  Future<void> enterCode(BuildContext context, {required String code}) async {
    final APIResponse myResponse = await resetPasswordDomainRepository.enterCode(code: code);
    if (!myResponse.success!) {
      if (myResponse.message == "Code invalide" && context.mounted) throw AppLocalizations.of(context)!.invalid_code_text;
      if (myResponse.message == "Code expiré" && context.mounted) throw AppLocalizations.of(context)!.expired_code_text;
    }
    emit(state.copyWith(secretToken: myResponse.data!["content"]["token"].toString()));
  }

  Future<bool> resetPassword({required String password, required String passwordConfirm}) async {
    final APIResponse myResponse = await resetPasswordDomainRepository.resetPassword(secretToken: state.secretToken, password: password, passwordConfirm: passwordConfirm);

    return myResponse.success!;
  }

  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }
}
