import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/auth/app/cubits/auth_state.dart';
import 'package:muze/modules/auth/app/ui/utils/auth_select_type.dart';
import 'package:muze/modules/auth/app/ui/widgets/auth_button.dart';
import 'package:muze/widgets/custom_snackbar.dart';
import 'package:muze/widgets/custom_text_field.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/widgets/third_plateform_connect.dart';

class SigninBody extends StatefulWidget {
  const SigninBody({super.key});

  @override
  State<SigninBody> createState() => _SigninBodyState();
}

class _SigninBodyState extends State<SigninBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? emailValidatorMessage;
  String? passwordValidatorMessage;

  void onForgotPassword(BuildContext context) {
    context.navigator.pushResetPasswordPage();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 10),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: emailController,
              title: localizations.email_username_text,
              hintText: "texte@mail.com / nom.exemple",
              validator: (value) {
                if (value == null || value.isEmpty)
                  return localizations.empty_email_username_text;
                return emailValidatorMessage;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            CustomTextField(
              customTextFieldType: CustomTextFieldType.password,
              controller: passwordController,
              title: localizations.password_text,
              hintText: localizations.password_text,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return localizations.empty_password_text;
                return passwordValidatorMessage;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            BlocBuilder<AuthCubit, AuthState>(
              bloc: locator<AuthCubit>(),
              builder: (context, state) {
                return AuthButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      locator<AuthCubit>().changeLoading(true);

                      try {
                        await locator<AuthCubit>().login(
                            username: emailController.text,
                            password: passwordController.text);
                        emailValidatorMessage = null;
                        passwordValidatorMessage = null;
                        formKey.currentState!.validate();
                        log("token : ${state.token}");
                        log("token : ${locator<AuthCubit>().state.token}");
                        if (context.mounted &&
                            locator<AuthCubit>().state.token.isNotEmpty) {
                          CustomSnackBar(context,
                              text: localizations.successfull_login);
                          StartAppStatus status =
                              await locator<AuthCubit>().getStatus();
                          log("$status");
                          if (context.mounted) {
                            switch (status) {
                              case StartAppStatus.auth:
                                break;
                              case StartAppStatus.genres:
                                context.navigator.pushPreferences();
                                break;
                              case StartAppStatus.artists:
                                context.navigator.pushPreferences();
                                break;
                              case StartAppStatus.home:
                                context.navigator.pushHome();
                                break;
                            }
                          }
                          // context.navigator.pushPreferences();
                        }
                        locator<AuthCubit>().changeLoading(false);
                      } catch (e) {
                        emailValidatorMessage =
                            localizations.not_correct_email_username_text;
                        passwordValidatorMessage =
                            localizations.not_correct_password_text;

                        formKey.currentState!.validate();

                        emailValidatorMessage = null;
                        passwordValidatorMessage = null;

                        CustomSnackBar(context,
                            text: localizations.error_try_again_later);
                        locator<AuthCubit>().changeLoading(false);
                        return;
                      }
                    }
                  },
                  loading: state.loading,
                  type: AuthType.signin,
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            GestureDetector(
              onTap: () => onForgotPassword(context),
              child: Text(
                localizations.forgot_password_text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 26 / 16,
                    color: AppColors.primary[800]),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            const ThirdPlateformConnect(
              type: ThirdPlateformConnectType.signin,
            ),
          ],
        ),
      ),
    );
  }
}
