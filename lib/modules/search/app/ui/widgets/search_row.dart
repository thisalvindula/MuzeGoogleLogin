import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee/marquee.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/modules/profil/app/cubits/profil_cubit.dart';
import 'package:muze/modules/search/app/ui/utils/search_category_type.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/utils/constants/constants.dart';

class SearchRow extends StatelessWidget {
  final SearchCategoryType type;
  final String imageURL;
  final String name;
  final String id;
  const SearchRow({super.key, required this.imageURL, required this.name, required this.id, required this.type});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () async {
        log("a$id");
        log("a$type");
        if (id.isNotEmpty) {
          context.navigator.pushProfil();
          bool response = await locator<ProfilCubit>().getFullProfil(id: id, type: type);
          if (!response && context.mounted) {
            context.navigator.pop();
          }
        }
      },
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getWidth(context) / 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: const Border.fromBorderSide(BorderSide(width: 1, color: AppColors.white)),
                      image: imageURL.isEmpty
                          ? null
                          : DecorationImage(
                              image: NetworkImage(imageURL),
                            ),
                    ),
                  ),
                  SizedBox(
                    width: AppSize.getWidth(context) / 40,
                  ),
                  if (name.length < 30) ...{
                    Text(
                      name,
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w600),
                    ),
                  } else ...{
                    SizedBox(
                      width: AppSize.getWidth(context) / 1.7,
                      height: 50,
                      child: Marquee(
                        showFadingOnlyWhenScrolling: true,
                        startAfter: Duration(milliseconds: math.Random().nextInt(1500) + 1000),
                        pauseAfterRound: Duration(milliseconds: math.Random().nextInt(1500) + 1000),
                        fadingEdgeEndFraction: 0.3,
                        blankSpace: 100,
                        velocity: 50,
                        text: name,
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  },
                ],
              ),
              SvgPicture.asset(
                Constants.arrowIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
