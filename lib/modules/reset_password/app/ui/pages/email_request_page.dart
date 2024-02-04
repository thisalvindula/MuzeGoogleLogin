import 'package:flutter/material.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/reset_password/app/cubits/reset_password_cubit.dart';
import 'package:muze/modules/reset_password/app/ui/widgets/row_buttons_pageview.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/widgets/custom_text_field.dart';

class EmailRequestPage extends StatefulWidget {
  final PageController controller;
  const EmailRequestPage({super.key, required this.controller});

  @override
  State<EmailRequestPage> createState() => _EmailRequestPageState();
}

class _EmailRequestPageState extends State<EmailRequestPage> {
  final TextEditingController emailController = TextEditingController();
  String? emailValidatorMessage;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        Expanded(
          child: Column(
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
                    children: [
                      CustomTextField(
                        customTextFieldType: CustomTextFieldType.email,
                        controller: emailController,
                        title: localizations.email_text,
                        hintText: "text@mail.com",
                        validator: (value) {
                          final regExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                          if (value == null || value.isEmpty) return localizations.empty_email_text;
                          if (!regExp.hasMatch(value)) return localizations.email_following_rules_text;
                          return emailValidatorMessage;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                      Text(
                        localizations.enter_email_description_text,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.greyText, fontSize: 12),
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
                  context.navigator.pop();
                },
                onTapSecondButton: () async {
                  if (formKey.currentState!.validate()) {
                    String? response = await locator<ResetPasswordCubit>().sendCodeEmail(context, email: emailController.text);
                    emailValidatorMessage = response;
                    formKey.currentState!.validate();
                    emailValidatorMessage = null;
                    if (response == null) {
                      widget.controller.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
