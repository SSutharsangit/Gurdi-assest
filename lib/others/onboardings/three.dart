// import 'package:flutter/material.dart';
// import 'package:home_services/signin/signin.dart';

// class OnboardingThree extends StatefulWidget {
//   const OnboardingThree({super.key});

//   @override
//   State<OnboardingThree> createState() => _OnboardingThreeState();
// }

// class _OnboardingThreeState extends State<OnboardingThree> {
//   @override
//   Widget build(BuildContext context) {
//     double minSide = MediaQuery.of(context).size.shortestSide * 0.1;

//     return Container(
//       color: Colors.white,
//       child: SafeArea(
//         child: Stack(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     Positioned(
//                       top: 0,
//                       left: 0,
//                       child: SizedBox(
//                         width: minSide,
//                         height: minSide,
//                         child: Container(
//                           color: Colors.white,
//                           child: Image.asset(
//                             'images/Ellipse.jpg',
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(
//                           top: minSide * 0.35, right: minSide * 0.5),
             
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 120),
//                   child: Stack(
//                     children: [
//                       Container(
//                         // color: Colors.yellow,
//                         width: minSide * 7,
//                         height: minSide * 10,
//                         child: Center(
//                           child: Container(
//                             // color: Colors.red[700],
//                             width: minSide * 5.5,
//                             height: minSide * 8.5,
//                             child: Center(
//                               child: ClipRRect(
//                                 borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(70.0),
//                                   topRight: Radius.circular(70.0),
//                                   bottomLeft: Radius.circular(70.0),
//                                   bottomRight: Radius.circular(70.0),
//                                 ),
//                                 child: Image.asset(
//                                   'images/image_boy.jpg',
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             Positioned(
//               top: minSide * 12.5,
//               left: minSide * 4,
//               child: const Row(
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         '.',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromARGB(255, 235, 210, 249),
//                             decoration: TextDecoration.none,
//                             fontSize: 60),
//                       )
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         '.',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromARGB(255, 235, 210, 249),
//                             decoration: TextDecoration.none,
//                             fontSize: 60),
//                       )
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         '.',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             decoration: TextDecoration.none,
//                             color: Colors.deepPurple,
//                             fontSize: 60),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               bottom: minSide * 5.5,
//               left: minSide * 1,
//               child: const Row(
//                 children: [
//                   Text(
//                     "Professional home \ncleaning",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                         fontSize: 35,
//                         decoration: TextDecoration.none),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               bottom: minSide * 4.0,
//               left: minSide * 1,
//               child: const Row(
//                 children: [
//                   Text(
//                     "Lorem ipsum is a placeholder text commonly \nused to demonstrate the visual.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontWeight: FontWeight.w200,
//                         color: Colors.black,
//                         fontSize: 15,
//                         decoration: TextDecoration.none),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               bottom: minSide * 1.5,
//               left: minSide * 3,
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const Signin(),
//                     ),
//                   );
//                 },
//               child: Container(
//                 width: minSide * 5,
//                 height: minSide * 1.5,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
                  
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Get Started',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       fontSize: 35,
//                       decoration: TextDecoration.none,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             ),
//             // Add more widgets to the Stack if needed
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:home_services/others/auth/login/presenters/login_screen.dart';
import 'package:home_services/others/pages/main/layout.dart';


class OnboardingThree extends StatefulWidget {
  const OnboardingThree({super.key});

  @override
  State<OnboardingThree> createState() => _OnboardingThree();
}

class _OnboardingThree extends State<OnboardingThree> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('images/image_boy.jpg'),
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[400])),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[400])),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF6759FF))),
                ],
              ),
              const Column(
                children: [
                  Text(
                    "Professional home cleaning",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 35,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    "Lorem ipsum is a placeholder text commonly \nused to demonstrate the visual.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF6759FF),
                    ),
                    child:const Center(child: Text("Get Started",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

