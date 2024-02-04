import 'package:flutter/material.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/reset_password/app/cubits/reset_password_cubit.dart';
import 'package:muze/modules/reset_password/app/ui/widgets/row_buttons_pageview.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:pinput/pinput.dart';

class EnterCodePage extends StatefulWidget {
  final PageController controller;
  const EnterCodePage({super.key, required this.controller});

  @override
  State<EnterCodePage> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
  final TextEditingController pinputController = TextEditingController();
  String? pinputValidatorMessage;
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
                      Pinput(
                        validator: (value) {
                          if (value!.length < 6) {
                            return localizations.invalid_code_text;
                          }
                          return pinputValidatorMessage;
                        },
                        controller: pinputController,
                        length: 6,
                        defaultPinTheme: PinTheme(
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.height / 12,
                          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
                          decoration: BoxDecoration(color: AppColors.lightGrey, borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                      Text(
                        localizations.enter_code_description_text,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.greyText, fontSize: 12),
                        textAlign: TextAlign.center,
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
                    try {
                      await locator<ResetPasswordCubit>().enterCode(context, code: pinputController.text);
                      widget.controller.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                    } catch (e) {
                      pinputValidatorMessage = e.toString();
                      formKey.currentState!.validate();
                      pinputValidatorMessage = null;
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
