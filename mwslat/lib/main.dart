import 'package:flutter/material.dart';
import 'package:mwslat/models/shared.dart';
import 'package:mwslat/screens/homepage.dart';
import 'package:mwslat/screens/login.dart';



void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

String value = '';

@override
void initState() {
  checkData();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: value.isEmpty ? Login() : HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
  checkData() async {
    value = await Shared.getData('email');
    setState(() {
      
    });
  }
}


// App Design URL => https://dribbble.com/shots/14420230-Public-Transport-App-Design/attachments/6098108?mode=media


// Assignment => 
      // 1- make camera choices
      // 2- recode google map
      // 3- read section 25 page 16 in learn google flutter fast