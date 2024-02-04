import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/utils/constants/constants.dart';

class NextButton extends StatelessWidget {
  final Function() onTap;
  const NextButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 6,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  localizations.next_text,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: MediaQuery.of(context).size.width / 24, height: (MediaQuery.of(context).size.width / 18) / (MediaQuery.of(context).size.width / 24), fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 50,
            ),
            SvgPicture.asset(Constants.nextButton),
          ],
        ),
      ),
    );
  }
}

class RightArrowButton extends StatelessWidget {
  const RightArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 15,
      height: MediaQuery.of(context).size.height / 32,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        Icons.arrow_forward,
        size: MediaQuery.of(context).size.width / 20,
        color: AppColors.black,
      ),
    );
  }
}
