import 'package:flutter/material.dart';

import '../../../Widgets/custom_text.dart';
import '../../../utils/utils.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          imageHeader(),
          const Spacer(),
          progressSteps(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget progressSteps() {
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
