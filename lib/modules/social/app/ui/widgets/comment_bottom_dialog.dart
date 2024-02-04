import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muze/modules/swipe/app/ui/widgets/swipe_select_icons.dart';
import 'package:muze/modules/swipe/data/dtos/music_dto.dart';
import 'package:muze/utils/behavior/custom_behavior.dart';
import 'package:muze/utils/bottom_dialog.dart';
import 'package:muze/utils/constants/constants.dart';
import 'package:muze/widgets/custom_text_field.dart';

class CommentBottomDialog {
  Future<void> show(BuildContext context, {required MusicDto music}) async {
    TextEditingController textEditingController = TextEditingController();
    BottomDialog.show(
      context,
      title: "Commentaires",
      showButtons: false,
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
              hintText: "Ajoutez une légende...",
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
                    title: "Fil d'actualité",
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
