enum AppRoutes {
  auth(name: "auth", path: "/auth"),
  resetPassword(name: "resetPassword", path: "/resetPassword"),
  preferences(name: "preferences", path: "/preferences"),
  home(name: "home", path: "/home"),
  news(name: "news", path: "/news"),
  profil(name: "profil", path: "/profil"),
  settings(name: "settings", path: "/settings");

  const AppRoutes({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  @override
  String toString() => name;
}
