import 'package:flutter/material.dart';
import 'package:mwslat/screens/homepage.dart';



void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


// App Design URL => https://dribbble.com/shots/14420230-Public-Transport-App-Design/attachments/6098108?mode=media