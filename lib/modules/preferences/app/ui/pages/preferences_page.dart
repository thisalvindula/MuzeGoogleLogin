import 'package:flutter/material.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/auth/app/cubits/auth_state.dart';
import 'package:muze/modules/preferences/app/cubits/preferences_cubit.dart';
import 'package:muze/modules/preferences/app/ui/pages/artists_body.dart';
import 'package:muze/modules/preferences/app/ui/pages/genres_body.dart';
import 'package:muze/utils/behavior/custom_behavior.dart';
import 'package:muze/widgets/third_plateform_connect.dart';
import 'package:muze/widgets/waves.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  final PageController _controller = PageController();
  List<Widget> pages = [];

  @override
  void initState() {
    pages = [
      GenresBody(
        pageController: _controller,
      ),
      ArtistBody(
        pageController: _controller,
      ),
    ];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (locator<AuthCubit>().state.status == StartAppStatus.artists) {
        locator<PreferencesCubit>().clear();
        _controller.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: CustomBehavior(),
        child: ListView(
          physics: 900 - MediaQuery.of(context).size.height > 100 ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            const Waves(reverse: true),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.4,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pages.length,
                controller: _controller,
                onPageChanged: (value) {},
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
            ),
            const ThirdPlateformConnect(
              type: ThirdPlateformConnectType.preferences,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            const Waves(reverse: false),
          ],
        ),
      ),
    );
  }
}
