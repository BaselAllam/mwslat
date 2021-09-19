import 'package:flutter/material.dart';
import 'package:mwslat/theme/sharedcolor.dart';
import 'package:mwslat/theme/sharedfontstyle.dart';




class More extends StatefulWidget {

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {

List<Map<String, dynamic>> moreData = [
  {
    'icon' : Icons.account_circle,
    'txt' : 'Profile'
  },
  {
    'icon' : Icons.bookmark,
    'txt' : 'Booking History'
  },
  {
    'icon' : Icons.settings,
    'txt' : 'Settings'
  },
  {
    'icon' : Icons.phone,
    'txt' : 'Contact Us'
  },
  {
    'icon' : Icons.info,
    'txt' : 'About Us'
  },
  {
    'icon' : Icons.notification_important,
    'txt' : 'Terms and Conditions'
  },
  {
    'icon' : Icons.exit_to_app,
    'txt' : 'Sign out'
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'More',
          style: primaryTextStyle,
        ),
        iconTheme: IconThemeData(color: blackColor, size: 25.0),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: moreData.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(moreData[i]['icon'], color: primaryColor, size: 25.0),
            title: Text(moreData[i]['txt'], style: primaryTextStyle),
            trailing: Icon(Icons.arrow_forward_ios, color: blackColor, size: 20.0),
          );
        },
      ),
    );
  }
}