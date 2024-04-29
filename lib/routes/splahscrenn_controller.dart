// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';


class SplashScreenController {

  Future<void> checkUserStatusAndRedirect(BuildContext context) async {

    Future.delayed(const Duration(seconds: 2)).then((val) {
      Navigator.pushReplacementNamed(context, '/onboardingOne');
    });

  }
}
