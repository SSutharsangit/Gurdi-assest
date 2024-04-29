import 'dart:convert';
import 'package:home_services/others/auth/login/presenters/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataSources {
  late SharedPreferences prefs;

 Future<Map<String,dynamic>?> getUserData() async {
    prefs = await SharedPreferences.getInstance();
    String? jsonStringFromPrefs = prefs.getString('userData');
    if (jsonStringFromPrefs != null) {
      Map<String, dynamic> json = jsonDecode(jsonStringFromPrefs);
      return json;
    } else {
      print('No user data found in SharedPreferences');
      return null;
    }
  }



  // Future<bool> isUserLoggedIn() async {
  //   User? user = await getUserData();
  //   if (user != null) {
  //     if (user.name != null) {
  //       return true;
  //     }
  //   }

  //   return false;
  // }

  // Future<String?> getToken() async {
  //   User? user = await getUserData();
  //   if (user != null) {
  //     return user.name;
  //   }
  //   return null;
  // }
}
