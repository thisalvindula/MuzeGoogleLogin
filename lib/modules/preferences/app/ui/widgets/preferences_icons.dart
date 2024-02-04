import 'package:flutter/material.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/preferences/app/cubits/preferences_cubit.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/widgets/custom_snackbar.dart';

enum PreferecensIconsType {
  artists,
  genres,
}

class PreferencesIcons extends StatelessWidget {
  final List<String> selectedPreferences;
  final int index;
  final List<List<String>> preferences;
  final bool showSecondIcon;
  final PreferecensIconsType type;
  const PreferencesIcons({super.key, required this.index, required this.preferences, required this.selectedPreferences, required this.showSecondIcon, required this.type});

  @override
  Widget build(BuildContext context) {
    bool firstSelected = selectedPreferences.contains(preferences[index * 2][2]);
    bool secondSelected = showSecondIcon ? selectedPreferences.contains(preferences[index * 2 + 1][2]) : false;
    return Row(
      children: [
        Column(
          children: [
            PreferencesIcon(
              type: type,
              imageUrl: preferences[index * 2][1],
              title: preferences[index * 2][0],
              callback: () {
                if (firstSelected) {
                  locator<PreferencesCubit>().removeSelectedPreferences(preferences[index * 2][2]);
                } else {
                  if (locator<PreferencesCubit>().state.selectedPreferences.length < 5) {
                    locator<PreferencesCubit>().addSelectedPreferences(preferences[index * 2][2]);
                  } else {
                    CustomSnackBar(context, text: "Vous en avez déjà ajouté 5");
                  }
                }
              },
              selected: firstSelected,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 14,
            ),
            !showSecondIcon
                ? Container()
                : PreferencesIcon(
                    type: type,
                    selected: secondSelected,
                    imageUrl: preferences[index * 2 + 1][1],
                    title: preferences[index * 2 + 1][0],
                    callback: () {
                      if (secondSelected) {
                        locator<PreferencesCubit>().removeSelectedPreferences(preferences[index * 2 + 1][2]);
                      } else {
                        if (locator<PreferencesCubit>().state.selectedPreferences.length < 5) {
                          locator<PreferencesCubit>().addSelectedPreferences(preferences[index * 2 + 1][2]);
                        } else {
                          CustomSnackBar(context, text: "Vous en avez déjà ajouté 5");
                        }
                      }
                    },
                  ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 20,
        ),
      ],
    );
  }
}

class PreferencesIcon extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function() callback;
  final bool selected;
  final PreferecensIconsType type;
  const PreferencesIcon({super.key, required this.imageUrl, required this.title, required this.callback, required this.selected, required this.type});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 5,
            height: MediaQuery.of(context).size.height / 11,
            decoration: BoxDecoration(
              image: imageUrl.isEmpty ? null : DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.fill),
              border: Border.fromBorderSide(
                BorderSide(
                  width: selected ? 2 : 1,
                  color: selected ? AppColors.primary : AppColors.white.withOpacity(0.5),
                ),
              ),
              shape: type == PreferecensIconsType.genres ? BoxShape.circle : BoxShape.rectangle,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 53,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3.7,
            child: Text(
              title.toUpperCase(),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12, fontWeight: FontWeight.w700, height: 22 / 12, color: selected ? AppColors.primary[800] : AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
