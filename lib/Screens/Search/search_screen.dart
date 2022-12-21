import 'package:flutter/material.dart';
import 'package:mrc/MVVM/View%20Model/Searched%20University%20View/searched_university_view_model.dart';
import 'package:mrc/Widgets/general_app_search.dart';
import 'package:mrc/MVVM/Views/rectangle_uni_cards.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:mrc/utils/utils.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SearchedUniversitiesViewModel searchedUniversitiesViewModel =
        context.watch<SearchedUniversitiesViewModel>();
    return Scaffold(
        appBar: BaseAppBar(
          title: "Search",
          appBar: AppBar(),
          widgets: const [],
          appBarHeight: 50,
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GeneralAppSearchWidget(
                  controller: _controller,
                  function: () async {
                    searchedUniversitiesViewModel.setModelError(null);
                    await searchedUniversitiesViewModel
                        .getSearchedUniversitites(name: _controller.text);
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            _controller.text.isEmpty
                ? const SizedBox()
                : const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: CustomText(text: "Your filter result"),
                  ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: searchedView(searchedUniversitiesViewModel)),
          ],
        ));
  }

  Widget searchedView(
      SearchedUniversitiesViewModel searchedUniversitiesViewModel) {
    if (searchedUniversitiesViewModel.universitiesInfoModel == null) {
      return const Center(
        child: CustomText(text: "Search anything"),
      );
    }
    if (searchedUniversitiesViewModel.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (searchedUniversitiesViewModel.modelError != null) {
      return Center(
        child: CustomText(
            text: searchedUniversitiesViewModel.modelError!.errorResponse
                .toString()),
      );
    }
    if (searchedUniversitiesViewModel.universitiesInfoModel!.data!.isEmpty) {
      return const Center(
        child: CustomText(text: "No results found"),
      );
    }

    return SingleChildScrollView(
      child: RectangleUniCards(
        data: searchedUniversitiesViewModel.universitiesInfoModel!.data!,
      ),
    );
  }

  @override
  void dispose() {
    searchFilter = {"country": "", "state": "", "ranking": ""};
    super.dispose();
  }
}
