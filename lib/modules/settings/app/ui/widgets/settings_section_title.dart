import 'package:flutter/material.dart';
import 'package:muze/utils/app_size.dart';

class SettingsSectionTitle extends StatelessWidget {
  final String title;
  const SettingsSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Expanded(child: Divider()),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.getWidth(context) / 20),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
