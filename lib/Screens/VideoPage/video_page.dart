import 'package:flutter/material.dart';
import 'package:mrc/Widgets/choices.dart';
import 'package:mrc/Widgets/custom_search.dart';
import 'package:mrc/MVVM/Views/custom_uni_cards.dart';
import 'package:mrc/Widgets/row_text.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:mrc/utils/data.dart';

class VideoPage extends StatelessWidget {
  final String appBarTitle;
  final List givenList;
  const VideoPage(
      {Key? key, required this.appBarTitle, required this.givenList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: appBarTitle,
        appBar: AppBar(),
        widgets: const [],
        appBarHeight: 50,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: CustomSearch(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: CustomText(text: "Categories"),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Choices(filters: studyLevelList),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: RowText(text: "Listening Courses"),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomUniCards(),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: RowText(text: "Reading Courses"),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomUniCards(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
