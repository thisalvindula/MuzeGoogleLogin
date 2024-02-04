import 'package:flutter/material.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/reset_password/app/cubits/reset_password_cubit.dart';
import 'package:muze/modules/reset_password/app/ui/pages/email_request_page.dart';
import 'package:muze/modules/reset_password/app/ui/pages/enter_code_page.dart';
import 'package:muze/modules/reset_password/app/ui/pages/reset_password_page.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/behavior/custom_behavior.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/widgets/muze_logo.dart';
import 'package:muze/widgets/waves.dart';

class ResetPasswordHomePage extends StatelessWidget {
  ResetPasswordHomePage({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      EmailRequestPage(controller: _controller),
      EnterCodePage(controller: _controller),
      ResetPasswordPage(controller: _controller),
    ];
    return Scaffold(
      body: Center(
        child: ScrollConfiguration(
          behavior: CustomBehavior(),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    const Waves(reverse: true),
                    Padding(
                      padding: EdgeInsets.only(top: AppSize.getHeight(context) / 20),
                      child: const MuzeLogo(angle: 0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: AppSize.getHeight(context) / 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            pages.length,
                            (index) => Indicator(isActive: locator<ResetPasswordCubit>().state.index == index ? true : false),
                          )
                        ],
                      ),
                    ),
                    PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: pages.length,
                      controller: _controller,
                      onPageChanged: (value) {
                        locator<ResetPasswordCubit>().changeIndex(value);
                      },
                      itemBuilder: (context, index) {
                        return pages[index];
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.15),
                      child: const Waves(reverse: false),
                    ),
                    /*Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.3),
                          child: RowButtonsPageView(
                            onTapFirstButton: () {
                              state.index == 0 ? context.navigator.pop() : _controller.previousPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                            },
                            onTapSecondButton: () {
                              _controller.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                            },
                          ),
                        ),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 60),
      width: MediaQuery.of(context).size.width / 12,
      height: MediaQuery.of(context).size.height / 160,
      decoration: BoxDecoration(color: isActive ? AppColors.primary : Colors.white, borderRadius: BorderRadius.circular(8)),
    );
  }
}
