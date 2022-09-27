import 'package:flutter/material.dart';
import 'package:mrc/Widgets/custom_slider.dart';
import 'package:mrc/Widgets/custom_text.dart';
import 'package:mrc/MVVM/Views/custom_uni_cards.dart';
import 'package:mrc/Widgets/general_app_search.dart';
import 'package:mrc/Widgets/row_text.dart';
import 'package:mrc/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: CustomText(
                  text: "Find Your \ndream degree",
                  fontsize: 25,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: GeneralAppSearchWidget(
                  enabled: false,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomSlider(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: RowText(
                  text: "Popular Universities",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomUniCards(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
