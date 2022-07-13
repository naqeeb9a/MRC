import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mrc/Widgets/rectange_uni_cards_shimmer.dart';
import 'package:mrc/Widgets/rectangle_uni_cards.dart';

import '../../Widgets/widget.dart';

class DetailPage extends StatelessWidget {
  final String appBarText;
  final bool backIcon;
  final dynamic future;
  const DetailPage(
      {Key? key, required this.appBarText, this.backIcon = true, this.future})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          title: appBarText,
          automaticallyImplyLeading: backIcon,
          appBar: AppBar(),
          widgets: const [],
          appBarHeight: 50),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FutureBuilder(
                future: future,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    var jsonData = jsonDecode(snapshot.data.body);
                    return RectangleUniCards(
                      list: jsonData["data"],
                    );
                  } else {
                    return const RectangleUniCardsShimmer();
                  }
                })),
      ),
    );
  }
}
