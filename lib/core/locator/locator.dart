import 'package:get_it/get_it.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/auth/data/repositories/auth_repository.dart';
import 'package:muze/modules/home/app/cubits/home_cubit.dart';
import 'package:muze/modules/news/app/cubits/news_cubit.dart';
import 'package:muze/modules/news/data/repositories/news_repository.dart';
import 'package:muze/modules/preferences/app/cubits/preferences_cubit.dart';
import 'package:muze/modules/preferences/data/repositories/preferences_repository.dart';
import 'package:muze/modules/profil/app/cubits/profil_cubit.dart';
import 'package:muze/modules/profil/data/repositories/profil_repository.dart';
import 'package:muze/modules/reset_password/app/cubits/reset_password_cubit.dart';
import 'package:muze/modules/reset_password/data/repositories/reset_password_repository.dart';
import 'package:muze/modules/search/app/cubits/search_cubit.dart';
import 'package:muze/modules/search/data/repositories/search_repository.dart';
import 'package:muze/modules/social/app/cubits/social_cubit.dart';
import 'package:muze/modules/social/data/repositories/social_repository.dart';
import 'package:muze/modules/swipe/app/cubits/swipe_cubit.dart';
import 'package:muze/modules/swipe/data/repositories/swipe_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  await registerCubits();
}

registerCubits() async {
  // AUTHENTICATION
  if (!locator.isRegistered<AuthCubit>()) {
    locator.registerLazySingleton(
      () => AuthCubit(authDomainRepository: AuthRepository()),
    );
  }

  // RESET PASSWORD
  if (!locator.isRegistered<ResetPasswordCubit>()) {
    locator.registerLazySingleton(
      () => ResetPasswordCubit(resetPasswordDomainRepository: ResetPasswordRepository()),
    );
  }

  // PREFERENCES
  if (!locator.isRegistered<PreferencesCubit>()) {
    locator.registerLazySingleton(
      () => PreferencesCubit(preferencesDomainRepository: PreferencesRepository()),
    );
  }

  // HOME
  if (!locator.isRegistered<HomeCubit>()) {
    locator.registerLazySingleton(
      () => HomeCubit(),
    );
  }

  // SWIPE
  if (!locator.isRegistered<SwipeCubit>()) {
    locator.registerLazySingleton(
      () => SwipeCubit(swipeDomainRepository: SwipeRepository()),
    );
  }

  // SOCIAL
  if (!locator.isRegistered<SocialCubit>()) {
    locator.registerLazySingleton(
      () => SocialCubit(socialDomainRepository: SocialRepository()),
    );
  }

  // NEWS
  if (!locator.isRegistered<NewsCubit>()) {
    locator.registerLazySingleton(
      () => NewsCubit(newsDomainRepository: NewsRepository()),
    );
  }

  // SEARCH
  if (!locator.isRegistered<SearchCubit>()) {
    locator.registerLazySingleton(
      () => SearchCubit(searchDomainRepository: SearchRepository()),
    );
  }

  // PROFIL
  if (!locator.isRegistered<ProfilCubit>()) {
    locator.registerLazySingleton(
      () => ProfilCubit(profilDomainRepository: ProfilRepository()),
    );
  }
}
