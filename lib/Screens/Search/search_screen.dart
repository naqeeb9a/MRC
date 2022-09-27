import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:mrc/Api/api.dart';
import 'package:mrc/Widgets/general_app_search.dart';
import 'package:mrc/MVVM/Views/rectangle_uni_cards.dart';
import 'package:mrc/Widgets/widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List futureData = [];
  getSearchResult() async {
    setState(() {
      loading = true;
    });
    Response res = await Api.searchItem(value: _controller.text);
    if (res.statusCode == 200) {
      setState(() {
        loading = false;
      });
      var jsonData = jsonDecode(res.body);
      futureData = jsonData["data"];
    } else {
      setState(() {
        loading = false;
      });
      Fluttertoast.showToast(msg: "Try again");
    }
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Search",
        appBar: AppBar(),
        widgets: const [],
        appBarHeight: 50,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GeneralAppSearchWidget(
                controller: _controller, function: getSearchResult),
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
          Expanded(
            child: _controller.text.isEmpty
                ? const Center(
                    child: CustomText(text: "Search for something"),
                  )
                : loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : futureData.isEmpty
                        ? const Center(
                            child: CustomText(text: "No results found"),
                          )
                        : const SingleChildScrollView(
                            child: RectangleUniCards(),
                          ),
          ),
        ],
      ),
    );
  }
}
