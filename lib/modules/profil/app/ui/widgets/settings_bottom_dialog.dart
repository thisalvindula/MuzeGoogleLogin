import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:go_router/go_router.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/bottom_dialog.dart';

class SettingsBottomDialog {
  Future<void> show(BuildContext context) async {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    BottomDialog.show(
      context,
      showButtons: false,
      height: MediaQuery.of(context).size.height / 7,
      body: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
          child: Column(
            children: [
              Bounceable(
                onTap: () {
                  context.pop();
                  context.navigator.pushSettings();
                },
                child: Container(
                  color: Colors.transparent,
                  height: AppSize.getHeight(context) / 15,
                  child: Row(
                    children: [
                      const Icon(Icons.settings),
                      SizedBox(
                        width: AppSize.getWidth(context) / 20,
                      ),
                      Text(localizations.settings_text),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
