import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mrc/Api/api.dart';
import 'package:mrc/Widgets/custom_slider.dart';
import 'package:mrc/Widgets/custom_text.dart';
import 'package:mrc/Widgets/custom_uni_cards.dart';
import 'package:mrc/Widgets/custom_uni_cards_shimmer.dart';
import 'package:mrc/Widgets/general_app_search.dart';
import 'package:mrc/Widgets/row_text.dart';
import 'package:mrc/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final List optionsList = [
    //   {
    //     "name": "Explore Universities",
    //     "image":
    //         "https://static.vecteezy.com/system/resources/previews/002/521/207/non_2x/graduation-hat-education-school-icon-design-free-vector.jpg",
    //     "function": () {
    //       KRoutes.push(
    //           context,
    //           ResultantScreen(
    //             appBarTitle: "Explore",
    //             givenList: universityList,
    //           ));
    //     }
    //   },
    //   {
    //     "name": "Professional Courses",
    //     "image":
    //         "https://static.vecteezy.com/system/resources/previews/002/131/170/non_2x/free-online-course-rgb-color-icon-vector.jpg",
    //     "function": () {
    //       KRoutes.push(
    //           context,
    //           VideoPage(
    //             appBarTitle: "Professional Courses",
    //             givenList: ieltsList,
    //           ));
    //     }
    //   },
    // ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: CustomText(
                  text: "Find Your \ndream degree",
                  fontsize: 25,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: GeneralAppSearchWidget(
                  enabled: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomSlider(),
              // GridView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       childAspectRatio: 16 / 7,
              //       mainAxisSpacing: 20,
              //       crossAxisSpacing: 20),
              //   itemCount: optionsList.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return GestureDetector(
              //       onTap: optionsList[index]["function"],
              //       child: Container(
              //         padding: const EdgeInsets.all(10),
              //         decoration: BoxDecoration(
              //             boxShadow: [
              //               BoxShadow(
              //                   offset: const Offset(0, 0),
              //                   color: kGrey.withOpacity(0.3),
              //                   spreadRadius: 2,
              //                   blurRadius: 2),
              //             ],
              //             color: kWhite,
              //             borderRadius: BorderRadius.circular(10)),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             CircleAvatar(
              //               radius: 20,
              //               foregroundImage:
              //                   NetworkImage(optionsList[index]["image"] ?? ""),
              //             ),
              //             const SizedBox(
              //               width: 10,
              //             ),
              //             Expanded(
              //                 child: CustomText(
              //               text: optionsList[index]["name"] ?? "",
              //               maxLines: 2,
              //             ))
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: RowText(
                  text: "Popular Universities",
                  future: Api.getUniversities(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: Api.getUniversities(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var jsonData = jsonDecode(snapshot.data.body);
                      return CustomUniCards(givenList: jsonData["data"]);
                    } else {
                      return const CustomUniCardsShimmer();
                    }
                  }),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
