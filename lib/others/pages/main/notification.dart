import 'package:flutter/material.dart';
import 'package:home_services/others/widgets/heading.dart';

class Alert extends StatelessWidget {
  const Alert({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
          title: Heading(title: "Notification"),
      ),
      body: const Center(
        child: Text("Notification"),
      ),
    );
  }
}