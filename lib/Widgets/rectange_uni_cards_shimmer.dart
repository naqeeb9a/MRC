import 'package:flutter/material.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/utils.dart';

class RectangleUniCardsShimmer extends StatelessWidget {
  const RectangleUniCardsShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [0, 1, 0, 1, 3]
          .map((e) => Shimmer.fromColors(
                highlightColor: kWhite,
                baseColor: kGrey.withOpacity(0.3),
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
                      const CustomText(
                        text: "",
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "",
                        fontsize: 11,
                        color: kblack.withOpacity(0.6),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomText(
                        text: "",
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
