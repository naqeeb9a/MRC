import 'package:flutter/material.dart';
import 'package:mrc/MVVM/View%20Model/universities_view_model.dart';
import 'package:mrc/Widgets/general_app_search.dart';
import 'package:mrc/Widgets/row_text.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:provider/provider.dart';

import '../../MVVM/Views/custom_uni_cards.dart';

class ResultantScreen extends StatelessWidget {
  final String appBarTitle;
  final List givenList;
  final bool backButton;
  const ResultantScreen(
      {Key? key,
      required this.appBarTitle,
      required this.givenList,
      this.backButton = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          title: appBarTitle,
          appBar: AppBar(),
          automaticallyImplyLeading: backButton ? true : backButton,
          widgets: const [],
          appBarHeight: 50),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: RowText(
                text: "Canada",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomUniCards(
              data: context
                  .read<UniversitiesViewModel>()
                  .universitiesInfoModel!
                  .data!,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: RowText(
                text: "USA",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomUniCards(
              data: context
                  .read<UniversitiesViewModel>()
                  .universitiesInfoModel!
                  .data!,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: RowText(
                text: "UK",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomUniCards(
              data: context
                  .read<UniversitiesViewModel>()
                  .universitiesInfoModel!
                  .data!,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
