import 'package:flutter/material.dart';
import 'package:mwslat/screens/searchResult.dart';
import 'package:mwslat/theme/sharedcolor.dart';
import 'package:mwslat/theme/sharedfontstyle.dart';
import 'package:mwslat/widgets/cutomsbutton.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Container(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/1.8,
                color: Colors.indigo[50],
              ),
              Positioned(
                left: MediaQuery.of(context).size.width-60,
                top: 50,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.navigation),
                    color: blackColor,
                    iconSize: 30.0,
                    onPressed: () {},
                  )
                ),
              ),
              Positioned(
                height: MediaQuery.of(context).size.height/2,
                top: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
                  ),
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Where would you like', style: primaryTextStyle),
                      Row(
                        children: [
                          Text('to go', style: primaryTextStyle),
                          Text(' Today ?', style: TextStyle(color: blackColor, fontSize: 30.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        height: 150.0,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.white
                                  ),
                                  height: 50.0,
                                  margin: EdgeInsets.all(10.0),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.white
                                  ),
                                  height: 50.0,
                                  margin: EdgeInsets.all(10.0),
                                ),
                              ],
                            ),
                            Positioned(
                              height: 55,
                              width: 55,
                              top: 50,
                              left: MediaQuery.of(context).size.width/1.4,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle
                                ),
                                alignment: Alignment.center,
                                child: Icon(Icons.swap_vert, color: Colors.white, size: 45.0)
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_today, color: primaryColor, size: 20.0),
                              Text(' Today', style: secondaryTextStyle),
                            ],
                          ),
                          Text('1 Passenger', style: secondaryTextStyle),
                        ],
                      ),
                      CustomButton(
                        'Search',
                        () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) {return SearchResult();}));
                        }
                      )
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}