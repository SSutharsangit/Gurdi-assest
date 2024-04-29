import 'package:flutter/material.dart';
import 'package:home_services/routes/splahscrenn_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController splashController = SplashScreenController();
  @override
  void initState() {
    super.initState();
    splashController.checkUserStatusAndRedirect(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:MediaQuery.of(context).size.width ,
        height:MediaQuery.of(context).size.height ,
        color: Colors.blue[50],
        child: Center(
        
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/Group.jpg'),
              Text("Door Hub", style: TextStyle( fontSize:25,fontWeight: FontWeight.bold),)

            ],
          )
          
        ),
      ),
    );
  }
}
