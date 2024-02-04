import 'package:flutter/material.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/settings/app/ui/widgets/disconnect_button.dart';
import 'package:muze/modules/settings/app/ui/widgets/settings_row.dart';
import 'package:muze/modules/settings/app/ui/widgets/settings_section_title.dart';
import 'package:muze/modules/settings/app/ui/widgets/spotify_link_button.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/widgets/custom_appbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: AppSize.getHeight(context) / 20,
            ),
            CustomAppBar(
              customAppBarType: CustomAppBarType.nothing,
              showBackButton: true,
              showMuzeLogo: false,
              title: localizations.settings_text,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*SizedBox(
                    height: AppSize.getHeight(context) / 50,
                  ),
                  Center(
                    child: Text(
                      "Paramètres",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 24),
                    ),
                  ),*/
                  SizedBox(
                    height: AppSize.getHeight(context) / 20,
                  ),
                  SettingsSectionTitle(title: localizations.general_text),
                  SizedBox(
                    height: AppSize.getHeight(context) / 50,
                  ),
                  SettingsRow(
                    title: localizations.edit_profil_text,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: AppSize.getHeight(context) / 20,
                  ),
                  const SettingsSectionTitle(title: "Spotify"),
                  SizedBox(
                    height: AppSize.getHeight(context) / 50,
                  ),
                  const SpotifyLinkButton(),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const DisconnectButton(),
                        SizedBox(
                          height: AppSize.getHeight(context) / 50,
                        ),
                        Center(
                          child: Text(
                            "0.1.0 (1)",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12, color: AppColors.greyText),
                          ),
                        ),
                        SizedBox(
                          height: AppSize.getHeight(context) / 50,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
