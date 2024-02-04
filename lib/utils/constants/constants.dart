class Constants {
  /* API */

  // BASE
  static const String apiBaseUrl = "preprod.muze-app.com";
  static const String clientId = "17d2c752d63746b6b71f24ca4750788c";
  static const String clientSecret = "5aaf5c79d37a4ed88613d27910766a6e";

  // AUTHENTIFICATION

  /// RESET PASSWORD
  static const String forgotPasswordPath = "/api/auth/forgot-password";
  static const String resetPasswordTokenPath = "/api/auth/reset-password-token";
  static const String newPasswordPath = "/api/auth/new-password";

  /// PROVIDER LOGIN
  static const String spotifyLoginPath = "/api/spotify/auth/redirect";
  static const String googleLoginPath = "/auth/redirect";

  /// OTHERS
  static const String registerPath = "/api/auth/register";
  static const String loginPath = "/api/auth/login";
  static const String logoutPath = "/api/auth/logout";

  // USER

  /// USERS
  static const String userPath = "/api/user";
  static const String usersPath = "/api/users";

  /// PREFERENCES
  static const String editPreferencesPath = "/api/user/preferences/edit";

  /// THIRDPARTY

  //// SPOTIFY
  static const String spotifyMe = "/api/user/thirdparty/spotify/me";
  static const String spotifyRefreshTokenPath = "/api/user/thirdparty/spotify/refreshtoken";
  static const String spotifyPlaylists = "/api/user/thirdparty/spotify/me/playlist";
  static const String spotifyTop = "/api/user/thirdparty/spotify/me/top";

  /// OTHERS
  static const String mePath = "/api/user/me";

  // MUSIC
  static const String musicPath = "/api/music/post";

  /// GENRE
  static const String genresPath = "/api/music/genres";

  /// ARTISTS
  static const String artistsPath = "/api/music/artists";

  /// TRACKS
  static const String tracksPath = "/api/music/tracks";

  /// POSTS
  static const String postPath = "/api/music/following/post";

  /* IMAGES */

  // IMAGES
  static const String basicUserAvatar = "assets/images/images/basic_user_avatar.png";

  // LOGOS
  static const String muzeLogo = "assets/images/logos/muze_logo.png";
  static const String muzeTextLogo = "assets/images/logos/muze_text_logo.png";
  static const String googleLogo = "assets/images/logos/google_logo.png";
  static const String spotifyLogo = "assets/images/logos/spotify_logo.png";

  // BUTTONS
  static const String nextButton = "assets/images/buttons/next_button.svg";
  static const String backButton = "assets/images/buttons/back_button.svg";

  // ICONS

  /// BOTTOM NAV BAR
  static const String homeIcon = "assets/images/icons/home.svg";
  static const String homeFillIcon = "assets/images/icons/home_fill.svg";
  static const String searchIcon = "assets/images/icons/search.svg";
  static const String searchFillIcon = "assets/images/icons/search_fill.svg";
  static const String categoryIcon = "assets/images/icons/category.svg";
  static const String categoryFillIcon = "assets/images/icons/category_fill.svg";
  static const String profilIcon = "assets/images/icons/profil.svg";
  static const String profilFillIcon = "assets/images/icons/profil_fill.svg";

  /// FILTER SWIPE
  static const String filterIcon = "assets/images/icons/filter.svg";

  /// SWIPE BUTTONS
  static const String shareIcon = "assets/images/icons/share.svg";
  static const String likeIcon = "assets/images/icons/like.svg";
  static const String dislikeIcon = "assets/images/icons/dislike.svg";

  /// MUSIC CARD
  static const String playIcon = "assets/images/icons/play.svg";
  static const String pauseIcon = "assets/images/icons/pause.svg";

  /// SOCIAL POST
  static const String heartIcon = "assets/images/icons/heart.svg";
  static const String heartFillIcon = "assets/images/icons/heart_fill.png";
  static const String commentIcon = "assets/images/icons/comment.svg";
  static const String shareSocialIcon = "assets/images/icons/share_social.svg";
  static const String settingsIcon = "assets/images/icons/settings.svg";

  /// APPBAR
  static const String notificationsIcon = "assets/images/icons/notifications.svg";
  static const String chatIcon = "assets/images/icons/chat.svg";

  /// SEARCH PAGE
  static const String arrowIcon = "assets/images/icons/arrow.svg";

  /// PROFIL PAGE
  static const String iconMenuDotsIcon = "assets/images/icons/icon_menu_dots.svg";

  /* ANIMATIONS */
  static const String loadingAnimation = "assets/animations/loading.json";
  static const String wavesAnimation = "assets/animations/waves.json";
  static const String soundWaveAnimation = "assets/animations/sound_wave.gif";
  static const String versionProAnimation = "assets/animations/version_pro.gif";
}
