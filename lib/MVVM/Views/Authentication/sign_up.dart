import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:mrc/Api/api.dart';
import 'package:mrc/utils/app_routes.dart';

import '../../../Widgets/widget.dart';
import '../../../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _tel = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _qualification = TextEditingController();
  final TextEditingController _workExp = TextEditingController();
  final TextEditingController _sponsorOcc = TextEditingController();
  final TextEditingController _test = TextEditingController();
  final TextEditingController _testDate = TextEditingController();
  final TextEditingController _testScore = TextEditingController();
  bool loading = false;
  bool isCheck = false;
  int fValue = 0;
  int sValue = 0;
  List countryList = [
    {"name": "Pakistan", "value": true},
    {"name": "Australia", "value": false},
    {"name": "Japan", "value": false},
  ];
  List socialAccounts = [
    {"name": "Facebook", "value": 0},
    {"name": "LinkdIn", "value": 1},
    {"name": "Google", "value": 2},
    {"name": "Gmail", "value": 3},
  ];
  List support = [
    {"name": "Parent", "value": 0},
    {"name": "Self", "value": 1},
    {"name": "Relative", "value": 2},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          title: "Registeration",
          appBar: AppBar(),
          automaticallyImplyLeading: true,
          widgets: const [],
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
                    textDataFields("Student name", Icons.person_outlined,
                        controller: _name),
                    textDataFields("Date of Birth", Icons.date_range_outlined,
                        controller: _dob, textInputType: TextInputType.number),
                    textDataFields("Address", Icons.streetview_outlined,
                        controller: _address),
                    textDataFields("Tel (Office)", Icons.numbers_outlined,
                        controller: _tel, textInputType: TextInputType.number),
                    textDataFields("Mobile #", Icons.numbers_outlined,
                        controller: _phoneNo,
                        textInputType: TextInputType.number),
                    textDataFields("Email", Icons.email_outlined,
                        controller: _email),
                    textDataFields("Qualification", Icons.work_outline,
                        controller: _qualification),
                    textDataFields(
                        "Work Experience", Icons.work_history_outlined,
                        controller: _workExp),
                    textDataFields("Profession / Occupation of Sponsor",
                        Icons.person_pin_outlined,
                        controller: _sponsorOcc),
                    textDataFields(
                        "Test (IELTS/TOFEL/SAT/GRE) -- name", Icons.pages,
                        controller: _test),
                    textDataFields("Test Date", Icons.date_range_outlined,
                        controller: _testDate,
                        textInputType: TextInputType.number),
                    textDataFields("Score in Test", Icons.score_outlined,
                        controller: _testScore),
                    radioText("Interested in"),
                    Wrap(
                      children: List.generate(countryList.length,
                          (index) => checkButton(countryList, index)),
                    ),
                    radioText("Where did you find us"),
                    Wrap(
                        children: List.generate(
                            socialAccounts.length,
                            (index) =>
                                radioButton(socialAccounts, index, false))),
                    radioText("Who is your sponsor"),
                    Wrap(
                      children: List.generate(support.length,
                          (index) => radioButton(support, index, true)),
                    ),
                    agreementBox(),
                    Align(
                        alignment: Alignment.center,
                        child: loading
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                buttonColor: primaryColor,
                                textColor: Colors.white,
                                text: "Sign Up",
                                function: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  List sendCountryList = [];
                                  for (var e in countryList) {
                                    if (e["value"] == true) {
                                      sendCountryList.add(e["name"]);
                                    }
                                  }
                                  Response res = await Api.signUp(
                                    leadName: _name.text,
                                    email: _email.text,
                                    mobile: _phoneNo.text,
                                    phone: _tel.text,
                                    dob: _dob.text,
                                    testName: _test.text,
                                    qualification: _qualification.text,
                                    workExperience: _workExp.text,
                                    testScore: _testScore.text,
                                    testDate: _testDate.text,
                                    find: socialAccounts[fValue]["name"],
                                    sponsor: support[sValue]["name"],
                                    interestedIn: sendCountryList,
                                    address: _address.text,
                                    sponsorProfession: _sponsorOcc.text,
                                  );
                                  if (res.statusCode == 200) {
                                    setState(() {
                                      loading = false;
                                    });
                                    popPage();
                                    Fluttertoast.showToast(
                                        msg: "Will notify you soon");
                                  } else {
                                    setState(() {
                                      loading = false;
                                    });
                                    Fluttertoast.showToast(msg: "not working");
                                  }
                                },
                              )),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => KRoutes.pop(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Already have an Account? ",
                            color: Colors.black.withOpacity(0.6),
                          ),
                          const CustomText(
                            text: "Sign In",
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
  }

  textDataFields(String text, IconData icon,
      {TextInputType textInputType = TextInputType.text,
      TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: CustomText(
            text: text,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FormTextField(
          controller: controller,
          keyboardtype: textInputType,
          suffixIcon: Icon(icon),
          function: (value) {
            if (value!.isEmpty) {
              return "Field cannot be empty";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  Widget checkButton(List list, int index) {
    return Row(
      children: [
        Checkbox(
            value: list[index]["value"],
            onChanged: (value) {
              setState(() {
                list[index]["value"] = !list[index]["value"];
              });
            }),
        CustomText(text: list[index]["name"]),
      ],
    );
  }

  radioText(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: CustomText(
            text: text,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget radioButton(List list, int index, bool isSponser) {
    return Row(
      children: [
        Radio(
            groupValue: isSponser ? sValue : fValue,
            value: list[index]["value"],
            onChanged: (dynamic value) {
              setState(() {
                if (isSponser == true) {
                  sValue = value;
                } else {
                  fValue = value;
                }
              });
            }),
        CustomText(text: list[index]["name"]),
      ],
    );
  }

  agreementBox() {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Checkbox(
                value: isCheck,
                onChanged: (value) {
                  setState(() {
                    isCheck = !isCheck;
                  });
                }),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "I agree with ",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  const TextSpan(
                    text: "terms ",
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  const TextSpan(
                    text: "conditions",
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  popPage() {
    KRoutes.pop(context);
  }
}
