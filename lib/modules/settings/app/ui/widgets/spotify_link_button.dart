import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/utils/constants/constants.dart';
import 'package:muze/utils/thirdparty/spotify/spotify_utils.dart';

class SpotifyLinkButton extends StatefulWidget {
  const SpotifyLinkButton({super.key});

  @override
  State<SpotifyLinkButton> createState() => _SpotifyLinkButtonState();
}

class _SpotifyLinkButtonState extends State<SpotifyLinkButton> {
  bool spotifyConnected = false;

  void getSpotifyConnected() {
    SpotifyUtils.getRefreshToken().then((value) => setState(() => spotifyConnected = value.isNotEmpty));
  }

  @override
  void initState() {
    getSpotifyConnected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.getWidth(context) / 20),
      child: Bounceable(
        onTap: () {
          if (spotifyConnected) {
            log("disconnect");
            SpotifyUtils.disconnectSpotify();
            getSpotifyConnected();
          } else {
            log("connect");
            SpotifyUtils.connectToSpotify().then((value) => getSpotifyConnected());
          }
        },
        child: Container(
          width: AppSize.getWidth(context) / 1.3,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: const Border.fromBorderSide(BorderSide(color: AppColors.spotifyGreen)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.getWidth(context) / 30, vertical: AppSize.getHeight(context) / 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  Constants.spotifyLogo,
                  width: AppSize.getWidth(context) / 15,
                ),
                Text(
                  spotifyConnected ? localizations.signout_spotify_text : localizations.signin_spotify_text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
