import 'package:flutter/material.dart';
import 'package:mwslat/screens/more.dart';
import 'package:mwslat/theme/sharedcolor.dart';
import 'package:mwslat/theme/sharedfontstyle.dart';
import 'package:mwslat/widgets/backButton.dart';
import 'package:mwslat/widgets/offerWidget.dart';



class SearchResult extends StatefulWidget {

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

List<Map<String, dynamic>> categories = [
  {
    'icon' : Icons.grain,
    'txt' : 'All'
  },
  {
    'icon' : Icons.train,
    'txt' : 'Traing'
  },
  {
    'icon' : Icons.local_taxi_rounded,
    'txt' : 'Taxi'
  },
  {
    'icon' : Icons.bus_alert,
    'txt' : 'Bus'
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
        leading: CustomBackButton(),
        iconTheme: IconThemeData(color: blackColor, size: 25.0),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {return More();}));
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 115.0,
              margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for(Map<String, dynamic> cat in categories)
                  Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.all(11.0),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Icon(cat['icon'], color: blackColor, size: 40.0),
                      ),
                      Text(
                        '${cat['txt']}',
                        style: primaryTextStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                item('With Offer', Icons.local_offer, secondaryColor, Border.all(color: secondaryColor)),
                item('Last Time', Icons.watch, Colors.transparent, Border.all(color: blackColor, width: 0.5)),
              ],
            ),
            for(int i = 0; i < 5; i++)
            OfferWidget(i)
          ],
        ),
      ),
    );
  }
  Container item(String txt, IconData icon, Color containerColor, Border containerBorder) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20.0),
        border: containerBorder
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(15.0),
      width: MediaQuery.of(context).size.width/2.5,
      child: Row(
        children: [
          Icon(icon, color: primaryColor, size: 20.0),
          Text('  $txt', style: secondaryTextStyle,)
        ],
      ),
    );
  }
}