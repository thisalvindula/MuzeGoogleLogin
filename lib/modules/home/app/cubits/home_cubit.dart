import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/home/app/cubits/home_state.dart';
import 'package:muze/modules/news/app/ui/pages/news_page.dart';
import 'package:muze/modules/profil/app/cubits/profil_cubit.dart';
import 'package:muze/modules/profil/app/ui/pages/profil_page.dart';
import 'package:muze/modules/search/app/ui/pages/search_page.dart';
import 'package:muze/modules/search/app/ui/utils/search_category_type.dart';
import 'package:muze/modules/social/app/ui/pages/social_page.dart';
import 'package:muze/modules/swipe/app/ui/pages/swipe_page.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void changeIndex(int index) {
    Widget newBody = Container();
    switch (index) {
      case 0:
        newBody = const SocialPage();
        break;
      case 1:
        newBody = const SearchPage();
        break;
      case 2:
        newBody = const SwipePage();
        break;
      case 3:
        newBody = NewsPage(callback: () {}, showAppBar: false);
        break;
      case 4:
        newBody = const ProfilPage(isFromHome: true);
        locator<ProfilCubit>().getFullProfil(id: "${locator<AuthCubit>().state.user!.id}", type: SearchCategoryType.user);
        break;
    }
    emit(state.copyWith(index: index, body: newBody));
  }
}
