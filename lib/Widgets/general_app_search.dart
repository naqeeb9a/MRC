import 'package:flutter/material.dart';
import 'package:mrc/Screens/Search/filters_screen.dart';
import 'package:mrc/Screens/Search/search_screen.dart';
import 'package:mrc/Widgets/custom_search.dart';
import 'package:mrc/utils/app_routes.dart';
import 'package:mrc/utils/utils.dart';

class GeneralAppSearchWidget extends StatelessWidget {
  final bool enabled;
  final TextEditingController? controller;
  final dynamic function;
  const GeneralAppSearchWidget(
      {Key? key, this.enabled = true, this.controller, this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => KRoutes.push(context, const SearchScreen()),
            child: CustomSearch(
                enabled: enabled, controller: controller, function: function),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () => !enabled
              ? KRoutes.push(context, const SearchScreen())
              : KRoutes.push(context, const FilterScreen()),
          child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.filter_alt_outlined,
                color: kWhite,
              )),
        )
      ],
    );
  }
}
