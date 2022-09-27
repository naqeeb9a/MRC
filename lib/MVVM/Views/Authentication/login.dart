import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:mrc/Api/api.dart';
import 'package:mrc/Api/functionality.dart';
import 'package:mrc/MVVM/Views/Authentication/sign_up.dart';

import 'package:flutter/material.dart';
import 'package:mrc/Screens/IntroScreens/intro.dart';
import 'package:mrc/Screens/TabBar/tab_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Widgets/widget.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/utils.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool loading = false;
  bool isLoading = true;
  @override
  void initState() {
    checkOnBoardingScreen();
    checkStatus();
    super.initState();
  }

  checkOnBoardingScreen() async {
    SharedPreferences openedApp = await SharedPreferences.getInstance();
    if (openedApp.getString("openedApp") == null) {
      pushAnother();
    }
  }

  pushAnother() {
    KRoutes.push(context, const OnBoardingPage());
  }

  checkStatus() async {
    bool res = await Functionality.checkLoginStatus();
    if (res == false) {
      setState(() {
        isLoading = false;
      });
    } else {
      pushPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: BaseAppBar(
                title: "Login",
                appBar: AppBar(),
                widgets: [
                  GestureDetector(
                    onTap: () async {
                      SharedPreferences user =
                          await SharedPreferences.getInstance();
                      user.setString("user", "guest");
                      userData = "guest";
                      pushPage();
                    },
                    child: Row(
                      children: const [
                        CircleAvatar(
                            backgroundColor: primaryColor,
                            child: CustomText(
                              text: "Skip",
                              fontsize: 10,
                              color: kWhite,
                            )),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.double_arrow,
                    color: kblack,
                  )
                ],
                appBarHeight: 50),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Image.asset(
                              "assets/logo.png",
                              width: 200,
                              height: 200,
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: CustomText(text: "Email"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormTextField(
                              controller: _email,
                              suffixIcon: const Icon(Icons.email_outlined),
                              keyboardtype: TextInputType.emailAddress,
                              function: (value) {
                                if (value!.isEmpty) {
                                  return "Field can't be empty";
                                } else {
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: CustomText(text: "Password"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormTextField(
                            controller: _password,
                            isPass: true,
                            suffixIcon: const Icon(Icons.visibility_outlined),
                            function: (value) {
                              if (value!.isEmpty) {
                                return "Field can't be empty";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: loading
                                  ? const CircularProgressIndicator()
                                  : CustomButton(
                                      buttonColor: primaryColor,
                                      textColor: Colors.white,
                                      text: "login",
                                      function: () async {
                                        if (_email.text.isEmpty ||
                                            _password.text.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg: "Fill all fields");
                                        } else {
                                          setState(() {
                                            loading = true;
                                          });
                                          Response res = await Api.login(
                                              email: _email.text,
                                              password: _password.text);
                                          if (res.statusCode == 200) {
                                            setState(() {
                                              loading = false;
                                            });
                                            SharedPreferences user =
                                                await SharedPreferences
                                                    .getInstance();
                                            user.setString("user", res.body);
                                            userData = jsonDecode(res.body);
                                            pushPage();
                                          } else {
                                            setState(() {
                                              loading = false;
                                            });
                                            Fluttertoast.showToast(
                                                msg:
                                                    "User name or password invalid");
                                          }
                                        }
                                      },
                                    )),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () =>
                                KRoutes.push(context, const SignUpScreen()),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: "Don't have an Account? ",
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                const CustomText(
                                  text: "Sign Up",
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
    // }
  }

  popPage() {
    KRoutes.pop(context);
  }

  pushPage() {
    KRoutes.pushAndRemoveUntil(context, const CustomTabBar());
  }
}
