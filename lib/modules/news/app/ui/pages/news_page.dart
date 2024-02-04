import 'package:flutter/material.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/widgets/custom_appbar.dart';
import 'package:muze/widgets/waves.dart';

class NewsPage extends StatefulWidget {
  final Function()? callback;
  final bool showAppBar;
  const NewsPage({super.key, this.callback, required this.showAppBar});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void dispose() {
    widget.callback != null ? widget.callback!() : null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            if (widget.showAppBar) ...{
              const Waves(reverse: true),
              const CustomAppBar(customAppBarType: CustomAppBarType.nothing, showBackButton: true),
            },
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(localizations.coming_soon_text),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
