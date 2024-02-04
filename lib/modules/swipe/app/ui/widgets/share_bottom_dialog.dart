import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/swipe/app/cubits/swipe_cubit.dart';
import 'package:muze/modules/swipe/app/ui/widgets/swipe_select_icons.dart';
import 'package:muze/modules/swipe/data/dtos/music_dto.dart';
import 'package:muze/utils/behavior/custom_behavior.dart';
import 'package:muze/utils/bottom_dialog.dart';
import 'package:muze/utils/constants/constants.dart';
import 'package:muze/widgets/custom_snackbar.dart';
import 'package:muze/widgets/custom_text_field.dart';

class ShareBottomDialog {
  Future<void> show(BuildContext context, {required MusicDto music}) async {
    TextEditingController textEditingController = TextEditingController();
    AppLocalizations localizations = AppLocalizations.of(context)!;
    BottomDialog.show(
      context,
      title: localizations.share_discovery_text,
      showButtons: true,
      leftButtonTitle: localizations.cancel_text,
      rightButtonTitle: localizations.share_text,
      onRightButtonPressed: () async {
        bool response = await locator<SwipeCubit>().shareMusic(musicId: music.track_id!, comment: textEditingController.text);
        if (context.mounted) {
          if (!response) {
            CustomSnackBar(context, text: AppLocalizations.of(context)!.error_try_again_later);
          } else {
            List<String> sharedMusicText = localizations.shared_music_text.split(";");
            CustomSnackBar(context, text: "${sharedMusicText[0]} ${music.name} ${sharedMusicText[1]} ${music.artists![0].name} !");
          }
          context.navigator.pop();
        }
      },
      height: MediaQuery.of(context).size.height / 1.4,
      body: ScrollConfiguration(
        behavior: CustomBehavior(),
        child: ListView(
          children: [
            music.image != null
                ? music.image!.url != null
                    ? Image.network(
                        music.image!.url!,
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 5,
                      )
                    : Container()
                : Container(),
            CustomTextField(
              title: "",
              hintText: "${localizations.caption_text}...",
              validator: (p0) {
                return null;
              },
              controller: textEditingController,
              backgroundVisible: false,
            ),
            const Divider(),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 20,
                ),
                SwipeSelectIcon(
                    icon: Padding(
                      padding: const EdgeInsets.all(18),
                      child: SvgPicture.asset(
                        Constants.homeIcon,
                      ),
                    ),
                    title: localizations.news_feed_text,
                    callback: (String name) {
                      return false;
                    },
                    selected: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
