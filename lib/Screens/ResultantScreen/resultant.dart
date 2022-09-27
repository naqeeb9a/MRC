import 'package:flutter/material.dart';
import 'package:mrc/MVVM/Views/custom_uni_cards.dart';
import 'package:mrc/Widgets/general_app_search.dart';
import 'package:mrc/Widgets/row_text.dart';
import 'package:mrc/Widgets/widget.dart';

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
          children: const [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: GeneralAppSearchWidget(
                enabled: false,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: RowText(
                text: "Canada",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomUniCards(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: RowText(
                text: "USA",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomUniCards(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: RowText(
                text: "UK",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomUniCards(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
