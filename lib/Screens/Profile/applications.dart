import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mrc/Api/api.dart';
import 'package:mrc/Widgets/widget.dart';

import '../../utils/utils.dart';

class MyApplications extends StatelessWidget {
  const MyApplications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          title: "My Applications",
          appBar: AppBar(),
          automaticallyImplyLeading: true,
          widgets: const [],
          appBarHeight: 50),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: FutureBuilder(
            future: Api.getUniApp(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var jsonData = jsonDecode(snapshot.data.body);
                var updatedData = jsonData["data"];
                return ListView.builder(
                  itemCount: updatedData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: CustomText(
                              text: updatedData[index]["university"],
                              fontWeight: FontWeight.bold,
                              fontsize: 18,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                            text:
                                "Application Status : ${updatedData[index]["application_status"]}"),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomText(text: "Offer Letter :"),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: NetworkImage(
                                  "https://cdn.jotfor.ms/form-templates/screenshots/pdf/425x575_20203522551908049/offer-letter.png",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                                buttonColor: primaryColor,
                                text: "Download",
                                textColor: primaryColor,
                                invert: true,
                                function: () {}),
                            CustomButton(
                                buttonColor: primaryColor,
                                text: "View",
                                textColor: kWhite,
                                function: () {}),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: kblack,
                        ),
                      ],
                    );
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
