import 'package:flutter/material.dart';
import 'package:mrc/MVVM/Views/DetailPages/detail_page.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:mrc/utils/app_routes.dart';
import 'package:mrc/utils/utils.dart';

class RowText extends StatelessWidget {
  final String text;
  const RowText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text,
          fontWeight: FontWeight.bold,
          fontsize: 14,
        ),
        GestureDetector(
          onTap: () => KRoutes.push(
              context,
              DetailPage(
                appBarText: text,
              )),
          child: const CustomText(
            text: "View All",
            color: primaryColor,
          ),
        )
      ],
    );
  }
}
