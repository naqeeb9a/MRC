import 'package:flutter/material.dart';
import 'package:mrc/MVVM/View%20Model/universities_view_model.dart';
import 'package:mrc/Widgets/custom_slider.dart';
import 'package:mrc/Widgets/custom_text.dart';
import 'package:mrc/MVVM/Views/custom_uni_cards.dart';
import 'package:mrc/Widgets/general_app_search.dart';
import 'package:mrc/Widgets/row_text.dart';
import 'package:mrc/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../Widgets/custom_uni_cards_shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: CustomText(
                  text: "Find Your \ndream degree",
                  fontsize: 25,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: GeneralAppSearchWidget(
                  enabled: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomSlider(),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: RowText(
                  text: "Popular Universities",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              uniCardsView(context),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget uniCardsView(BuildContext context) {
    UniversitiesViewModel universitiesInfoModel =
        context.watch<UniversitiesViewModel>();
    if (universitiesInfoModel.loading) {
      return const CustomUniCardsShimmer();
    }
    if (universitiesInfoModel.modelError != null) {
      return const CustomText(text: "Error ");
    }
    return CustomUniCards(
      data: universitiesInfoModel.universitiesInfoModel!.data!,
    );
  }
}
