import 'package:flutter/material.dart';
import 'package:mwslat/models/mainmodel.dart';
import 'package:mwslat/models/shared.dart';
import 'package:mwslat/screens/homepage.dart';
import 'package:mwslat/screens/login.dart';
import 'package:scoped_model/scoped_model.dart';



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
    return ScopedModel(
      model: MainModel(),
      child: MaterialApp(
        home: value.isEmpty ? Login() : HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
  checkData() async {
    value = await Shared.getData('email');
    setState(() {
      
    });
  }
}


// App Design URL => https://dribbble.com/shots/14420230-Public-Transport-App-Design/attachments/6098108?mode=media


// ARCH => 
      // Models => 1- CateogryModel, 2- VechileModel
      // Methods => 1- Get Categories, 2- Loop on Categories, 3- Create list of categories object and vechile object