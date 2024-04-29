import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class RegisterController{
Future<void> signup(
  String name,
  String email,
  String mobile,
  String username,
  String password,
  String? selectedOption,
   context,
) async {
  const url = 'https://backendserve-production.up.railway.app/api/customers'; // Assuming the registration endpoint is different
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'name': name,
    'email': email,
    'mobile': mobile,
    'user_name': username,
    'password': password,
    'role': selectedOption,
  });

  try {
    final response = await http.post(Uri.parse(url), headers: headers, body: body);
    if (response.statusCode == 200) {
      // Registration successful
    Navigator.of(context)
            .pushNamedAndRemoveUntil('/LoginScreen', (route) => false);
    } else if (response.statusCode == 401) {
      // Registration failed due to invalid data or existing account
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration failed: Invalid data or existing account'),
        ),
      );
    } else {
      // Other error occurred
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed: ${response.statusCode}'),
        ),
      );
    }
  } catch (e) {

    // Exception occurred
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Exception occurred'),
      ),
    );
  }
}
}