import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mrc/Widgets/custom_uni_cards.dart';
import 'package:mrc/Widgets/general_app_search.dart';
import 'package:mrc/Widgets/row_text.dart';
import 'package:mrc/Widgets/widget.dart';

import '../../Api/api.dart';
import '../../Widgets/custom_uni_cards_shimmer.dart';

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: RowText(
                  text: "Canada", future: Api.searchItem(country: "canada")),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: Api.searchItem(country: "canada"),
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: RowText(
                text: "USA",
                future: Api.searchItem(country: "usa"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: Api.searchItem(country: "usa"),
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: RowText(text: "UK", future: Api.searchItem(country: "uk")),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: Api.searchItem(country: "uk"),
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
            ),
          ],
        ),
      ),
    );
  }
}
