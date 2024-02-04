import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/constants.dart';

class SettingsRow extends StatelessWidget {
  final String title;
  final Function() onTap;
  const SettingsRow({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getWidth(context) / 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
              ),
              SvgPicture.asset(
                Constants.arrowIcon,
                width: AppSize.getWidth(context) / 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
