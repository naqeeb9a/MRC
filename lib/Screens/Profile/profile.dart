import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mrc/Api/api.dart';
import 'package:mrc/MVVM/Views/Authentication/login.dart';
import 'package:mrc/Screens/Profile/applications.dart';
import 'package:mrc/Screens/Profile/edit_profile.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:mrc/utils/app_routes.dart';
import 'package:mrc/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List settings = [
      {
        "icon": const Icon(
          CupertinoIcons.person,
          color: primaryColor,
        ),
        "setting": "Edit Profile",
        "function": () {
          if (userData == "guest") {
            Fluttertoast.showToast(msg: "Login to Access");
          } else {
            KRoutes.push(context, const EditProfile());
          }
        }
      },
      {
        "icon": const Icon(
          CupertinoIcons.calendar,
          color: primaryColor,
        ),
        "setting": "My Applications",
        "function": () {
          if (userData == "guest") {
            Fluttertoast.showToast(msg: "Login to Access");
          } else {
            KRoutes.push(context, const MyApplications());
          }
        }
      },
      // {
      //   "icon": const Icon(
      //     CupertinoIcons.heart,
      //     color: primaryColor,
      //   ),
      //   "setting": "Favourites",
      //   "function": () {
      //     if (userData == "guest") {
      //       Fluttertoast.showToast(msg: "Login to Access");
      //     } else {
      //       KRoutes.push(
      //           context,
      //           DetailPage(
      //             appBarText: 'Favourities',
      //             future: Api.getUniversities(),
      //           ));
      //     }
      //   }
      // },
      {
        "icon": const Icon(
          CupertinoIcons.lock,
          color: primaryColor,
        ),
        "setting": "Privacy",
        "function": null
      },
      {
        "icon": const Icon(
          CupertinoIcons.paperclip,
          color: primaryColor,
        ),
        "setting": "Terms and Conditions",
        "function": null
      },
      {
        "icon": Icon(
          userData == "guest" ? Icons.login_outlined : Icons.logout_outlined,
          color: primaryColor,
        ),
        "setting": userData == "guest" ? "Login" : "Logout",
        "function": () async {
          SharedPreferences user = await SharedPreferences.getInstance();
          user.remove("user");

          KRoutes.pushAndRemoveUntil(globalContext, const Login());
        }
      },
    ];
    return Scaffold(
      appBar: BaseAppBar(
          title: "Profile",
          appBar: AppBar(),
          widgets: const [],
          appBarHeight: 50),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 0),
                    spreadRadius: 5,
                    blurRadius: 5,
                    color: kGrey.withOpacity(0.3))
              ], color: kWhite, borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  Column(
                    children: [
                      const Hero(
                        tag: "profile",
                        child: CircleAvatar(
                          radius: 30,
                          foregroundImage: NetworkImage(
                              "https://theundercoverrecruiter.com/wp-content/uploads/2018/09/ian-dooley-281846-unsplash-1-e1537195966706.jpg"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: userData == "guest"
                            ? "Guest"
                            : userData["data"]["details"]["lead_name"],
                        fontWeight: FontWeight.bold,
                        fontsize: 20,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      CustomText(
                        text: userData == "guest"
                            ? "guest@mrc.com"
                            : userData["data"]["details"]["email"],
                        fontsize: 15,
                        color: kblack.withOpacity(0.6),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: kblack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(text: "Current Progress"),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      userData == "guest"
                          ? Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: LinearProgressIndicator(
                                      value: 0.6,
                                      color: kGrey,
                                      backgroundColor: kGrey.withOpacity(0.2),
                                      minHeight: 10,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const CustomText(text: "60%")
                              ],
                            )
                          : FutureBuilder(
                              future: Api.getProgress(
                                  userData["data"]["details"]["id"].toString()),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.data.statusCode == 200) {
                                    var updatedData =
                                        jsonDecode(snapshot.data.body);
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: LinearProgressIndicator(
                                                  value: updatedData["data"]
                                                          ["status"] /
                                                      10,
                                                  color: primaryColor,
                                                  backgroundColor:
                                                      kGrey.withOpacity(0.2),
                                                  minHeight: 10,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            CustomText(
                                                text:
                                                    "${(updatedData["data"]["status"] * 10).toString()} %")
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const CustomText(text: "   •   "),
                                            CustomText(
                                                text: updatedData["data"]
                                                    ["status_name"]),
                                          ],
                                        ),
                                      ],
                                    );
                                  } else {
                                    return const CustomText(
                                        text: "Invalid response");
                                  }
                                } else {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Shimmer.fromColors(
                                              highlightColor: kWhite,
                                              baseColor: kGrey.withOpacity(0.2),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: kWhite,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                height: 15,
                                                width: double.infinity,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Shimmer.fromColors(
                                          highlightColor: kWhite,
                                          baseColor: kGrey.withOpacity(0.2),
                                          child: Container(
                                            color: kWhite,
                                            height: 15,
                                            width: 100,
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                }
                              },
                            ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kblack),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "member",
                          style: TextStyle(color: kWhite),
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: settings.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: settings[index]["icon"],
                  title: CustomText(text: settings[index]["setting"]),
                  onTap: settings[index]["function"],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
