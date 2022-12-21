import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mrc/MVVM/View%20Model/Lead%20Progress/lead_progress_view_model.dart';
import 'package:mrc/MVVM/Views/Authentication/login.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_routes.dart';
import '../../../utils/utils.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    if (userData == "guest") {
      return Scaffold(
        appBar: BaseAppBar(
            title: "Progress",
            appBar: AppBar(),
            widgets: const [],
            appBarHeight: 50),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset("assets/login.json"),
            const SizedBox(
              height: 20,
            ),
            const CustomText(text: "Please login to see your progress"),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              buttonColor: primaryColor,
              text: "Login",
              function: () async {
                SharedPreferences user = await SharedPreferences.getInstance();
                user.remove("user");
                KRoutes.pushAndRemoveUntil(globalContext, const Login());
              },
              textColor: kWhite,
            )
          ],
        ),
      );
    }
    LeadProgressViewModel leadProgressViewModel =
        context.watch<LeadProgressViewModel>();
    return Scaffold(
      body: Column(
        children: [
          imageHeader(),
          const Spacer(),
          progressSteps(leadProgressViewModel),
          const Spacer(),
        ],
      ),
    );
  }

  Widget progressSteps(LeadProgressViewModel leadProgressViewModel) {
    if (leadProgressViewModel.loading) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [1, 2, 3, 4, 5, 6]
              .map(
                (e) => Shimmer.fromColors(
                  highlightColor: kWhite,
                  baseColor: kGrey.withOpacity(0.3),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 0),
                          color: kGrey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 2)
                    ], borderRadius: BorderRadius.circular(15), color: kWhite),
                    height: 150,
                    width: 150,
                  ),
                ),
              )
              .toList(),
        ),
      );
    }
    if (leadProgressViewModel.modelError != null) {
      return const CustomText(text: "Error retriving data");
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          "Find the right course",
          "Prepare your application",
          "Track your applications",
          "Your decision",
          "Before you start",
          "While you're studying"
        ]
            .map(
              (e) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: e != "Find the right course"
                            ? [kGrey, kGrey]
                            : [primaryColor, Colors.grey])),
                height: 150,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: kWhite),
                        child: Icon(e != "Find the right course"
                            ? Icons.lock
                            : Icons.done)),
                    CustomText(
                      text: e,
                      maxLines: 4,
                      fontsize: 18,
                      color: kWhite,
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget imageHeader() {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (bound) {
            return LinearGradient(
                end: FractionalOffset.topCenter,
                begin: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.99),
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
                stops: const [
                  0.0,
                  0.3,
                  0.45
                ]).createShader(bound);
          },
          blendMode: BlendMode.srcOver,
          child: Container(
            height: 400,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/progress.jpg"), fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: Column(
            children: const [
              CustomText(
                text: "Progress Tracker",
                color: kWhite,
                fontWeight: FontWeight.bold,
                fontsize: 30,
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "keep track of your completed steps",
                color: kWhite,
                fontsize: 18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
