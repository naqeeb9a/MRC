import 'dart:convert';

import 'package:mrc/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Functionality {
  static checkLoginStatus() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    String? userInfo = user.getString("user");

    if (userInfo != null) {
      if (userInfo == "guest") {
        userData = userInfo;
      } else {
        userData = jsonDecode(userInfo);
      }

      return true;
    }
    return false;
  }
}
