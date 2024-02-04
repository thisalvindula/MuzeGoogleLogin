import 'package:flutter/material.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/reset_password/app/ui/widgets/reset_password_button.dart';

class RowButtonsPageView extends StatelessWidget {
  final Function() onTapFirstButton;
  final Function() onTapSecondButton;
  const RowButtonsPageView({super.key, required this.onTapFirstButton, required this.onTapSecondButton});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ResetPasswordButton(title: localizations.previous_text, type: ResetPasswordButtonType.grey, onTap: onTapFirstButton),
        SizedBox(
          width: MediaQuery.of(context).size.width / 20,
        ),
        ResetPasswordButton(title: localizations.next_text, type: ResetPasswordButtonType.purple, onTap: onTapSecondButton),
      ],
    );
  }
}
