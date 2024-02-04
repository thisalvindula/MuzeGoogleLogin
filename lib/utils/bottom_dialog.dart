import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/widgets/bottom_dialog_button.dart';

class BottomDialog {
  static void show(
    BuildContext context, {
    String? title,
    required Widget body,
    required bool showButtons,
    required double height,
    Function()? onRightButtonPressed,
    String? leftButtonTitle,
    String? rightButtonTitle,
  }) {
    assert(showButtons ? leftButtonTitle != null : true);
    assert(showButtons ? rightButtonTitle != null : true);
    assert(showButtons ? onRightButtonPressed != null : true);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(32), right: Radius.circular(32))),
      backgroundColor: AppColors.lightGrey.withOpacity(0.8),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SizedBox(
            height: height,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 7,
                      height: MediaQuery.of(context).size.height / 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white,
                      ),
                    ),
                    if (title != null) ...{
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 24, fontWeight: FontWeight.w700, height: 32 / 24),
                      ),
                    },
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Expanded(child: body),
                    if (showButtons) ...{
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: BottomDialogButton(
                                type: BottomDialogButtonType.left,
                                title: leftButtonTitle!,
                                onTap: () {
                                  context.navigator.pop();
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            Expanded(
                              child: BottomDialogButton(
                                type: BottomDialogButtonType.right,
                                title: rightButtonTitle!,
                                onTap: onRightButtonPressed!,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                    },
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
