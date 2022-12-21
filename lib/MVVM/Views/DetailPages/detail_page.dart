import 'package:flutter/material.dart';
import 'package:mrc/MVVM/View%20Model/universities_view_model.dart';
import 'package:mrc/MVVM/Views/rectangle_uni_cards.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/widget.dart';

class DetailPage extends StatelessWidget {
  final String appBarText;
  final bool backIcon;
  const DetailPage({
    Key? key,
    required this.appBarText,
    this.backIcon = true,
  }) : super(key: key);

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
            child: RectangleUniCards(
              data: context
                  .read<UniversitiesViewModel>()
                  .universitiesInfoModel!
                  .data!,
            )),
      ),
    );
  }
}
