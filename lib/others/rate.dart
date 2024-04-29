import 'package:flutter/material.dart';

class Rate extends StatefulWidget {
  const Rate({super.key});

  @override
  State<Rate> createState() => _RateState();
}

class _RateState extends State<Rate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      //  mainAxisAlignment: MainAxisAlignment.center,
      //  crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                  height: MediaQuery.of(context).size.shortestSide * 0.2,
                  width: MediaQuery.of(context).size.shortestSide * 0.2,
                  child: Image.asset('images/logo2.jpg')),
            ),
          ],
        ),
        const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Rate Door-Hub App',
            style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 233, 7, 7)),
          )
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              height: MediaQuery.of(context).size.shortestSide * 0.04,
              width: MediaQuery.of(context).size.shortestSide * 0.9,
              child: const Text(
                'Your feedback will help us to make improvements',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              )),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: MediaQuery.of(context).size.shortestSide * 0.2,
            width: MediaQuery.of(context).size.shortestSide * 0.2,
            child: Padding(
              padding: const EdgeInsets.only(top: 1),
              child: SizedBox(
                child: Row(children: [
                  Container(
                    color: const Color.fromARGB(255, 223, 0, 0),
                    height: MediaQuery.of(context).size.shortestSide * 0.1,
                    width: MediaQuery.of(context).size.shortestSide * 0.1,
                  ),
                  Container(
                    color: const Color.fromARGB(255, 223, 0, 0),
                    height: MediaQuery.of(context).size.shortestSide * 0.1,
                    width: MediaQuery.of(context).size.shortestSide * 0.1,
                  ),
                  Container(
                    color: const Color.fromARGB(255, 223, 0, 0),
                    height: MediaQuery.of(context).size.shortestSide * 0.1,
                    width: MediaQuery.of(context).size.shortestSide * 0.1,
                  ),
                  Container(
                    color: const Color.fromARGB(255, 223, 0, 0),
                    height: MediaQuery.of(context).size.shortestSide * 0.1,
                    width: MediaQuery.of(context).size.shortestSide * 0.1,
                  ),
                  Container(
                    color: const Color.fromARGB(255, 223, 0, 0),
                    height: MediaQuery.of(context).size.shortestSide * 0.1,
                    width: MediaQuery.of(context).size.shortestSide * 0.1,
                  ),
                ]),
                height: MediaQuery.of(context).size.shortestSide * 0.3,
                width: MediaQuery.of(context).size.shortestSide * 0.3,
              ),
            ),
          ),
        ])
      ],
    )));
  }
}
