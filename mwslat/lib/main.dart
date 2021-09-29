import 'package:flutter/material.dart';
import 'package:mwslat/screens/login.dart';



void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}


// App Design URL => https://dribbble.com/shots/14420230-Public-Transport-App-Design/attachments/6098108?mode=media