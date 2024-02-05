import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:go_router/go_router.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/colors.dart';

class DisconnectButton extends StatelessWidget {
  const DisconnectButton({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.getWidth(context) / 20),
      child: Bounceable(
        onTap: () {
          locator<AuthCubit>().clearToken();
          context.navigator.pushAuth();
        },
        child: Container(
          width: AppSize.getWidth(context) / 1.3,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border:
                const Border.fromBorderSide(BorderSide(color: AppColors.red)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: () {
              try {
                print("signout");
                locator<AuthCubit>().clearToken();
                locator<AuthCubit>().getToken();
                while (context.canPop()) {
                  context.navigator.pop();
                }
                context.navigator.pushAuth();
              } catch (e) {
                print(e);
              }
            },
            style: ButtonStyle(
              overlayColor:
                  MaterialStatePropertyAll(AppColors.red.withOpacity(0.4)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.getWidth(context) / 30,
                  vertical: AppSize.getHeight(context) / 50),
              child: Center(
                child: Text(
                  localizations.signout_text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.red),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
