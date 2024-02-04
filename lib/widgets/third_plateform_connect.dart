import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/utils/thirdparty/spotify/spotify_utils.dart';
import 'package:muze/widgets/custom_snackbar.dart';
import 'package:muze/widgets/third_plateform_button.dart';

enum ThirdPlateformConnectType {
  signin,
  preferences,
}

class ThirdPlateformConnect extends StatefulWidget {
  final ThirdPlateformConnectType type;
  const ThirdPlateformConnect({super.key, required this.type});

  @override
  State<ThirdPlateformConnect> createState() => _ThirdPlateformConnectState();
}

class _ThirdPlateformConnectState extends State<ThirdPlateformConnect> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth.authStateChanges().listen((event) {
      _user = event;
      print("initstate");
      print(_user);
    });
  }

  void _handleGoogleSignIn() {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);
      print("handling is done");
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        Text(
          widget.type == ThirdPlateformConnectType.signin
              ? localizations.login_third_party
              : localizations.link_account_third_party,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.greyText),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 50,
        ),
        widget.type == ThirdPlateformConnectType.signin
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ThirdPlateformButton(
                    type: ThirdPlateformType.apple,
                    onTap: () async {
                      // TODO: Apple onTap
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 20,
                  ),
                  ThirdPlateformButton(
                    type: ThirdPlateformType.google,
                    onTap: () {
                      // TODO: Google onTap
                      _handleGoogleSignIn();
                    },
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ThirdPlateformButton(
                    type: ThirdPlateformType.spotify,
                    onTap: () async {
                      SpotifyUtils.connectToSpotify().then((value) async {
                        if (value) {
                          bool response = await SpotifyUtils
                              .getUserPreferencesFromSpotify();
                          if (response) {
                            await locator<AuthCubit>().userInfo();
                            if (context.mounted) {
                              context.navigator.pushHome();
                            }
                          } else {
                            if (context.mounted) {
                              CustomSnackBar(context,
                                  text: localizations.error_try_again_later);
                            }
                          }
                        }
                      });
                    },
                  ),
                ],
              )
      ],
    );
  }
}
