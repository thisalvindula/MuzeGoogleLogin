import 'package:flutter/material.dart';
import 'package:muze/l10n/l10n.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          children: [
            Text(
              localizations.filter_mood_text,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.w700, height: 16 / 15),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            const Expanded(child: Divider()),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 50,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 9,
          child: Text(localizations.coming_soon_text),
        )
      ],
    );
  }
}
