import 'package:flutter/material.dart';
import 'package:mwslat/theme/sharedcolor.dart';
import 'package:mwslat/theme/sharedfontstyle.dart';



class SearchResult extends StatefulWidget {

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

List<Map<String, dynamic>> drawerData = [
  {
    'icon' : Icons.settings,
    'txt' : 'Settings'
  },
  {
    'icon' : Icons.account_circle,
    'txt' : 'Profile'
  },
  {
    'icon' : Icons.phone,
    'txt' : 'Contact Us'
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
          'Results',
          style: primaryTextStyle,
        ),
        iconTheme: IconThemeData(color: blackColor, size: 25.0),
        actions: [
          Icon(
            Icons.account_circle,
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 75),
            for(int i = 0; i < drawerData.length; i++)
            ListTile(
              leading: Icon(drawerData[i]['icon'], color: blackColor, size: 20.0),
              title: Text(drawerData[i]['txt'], style: primaryTextStyle),
              trailing: Icon(Icons.arrow_forward_ios, color: blackColor, size: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}