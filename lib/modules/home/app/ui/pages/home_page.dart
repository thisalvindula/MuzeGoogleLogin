import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/home/app/cubits/home_cubit.dart';
import 'package:muze/modules/home/app/cubits/home_state.dart';
import 'package:muze/utils/constants/constants.dart';
import 'package:muze/widgets/waves.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: locator<HomeCubit>()..changeIndex(2),
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              const Waves(reverse: true),
              /*Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 17.8, right: MediaQuery.of(context).size.width / 17.8, top: MediaQuery.of(context).size.height / 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(Constants.muzeTextLogo, width: MediaQuery.of(context).size.width / 4.36666),
                        Container(),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.navigator.pushNews();
                          },
                          child: SvgPicture.asset(Constants.notificationsIcon, width: MediaQuery.of(context).size.width / 16.35),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 18,
                        ),
                        SvgPicture.asset(Constants.chatIcon, width: MediaQuery.of(context).size.width / 16.35),
                      ],
                    )
                  ],
                ),
              ),*/

              Expanded(child: state.body ?? Container()),
            ],
          ),
          bottomNavigationBar: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10.0,
                sigmaY: 10.0,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0x77080808), Color(0xFF0A0A0A)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: BottomNavigationBar(
                    showUnselectedLabels: true,
                    backgroundColor: Colors.transparent,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: state.index,
                    unselectedFontSize: 10,
                    selectedFontSize: 10,
                    selectedItemColor: const Color(0xFF575758),
                    unselectedItemColor: const Color(0xFF575758),
                    unselectedLabelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 5, height: 2.5, color: const Color(0xFF575758)),
                    selectedLabelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 10, height: 2.5, color: const Color(0xFF575758)),
                    onTap: (value) {
                      log("a $value");
                      locator<HomeCubit>().changeIndex(value);
                    },
                    items: [
                      state.index == 0
                          ? BottomNavigationBarItem(icon: Bounceable(onTap: () {}, child: SvgPicture.asset(Constants.homeFillIcon)), label: "Social")
                          : BottomNavigationBarItem(
                              icon: Bounceable(
                                  onTap: () {
                                    locator<HomeCubit>().changeIndex(0);
                                  },
                                  child: SvgPicture.asset(Constants.homeIcon)),
                              label: ""),
                      state.index == 1
                          ? BottomNavigationBarItem(icon: SvgPicture.asset(Constants.searchFillIcon), label: localizations.search_text)
                          : BottomNavigationBarItem(icon: SvgPicture.asset(Constants.searchIcon), label: ""),
                      BottomNavigationBarItem(icon: Image.asset(Constants.muzeLogo, width: 50), label: ""),
                      state.index == 3
                          ? BottomNavigationBarItem(icon: SvgPicture.asset(Constants.categoryFillIcon), label: "Playlist")
                          : BottomNavigationBarItem(icon: SvgPicture.asset(Constants.categoryIcon), label: ""),
                      state.index == 4
                          ? BottomNavigationBarItem(icon: SvgPicture.asset(Constants.profilFillIcon), label: "Profil")
                          : BottomNavigationBarItem(icon: SvgPicture.asset(Constants.profilIcon), label: ""),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
