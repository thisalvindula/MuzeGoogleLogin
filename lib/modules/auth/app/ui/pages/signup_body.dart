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

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 10),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: usernameController,
              title: localizations.username_text,
              hintText: "nom.exemple",
              validator: (value) {
                if (value == null || value.isEmpty) return localizations.empty_username_text;
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            CustomTextField(
              controller: emailController,
              title: localizations.email_text,
              hintText: "texte@mail.com",
              validator: (value) {
                final regExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                if (value == null || value.isEmpty) return localizations.empty_email_text;
                if (!regExp.hasMatch(value)) return localizations.email_following_rules_text;
                return null;
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
                final regExp = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
                if (value == null || value.isEmpty) return localizations.empty_password_text;
                if (!regExp.hasMatch(value)) return localizations.password_following_rules_text;
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            CustomTextField(
              customTextFieldType: CustomTextFieldType.password,
              controller: passwordConfirmController,
              title: localizations.confirm_password_text,
              hintText: localizations.password_text,
              validator: (value) {
                if (value == null || value.isEmpty) return localizations.empty_password_text;
                if (value != passwordController.text) return localizations.password_not_equal_text;
                return null;
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
                      try {
                        await locator<AuthCubit>().register(
                          username: usernameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          passwordConfirmation: passwordConfirmController.text,
                        );
                        if (context.mounted) {
                          CustomSnackBar(context, text: localizations.successfull_register);
                          context.navigator.pushPreferences();
                        }
                      } catch (e) {
                        CustomSnackBar(context, text: localizations.error_try_again_later);
                      }
                    }
                  },
                  loading: state.loading,
                  type: AuthType.signup,
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 80,
            ),
            Opacity(
              opacity: 0.4,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: localizations.cgu_first_part_text,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 8, fontWeight: FontWeight.w100),
                    ),
                    TextSpan(
                      text: " ",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 8, fontWeight: FontWeight.w100),
                    ),
                    TextSpan(
                      text: localizations.cgu_second_part_text,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 8, fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
