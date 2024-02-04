import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/core/router/app_router.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp.router(
      // Title
      title: "Muze",
      // Debug banner off
      debugShowCheckedModeBanner: false,
      // Localizations delegates
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // Supported locales
      supportedLocales: AppLocalizations.supportedLocales,
      // Theme
      theme: AppTheme(context).appTheme(),
      // Router
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
    );
  }
}
