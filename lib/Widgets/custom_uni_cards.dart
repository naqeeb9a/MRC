import 'package:flutter/material.dart';
import 'package:mrc/Screens/DetailPages/card_detail_page.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:mrc/utils/app_routes.dart';

import '../utils/utils.dart';

class CustomUniCards extends StatelessWidget {
  final List givenList;
  const CustomUniCards({Key? key, required this.givenList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: givenList
            .map((e) => InkWell(
                  onTap: () {
                    KRoutes.push(
                        context,
                        CardDetailPage(
                          data: e,
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 0),
                          color: kGrey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 2)
                    ], borderRadius: BorderRadius.circular(10), color: kWhite),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 160,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                  e["banner"] ??
                                      "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: e["name"] ?? "",
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: e["country"] ?? "",
                          fontsize: 10,
                          color: kGrey,
                        )
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
