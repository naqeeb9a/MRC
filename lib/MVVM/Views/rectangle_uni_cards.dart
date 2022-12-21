import 'package:flutter/material.dart';
import 'package:mrc/MVVM/Model/universities_model.dart';
import 'package:mrc/MVVM/Views/DetailPages/card_detail_page.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:mrc/utils/app_routes.dart';

import '../../utils/utils.dart';

class RectangleUniCards extends StatelessWidget {
  final List<Datum> data;
  const RectangleUniCards({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data
          .map((e) => InkWell(
                onTap: () {
                  KRoutes.push(
                      context,
                      CardDetailPage(
                        universitiesInfo: e,
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 160,
                              width: double.infinity,
                              child: Image.network(
                                e.banner ?? "",
                                errorBuilder: (context, error, stackTrace) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "http://www.sacredheart.edu/media/shu-media/site-assets/images/Sacred-Heart-OG.png",
                                      height: 160,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return SizedBox(
                                          height: 160,
                                          width: double.infinity,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                                fit: BoxFit.cover,
                                height: 160,
                                width: double.infinity,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return SizedBox(
                                    height: 160,
                                    width: double.infinity,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    ),
                                  );
                                },
                              ),
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
                        text: e.name ?? "",
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: e.country.toString(),
                        fontsize: 11,
                        color: kblack.withOpacity(0.6),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: e.address ?? "",
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
