import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mrc/MVVM/Views/Authentication/login.dart';
import 'package:mrc/Screens/Profile/applications.dart';
import 'package:mrc/Screens/Profile/edit_profile.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:mrc/utils/app_routes.dart';
import 'package:mrc/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../MVVM/Views/DetailPages/detail_page.dart';

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
      {
        "icon": const Icon(
          CupertinoIcons.heart,
          color: primaryColor,
        ),
        "setting": "Favourites",
        "function": () {
          if (userData == "guest") {
            Fluttertoast.showToast(msg: "Login to Access");
          } else {
            KRoutes.push(
                context,
                const DetailPage(
                  appBarText: 'Favourities',
                ));
          }
        }
      },
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
                            : userData["data"]["name"],
                        fontWeight: FontWeight.bold,
                        fontsize: 20,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      CustomText(
                        text: userData == "guest"
                            ? "guest@mrc.com"
                            : userData["data"]["email"],
                        fontsize: 15,
                        color: kblack.withOpacity(0.6),
                      ),
                      const SizedBox(
                        height: 10,
                        width: double.infinity,
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
