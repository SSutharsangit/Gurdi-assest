import 'package:flutter/material.dart';

class Heading extends StatefulWidget {
  final String title;

  const Heading({
    super.key,
    required this.title
  });

  @override
  State<Heading> createState() => _HeadingState();
}

class _HeadingState extends State<Heading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
                        children: [
                          Container(
                            width: 5,
                            height: 30,
                            color: Color(0xFFCABDFF),
                            margin: EdgeInsets.only(right: 5),
                          ),
                          Text(
                           widget.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
    );
  }
}