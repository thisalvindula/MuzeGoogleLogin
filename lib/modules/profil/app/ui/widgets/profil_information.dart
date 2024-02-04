import 'package:flutter/material.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/colors.dart';

enum ProfilInformationType {
  albums,
  top,
  posts,
  followers,
  following,
  listeners,
}

class ProfilInformation extends StatelessWidget {
  final ProfilInformationType profilInformationType;
  final String value;
  const ProfilInformation({super.key, required this.profilInformationType, required this.value});

  @override
  Widget build(BuildContext context) {
    String textValue = "";
    switch (profilInformationType) {
      case ProfilInformationType.followers:
        textValue = "Followers";
        break;
      case ProfilInformationType.following:
        textValue = "Suivi(e)s";
        break;
      case ProfilInformationType.listeners:
        textValue = "auditeurs mensuels";
        break;
      case ProfilInformationType.posts:
        textValue = "Posts";
        break;
      case ProfilInformationType.top:
        textValue = "Top";
        break;
      case ProfilInformationType.albums:
        textValue = "Albums";
        break;
    }
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getWidth(context) / 25, vertical: AppSize.getHeight(context) / 120),
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 11),
            children: [
              TextSpan(
                style: profilInformationType != ProfilInformationType.top ? Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700, fontSize: 11) : null,
                text: profilInformationType == ProfilInformationType.top ? "$textValue " : "$value ",
              ),
              TextSpan(
                style: profilInformationType != ProfilInformationType.top ? null : Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700, fontSize: 11),
                text: profilInformationType == ProfilInformationType.top ? value : textValue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
