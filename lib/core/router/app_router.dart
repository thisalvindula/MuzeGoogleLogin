import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/core/router/app_routes.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/auth/app/cubits/auth_state.dart';
import 'package:muze/modules/auth/app/ui/pages/auth_page.dart';
import 'package:muze/modules/home/app/ui/pages/home_page.dart';
import 'package:muze/modules/news/app/ui/pages/news_page.dart';
import 'package:muze/modules/preferences/app/ui/pages/preferences_page.dart';
import 'package:muze/modules/profil/app/ui/pages/profil_page.dart';
import 'package:muze/modules/reset_password/app/ui/pages/reset_password_home_page.dart';
import 'package:muze/modules/settings/app/ui/pages/settings_page.dart';

class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoutes.auth.path,
    redirect: (context, state) async {
      log("here");

      if (state.matchedLocation == AppRoutes.auth.path) {
        log("here 1");

        StartAppStatus status = await locator<AuthCubit>().getStatus();
        log("redirect $status");
        switch (status) {
          case StartAppStatus.auth:
            return AppRoutes.auth.path;
          case StartAppStatus.genres:
            return AppRoutes.preferences.path;
          case StartAppStatus.artists:
            return AppRoutes.preferences.path;
          case StartAppStatus.home:
            return AppRoutes.home.path;
        }
      }
      //if ((locator<AuthCubit>().state.authDto!.token ?? "").isEmpty) return AppRoutes.auth.path;
      //if ((locator<AuthCubit>().state.authDto!.token ?? "").isNotEmpty) return AppRoutes.preferences.path;
      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.auth.path,
        name: AppRoutes.auth.name,
        pageBuilder: (context, state) => CupertinoPage(child: const AuthPage(), key: state.pageKey),
      ),
      GoRoute(
        path: AppRoutes.resetPassword.path,
        name: AppRoutes.resetPassword.name,
        pageBuilder: (context, state) => CupertinoPage(child: ResetPasswordHomePage(), key: state.pageKey),
      ),
      GoRoute(
        path: AppRoutes.preferences.path,
        name: AppRoutes.preferences.name,
        pageBuilder: (context, state) => CupertinoPage(child: const PreferencesPage(), key: state.pageKey),
      ),
      GoRoute(
        path: AppRoutes.home.path,
        name: AppRoutes.home.name,
        pageBuilder: (context, state) => CupertinoPage(child: const HomePage(), key: state.pageKey),
      ),
      GoRoute(
        path: AppRoutes.news.path,
        name: AppRoutes.news.name,
        pageBuilder: (context, state) => CupertinoPage(child: NewsPage(callback: state.extra as Function()?, showAppBar: true), key: state.pageKey),
      ),
      GoRoute(
        path: AppRoutes.profil.path,
        name: AppRoutes.profil.name,
        pageBuilder: (context, state) => CupertinoPage(child: const ProfilPage(), key: state.pageKey),
      ),
      GoRoute(
        path: AppRoutes.settings.path,
        name: AppRoutes.settings.name,
        pageBuilder: (context, state) => CupertinoPage(child: const SettingsPage(), key: state.pageKey),
      ),
    ],
  );
}

class PageBuilder {
  static Page transition({required Widget child, required LocalKey key}) {
    return CustomTransitionPage<void>(
      child: child,
      key: key,
      transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ),
        ),
        child: child,
      ),
    );
  }
}
