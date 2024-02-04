import 'package:flutter/material.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/auth/app/ui/pages/signin_body.dart';
import 'package:muze/modules/auth/app/ui/pages/signup_body.dart';
import 'package:muze/modules/auth/app/ui/utils/auth_select_type.dart';
import 'package:muze/modules/auth/app/ui/widgets/auth_select_widget.dart';
import 'package:muze/utils/behavior/custom_behavior.dart';
import 'package:muze/widgets/muze_logo.dart';
import 'package:muze/widgets/waves.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  var angle = 0.0;
  late AnimationController _controllerAnimation;

  @override
  void initState() {
    _controllerAnimation = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.57,
      duration: const Duration(milliseconds: 100),
    );
    _controllerAnimation.addListener(() {
      setState(() {
        angle = _controllerAnimation.value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: CustomBehavior(),
        child: ListView(
          shrinkWrap: false,
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                const Waves(reverse: true),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),
                MuzeLogo(angle: -angle),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 18,
                ),
                AuthSelectWidget(
                  onChange: (AuthType type) {
                    if (_controllerAnimation.isCompleted) {
                      _controllerAnimation.reverse();
                    } else {
                      _controllerAnimation.forward(from: 0.0);
                    }
                    locator<AuthCubit>().changeAuthSelectedType(type);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 27,
                ),
                locator<AuthCubit>().state.authType == AuthType.signin ? const SigninBody() : const SignupBody(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),
                const Waves(reverse: false)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
