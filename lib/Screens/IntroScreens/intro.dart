import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mrc/utils/app_routes.dart';
import 'package:mrc/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Future<void> _onIntroEnd(context) async {
    SharedPreferences openedApp = await SharedPreferences.getInstance();
    openedApp.setString("openedApp", "opened");
    KRoutes.pop(context);
  }

  Widget _buildImage(String assetName, [double width = 200]) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset('assets/$assetName', width: width));
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('logo.png', 100),
          ),
        ),
      ),
      globalFooter: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomButton(
            text: 'Let\'s go',
            textColor: kWhite,
            function: () => _onIntroEnd(context),
            buttonColor: primaryColor),
      ),
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage('edu.jpeg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn as you go",
          body:
              "Download the Stockpile app and master the market with our mini-lesson.",
          image: _buildImage('ok.jpeg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kids and teens",
          body:
              "Kids and teens can track their stocks 24/7 and place trades that you approve.",
          image: _buildImage('study.jpeg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Another title page",
          body: "Another beautiful body text for this example onboarding",
          image: _buildImage('new.jpeg'),
          footer: CustomButton(
              text: "Start over",
              textColor: kWhite,
              function: () {
                introKey.currentState?.animateScroll(0);
              },
              buttonColor: primaryColor),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      showDoneButton: false,
      showNextButton: false,
      nextFlex: 0,
      showBackButton: false,

      back: const Icon(
        Icons.arrow_back_ios,
        color: primaryColor,
      ),
      skip: const CustomText(
        text: 'Skip',
        color: primaryColor,
      ),
      next: const Icon(
        Icons.arrow_forward_ios,
        color: primaryColor,
      ),
      done: const CustomText(
        text: 'Done',
        color: primaryColor,
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: primaryColor,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
