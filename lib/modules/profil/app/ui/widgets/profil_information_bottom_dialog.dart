import 'package:flutter/material.dart';
import 'package:muze/utils/bottom_dialog.dart';

class ProfilInformationBottomDialog {
  Future<void> show(BuildContext context) async {
    BottomDialog.show(
      context,
      title: "Followers",
      showButtons: false,
      height: MediaQuery.of(context).size.height / 4,
      body: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
          child: const Column(
            children: [
              Text("Shay a 326 452 followers"),
            ],
          )),
    );
  }
}
