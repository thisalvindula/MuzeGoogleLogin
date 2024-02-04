import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/swipe/app/cubits/swipe_cubit.dart';
import 'package:muze/modules/swipe/app/ui/widgets/filter_bottom_dialog.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/utils/constants/constants.dart';

class SwipeFilter extends StatefulWidget {
  final String name;
  final Function() callbackChangeFilter;
  const SwipeFilter({super.key, required this.name, required this.callbackChangeFilter});

  @override
  State<SwipeFilter> createState() => _SwipeFilterState();
}

class _SwipeFilterState extends State<SwipeFilter> {
  bool filterOn = false;
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Bounceable(
          onTap: () {
            if (filterOn) {
              locator<SwipeCubit>().clearSelectedGenres();
              locator<SwipeCubit>().clearMusics();
              locator<SwipeCubit>().clearIndex();
              locator<SwipeCubit>().getMusic();
              setState(() {
                filterOn = false;
              });
              widget.callbackChangeFilter.call();
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height / 25,
            decoration: BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.circular(100)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 25),
              child: Center(
                child: filterOn
                    ? SvgPicture.asset(
                        Constants.profilIcon,
                        width: 20,
                      )
                    : RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: localizations.radio_for_text.toUpperCase(),
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.lightGreyWhiteText,
                                    fontSize: 12,
                                  ),
                            ),
                            TextSpan(
                              text: widget.name.toUpperCase(),
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                    fontWeight: FontWeight.w100,
                                    color: AppColors.lightGreyWhiteText,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 50,
        ),
        Bounceable(
          onTap: () {
            FilterBottomDialog().show(
              context,
              callbackFilterOn: (value) {
                setState(() {
                  filterOn = value;
                });

                widget.callbackChangeFilter.call();
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.circular(100)),
            height: MediaQuery.of(context).size.height / 25,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 20),
              child: Center(
                child: filterOn
                    ? Container(
                        constraints: BoxConstraints(maxWidth: AppSize.getWidth(context) / 1.5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              localizations.based_on_text.toUpperCase(),
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.lightGreyWhiteText,
                                    fontSize: 12,
                                  ),
                            ),
                            Flexible(
                              child: Text(
                                locator<SwipeCubit>().state.selectedGenres.toString().replaceAll("[", "").replaceAll("]", "").toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w100,
                                      color: AppColors.lightGreyWhiteText,
                                      fontSize: 12,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SvgPicture.asset(Constants.filterIcon),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
