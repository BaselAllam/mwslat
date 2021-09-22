import 'package:flutter/material.dart';
import 'package:mwslat/screens/more.dart';
import 'package:mwslat/theme/sharedcolor.dart';
import 'package:mwslat/theme/sharedfontstyle.dart';
import 'package:mwslat/widgets/backButton.dart';



class Ticket extends StatefulWidget {

  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Ticket',
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
    );
  }
}