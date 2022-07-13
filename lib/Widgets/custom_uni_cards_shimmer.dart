import 'package:flutter/material.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/utils.dart';

class CustomUniCardsShimmer extends StatelessWidget {
  const CustomUniCardsShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [0, 1, 2, 3]
            .map((e) => Shimmer.fromColors(
                  highlightColor: kWhite,
                  baseColor: kGrey.withOpacity(0.2),
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
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomText(
                          text: "          ",
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomText(
                          text: "         ",
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
