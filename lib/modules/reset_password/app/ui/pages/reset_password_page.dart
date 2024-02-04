import 'package:flutter/material.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/reset_password/app/cubits/reset_password_cubit.dart';
import 'package:muze/modules/reset_password/app/ui/widgets/row_buttons_pageview.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/widgets/custom_snackbar.dart';
import 'package:muze/widgets/custom_text_field.dart';

class ResetPasswordPage extends StatefulWidget {
  final PageController controller;
  const ResetPasswordPage({super.key, required this.controller});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();
  String? passwordValidatorMessage;
  String? passwordConfirmValidatorMessage;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: AppSize.getHeight(context) / 5,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: passwordController,
                  title: localizations.new_password_text,
                  hintText: localizations.password_text,
                  validator: (value) {
                    final regExp = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
                    if (value == null || value.isEmpty) return localizations.empty_password_text;
                    if (!regExp.hasMatch(value)) return localizations.password_following_rules_text;
                    return passwordValidatorMessage;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                CustomTextField(
                  controller: passwordConfirmController,
                  title: localizations.confirm_password_text,
                  hintText: localizations.password_text,
                  validator: (value) {
                    if (value == null || value.isEmpty) return localizations.empty_password_text;
                    if (value != passwordController.text) return localizations.password_not_equal_text;
                    return passwordConfirmValidatorMessage;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: AppSize.getHeight(context) / 5,
        ),
        RowButtonsPageView(
          onTapFirstButton: () {
            widget.controller.previousPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
          },
          onTapSecondButton: () async {
            if (formKey.currentState!.validate()) {
              bool success = await locator<ResetPasswordCubit>().resetPassword(password: passwordController.text, passwordConfirm: passwordConfirmController.text);
              if (!success) {
                passwordValidatorMessage = localizations.reset_password_expired;
                passwordConfirmValidatorMessage = localizations.reset_password_expired;
                formKey.currentState!.validate();
                passwordValidatorMessage = null;
                passwordConfirmValidatorMessage = null;
              } else {
                if (context.mounted) {
                  CustomSnackBar(context, text: localizations.reset_password_success);
                  context.navigator.pop();
                }
              }
            }
          },
        ),
      ],
    );
  }
}
