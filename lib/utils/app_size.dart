import 'package:flutter/material.dart';

class AppSize {
  static getWidth(BuildContext context) {
    return (MediaQuery.of(context).size.width - MediaQuery.of(context).viewPadding.left - MediaQuery.of(context).viewPadding.right);
  }

  static getHeight(BuildContext context) {
    return (MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top - MediaQuery.of(context).viewPadding.bottom);
  }
}
