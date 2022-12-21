import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrc/Widgets/choices.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:mrc/utils/app_routes.dart';
import 'package:mrc/utils/data.dart';
import 'package:mrc/utils/utils.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          title: "Filters",
          appBar: AppBar(),
          automaticallyImplyLeading: true,
          leading: InkWell(
            onTap: () => KRoutes.pop(context),
            child: const Icon(
              CupertinoIcons.clear,
              color: primaryColor,
            ),
          ),
          widgets: const [],
          appBarHeight: 50),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(5),
        color: kWhite,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
                buttonColor: primaryColor,
                text: "Reset Filters",
                textColor: primaryColor,
                invert: true,
                function: () {}),
            CustomButton(
                buttonColor: primaryColor,
                text: "Apply Filters",
                textColor: kWhite,
                function: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: "Country",
                fontsize: 15,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              Choices(
                filters: countryList,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: "State/Province",
                fontsize: 15,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              Choices(filters: provinceList),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: "Study Level",
                fontsize: 15,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              Choices(filters: studyLevelList),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: "Ranking",
                fontsize: 15,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              Choices(filters: rankingList),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
