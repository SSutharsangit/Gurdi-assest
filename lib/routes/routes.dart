import 'package:flutter/material.dart';
import 'package:home_services/others/auth/login/presenters/login_screen.dart';
import 'package:home_services/others/auth/register/presenters/register_screen.dart';
import 'package:home_services/others/onboardings/one.dart';
import 'package:home_services/others/pages/main/layout.dart';
import 'package:home_services/others/pages/sub/allcategories/allcategories.dart';
import 'package:home_services/others/pages/sub/categories/booking/book.dart';
import 'package:home_services/others/pages/sub/categories/providers_services/Serive_presenter.dart';
import 'package:home_services/others/pages/sub/categories/appliance.dart';
import 'package:home_services/others/pages/sub/categories/beauty.dart';
import 'package:home_services/others/pages/sub/categories/cleaning.dart';
import 'package:home_services/others/pages/sub/categories/electronics.dart';
import 'package:home_services/others/pages/sub/categories/mens_salon.dart';
import 'package:home_services/others/pages/sub/categories/painting.dart';
import 'package:home_services/others/pages/sub/categories/plumbing.dart';
import 'package:home_services/others/pages/sub/categories/shifting.dart';
import 'package:home_services/others/pages/sub/categories/providers_services/service_detail.dart';
import 'package:home_services/routes/splash.dart';


final routes={
'/': (BuildContext context) => const SplashScreen(),
"/onboardingOne":(BuildContext context)=>const OnboardingOne(),
  '/homePage': (BuildContext context) =>  const Layout(),
  '/home': (BuildContext context) =>  const Layout(),
  '/allcategories': (BuildContext context) =>  const Allcategories(),
   '/shifting': (BuildContext context) =>  const Shifting(),
   '/Appliance': (BuildContext context) =>  const Appliance(),
   '/Beauty': (BuildContext context) =>  const Beauty(),
   '/Cleaing': (BuildContext context) =>  const Cleaing(),
   '/Electronics': (BuildContext context) =>  const Electronics(),
   '/MenSalaon': (BuildContext context) =>  const MenSalaon(),
   '/Painting': (BuildContext context) =>  const Painting(),
   '/Plumbing': (BuildContext context) =>  const Plumbing(),
   '/services': (BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    return Services(header: arguments);
  },
    '/Servicedetailpage': (BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    return Servicedetailpage(header: arguments);
  },
    "/LoginScreen":(BuildContext context) =>  const LoginScreen(),
      "/SignUpPage":(BuildContext context) =>  const SignUpPage(),
     "/BookingService": (BuildContext context) {
  final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
  return BookingService(header: arguments ?? {});
},

   
};