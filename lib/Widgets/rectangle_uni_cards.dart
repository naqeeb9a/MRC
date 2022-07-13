import 'package:flutter/material.dart';
import 'package:mrc/Screens/DetailPages/card_detail_page.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:mrc/utils/app_routes.dart';

import '../utils/utils.dart';

class RectangleUniCards extends StatelessWidget {
  final List list;
  const RectangleUniCards({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: list
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
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0),
                        color: kGrey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2)
                  ], borderRadius: BorderRadius.circular(10), color: kWhite),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 180,
                            width: double.infinity,
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
                          Positioned(
                            top: 12,
                            right: 12,
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: kWhite,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Icon(
                                  Icons.favorite_outline,
                                  color: primaryColor,
                                )),
                          )
                        ],
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
                        fontsize: 11,
                        color: kblack.withOpacity(0.6),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: e["address"] ?? "",
                        fontsize: 10,
                        color: kGrey,
                      ),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
