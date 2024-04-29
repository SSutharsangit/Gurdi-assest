import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:home_services/others/auth/login/presenters/login_model.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  late SharedPreferences prefs;
 
  Future<void> login(String username, String password, String? selectedOption, context) async {
    const url = 'https://backendserve-production.up.railway.app/api/login'; 
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'user_name': username,
      'password': password,
      'role': selectedOption,
    });

    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
   final userData = jsonDecode(response.body)['success! user'];
   print(userData);
final user = User.fromJson(userData);
savingUserDataLocal(user, context);
      
      } else if (response.statusCode == 401) {
        // Login failed due to incorrect credentials
        print('Login failed: ${response.statusCode}');
        // Show error message or handle login failure accordingly
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
          content: Text('Invalid Credentials'),
          ),
        );
      } else {
        // Other error occurred
        // Show error message or handle other error accordingly
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed: ${response.statusCode}'),
          ),
        );
      }
    } catch (e) {
      // Exception occurred
      print('Exception occurred: $e');
      // Show error message or handle exception accordingly
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Exception occurred: $e'),
        ),
      );
    }
  }
  
  
  void savingUserDataLocal(User data, context) async {
    String jsonString = jsonEncode(data.toJson());
    print(data);
    prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', jsonString);
    print("hi");
    Navigator.of(context).pushReplacementNamed('/home');
  }
}
