import 'package:flutter/material.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/auth/app/ui/utils/auth_select_type.dart';
import 'package:muze/utils/constants/colors.dart';

class AuthSelectWidget extends StatefulWidget {
  final Function(AuthType) onChange;
  const AuthSelectWidget({super.key, required this.onChange});

  @override
  State<AuthSelectWidget> createState() => _AuthSelectWidgetState();
}

class _AuthSelectWidgetState extends State<AuthSelectWidget> {
  change(AuthType type) {
    if (locator<AuthCubit>().state.authType != type) {
      widget.onChange(type);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return ClipPath(
      clipper: ShapeBorderClipper(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.45,
        height: MediaQuery.of(context).size.height / 17,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: AppColors.grey,
        ),
        child: Row(
          children: [
            AuthSelectWidgetButton(
              text: localizations.login_text,
              selected: locator<AuthCubit>().state.authType == AuthType.signin,
              onTap: () {
                change(AuthType.signin);
              },
            ),
            AuthSelectWidgetButton(
              text: localizations.register_text,
              selected: locator<AuthCubit>().state.authType == AuthType.signup,
              onTap: () {
                change(AuthType.signup);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AuthSelectWidgetButton extends StatelessWidget {
  final String text;
  final bool selected;
  final Function() onTap;
  const AuthSelectWidgetButton({super.key, required this.text, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 11,
          decoration: selected
              ? BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: const [
                  BoxShadow(
                    color: AppColors.blackShadow,
                    offset: Offset(0, 3),
                    blurRadius: 1,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: AppColors.lightGreyShadow,
                  ),
                  BoxShadow(
                    color: AppColors.lightGrey,
                    offset: Offset(0, 2),
                    blurRadius: 1,
                    spreadRadius: 0,
                  ),
                ])
              : const BoxDecoration(),
          child: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: MediaQuery.of(context).size.width / 23),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
