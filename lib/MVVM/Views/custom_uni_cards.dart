import 'package:flutter/material.dart';
import 'package:mrc/MVVM/Views/DetailPages/card_detail_page.dart';
import 'package:mrc/Widgets/custom_uni_cards_shimmer.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:mrc/utils/app_routes.dart';
import 'package:provider/provider.dart';
import '../../utils/utils.dart';
import '../View Model/universities_view_model.dart';

class CustomUniCards extends StatelessWidget {
  const CustomUniCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UniversitiesViewModel universitiesInfoModel =
        context.watch<UniversitiesViewModel>();
    if (universitiesInfoModel.loading) {
      return const CustomUniCardsShimmer();
    }
    if (universitiesInfoModel.modelError != null) {
      return const CustomText(text: "Error ");
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
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
                                  width: 250,
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
                            width: 250,
                            loadingBuilder: (context, child, loadingProgress) {
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
                        // Container(
                        //   height: 160,
                        //   width: 250,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     image: DecorationImage(
                        //         image: NetworkImage(
                        //           e.banner ??
                        //               "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                        //         ),
                        //         onError: (exception, stackTrace) {},
                        //         fit: BoxFit.cover),
                        //   ),
                        // ),
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
