import 'package:flutter/material.dart';
import 'package:muze/core/router/app_navigator.dart';

extension NavigationHelpersExt on BuildContext {
  AppNavigator get navigator => AppNavigatorImpl(this);
}
