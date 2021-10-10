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


// Ref => 

    // Language => https://resocoder.com/2019/06/01/flutter-localization-the-easy-way-internationalization-with-json/
    // SQlite => https://flutter.dev/docs/cookbook/persistence/sqlite
    // Audio Player => https://pub.dev/packages/audioplayers
    // Video Player => https://pub.dev/packages/video_player
    // Firebase => https://www.youtube.com/user/firebase
    // Tutorial => https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/