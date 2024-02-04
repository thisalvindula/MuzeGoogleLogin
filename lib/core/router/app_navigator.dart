import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muze/core/router/app_routes.dart';

abstract class AppNavigator {
  void pop();
  void pushResetPasswordPage();
  void pushPreferences();
  void pushHome();
  void pushAuth();
  void pushNews({Function()? callback});
  void pushProfil();
  void pushSettings();
}

class AppNavigatorImpl implements AppNavigator {
  final BuildContext context;
  AppNavigatorImpl(this.context);

  @override
  void pushResetPasswordPage() {
    context.pushNamed(AppRoutes.resetPassword.name);
  }

  @override
  void pop() {
    context.pop();
  }

  @override
  void pushPreferences() {
    context.pushReplacementNamed(AppRoutes.preferences.name);
  }

  @override
  void pushHome() {
    context.pushReplacementNamed(AppRoutes.home.name);
  }

  @override
  void pushNews({Function()? callback}) {
    context.pushNamed(AppRoutes.news.name, extra: callback);
  }

  @override
  void pushProfil() {
    context.pushNamed(AppRoutes.profil.name);
  }

  @override
  void pushAuth() {
    context.pushReplacementNamed(AppRoutes.auth.name);
  }

  @override
  void pushSettings() {
    context.pushNamed(AppRoutes.settings.name);
  }
}
