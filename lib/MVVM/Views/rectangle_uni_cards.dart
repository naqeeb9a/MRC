import 'package:flutter/material.dart';
import 'package:mrc/MVVM/Views/DetailPages/card_detail_page.dart';
import 'package:mrc/Widgets/rectange_uni_cards_shimmer.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:mrc/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../View Model/universities_view_model.dart';
import '../../utils/utils.dart';

class RectangleUniCards extends StatelessWidget {
  const RectangleUniCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UniversitiesViewModel universitiesInfoModel =
        context.watch<UniversitiesViewModel>();
    if (universitiesInfoModel.loading) {
      return const RectangleUniCardsShimmer();
    }
    if (universitiesInfoModel.modelError != null) {
      return const CustomText(text: "Error ");
    }
    return Column(
      children: universitiesInfoModel.universitiesInfoModel!.data!
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
                            child: Image.network(
                              e.banner ??
                                  "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
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
                                      if (loadingProgress == null) return child;
                                      return Center(
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
                                return CircularProgressIndicator(
                                  value: loadingProgress.cumulativeBytesLoaded
                                      .toDouble(),
                                );
                              },
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
