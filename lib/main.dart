import 'package:flutter/material.dart';
import 'package:home_services/others/auth/login/presenters/login_screen.dart';
import 'package:home_services/others/onboardings/one.dart';
import 'package:home_services/others/pages/main/layout.dart';
import 'package:home_services/others/pages/sub/categories/providers_services/service_detail.dart';


import 'package:home_services/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Share Demo',
      initialRoute: '/',
      routes:routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Layout(),
      
     
    );
  }
}

