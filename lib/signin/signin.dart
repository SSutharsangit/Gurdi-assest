import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    double minSide = MediaQuery.of(context).size.shortestSide * 0.1;
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Container(
                        height: minSide * 3,
                        width: minSide * 3,
                        child: Image.asset('images/logo2.jpg')),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'Door Hub',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none),
                    ),
                  ),
                   const Padding(
                    padding: EdgeInsets.only(right: 250),
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.black, fontSize: 33,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                    ),
                  ),
                   const Padding(
                    padding: EdgeInsets.only(right: 170,top: 10),
                    
                    child: Text(
                      'Phone number',
                      style: TextStyle(color: Colors.black, fontSize: 33,
                      decoration: TextDecoration.none),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      )),
    );
  }
}
