import 'package:flutter/material.dart';
import 'package:home_services/others/widgets/heading.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   
      body: Container(
        margin: const EdgeInsets.all(20),
        child: const Column(
          children: [
            Heading(title:'Support',),
            SizedBox(height: 20,),
            ListTile(
              leading: CircleAvatar(
                radius:30 ,
                backgroundColor: Color(0xffffd88d),
                child: Icon(Icons.chat),),
              title: Text("Live Chat"),
              subtitle: Text("chat time9am-9pm"),
            ),
            ListTile(
              leading: CircleAvatar(
                  radius:30 ,
                backgroundColor: Color(0xffcabdff),
                child: Icon(Icons.call),),
              title: Text("Phone Call"),
              subtitle: Text("chat time9am-9pm"),
            ),
            ListTile(
              leading: CircleAvatar(
                  radius:30 ,
                backgroundColor: Color(0xffb5ebcd),
                child: Icon(Icons.perm_phone_msg),),
              title: Text("WhatApp Call"),
              subtitle: Text("chat time9am-9pm"),
            )
          ],
        ),
      )
    );
  }
}