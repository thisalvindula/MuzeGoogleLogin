import 'package:flutter/material.dart';
import 'package:muze/l10n/l10n.dart';

enum DifferenceMapType {
  difference,
  differenceType,
}

class Time {
  static Map<DifferenceMapType, dynamic> getDifference(BuildContext context, String time) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    int difference = 0;
    String differenceType = "";

    DateTime createdAt = DateTime.parse(time);
    Duration durationDifference = DateTime.now().difference(createdAt);
    durationDifference.inDays < 1
        ? durationDifference.inHours < 1
            ? {difference = durationDifference.inMinutes, differenceType = localizations.minute_text}
            : {difference = durationDifference.inHours, differenceType = localizations.hour_text}
        : durationDifference.inDays > 29
            ? durationDifference.inDays > 364
                ? {difference = durationDifference.inDays ~/ 365, differenceType = localizations.year_text}
                : {difference = durationDifference.inDays ~/ 30, differenceType = localizations.month_text}
            : {difference = durationDifference.inDays, differenceType = localizations.day_text};

    return {
      DifferenceMapType.difference: difference,
      DifferenceMapType.differenceType: differenceType,
    };
  }
}
