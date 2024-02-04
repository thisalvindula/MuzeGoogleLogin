import 'package:flutter/material.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/auth/app/ui/utils/auth_select_type.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/widgets/loading.dart';

class AuthButton extends StatelessWidget {
  final Function() onPressed;
  final bool loading;
  final AuthType type;
  const AuthButton({super.key, required this.onPressed, required this.loading, required this.type});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          loading
              ? const Loading()
              : Container(
                  height: MediaQuery.of(context).size.height / 13,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(color: AppColors.purpleShadow),
                      BoxShadow(
                        color: AppColors.primary,
                        blurRadius: 1,
                        spreadRadius: 0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      type == AuthType.signin ? localizations.login_text : localizations.register_text,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 16, height: 26 / 16),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
