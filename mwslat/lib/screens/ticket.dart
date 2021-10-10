import 'package:flutter/material.dart';
import 'package:mwslat/models/mainmodel.dart';
import 'package:mwslat/screens/more.dart';
import 'package:mwslat/theme/sharedcolor.dart';
import 'package:mwslat/theme/sharedfontstyle.dart';
import 'package:mwslat/widgets/backButton.dart';
import 'package:mwslat/widgets/cutomsbutton.dart';
import 'package:mwslat/widgets/snack.dart';
import 'package:scoped_model/scoped_model.dart';



class Ticket extends StatefulWidget {

  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
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
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: Card(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              height: MediaQuery.of(context).size.height/1.3,
              width: MediaQuery.of(context).size.height/1.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                      color: primaryColor
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '\n44890-546-34532\n',
                      style: whiteTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${model.selectedTicket!.depatureTime}', style: primaryTextStyle),
                        Text('${model.selectedTicket!.arriveTime}', style: primaryTextStyle),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, color: primaryColor, size: 30.0),
                        Container(
                          width: 200,
                          child: Divider(endIndent: 0.0, indent: 0.0, color: Colors.black, thickness: 5.0)
                        ),
                        Icon(Icons.circle, color: secondaryColor, size: 30.0),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${model.selectedTicket!.depatureLocation}', style: primaryTextStyle),
                        Text('${model.selectedTicket!.arriveLocation}', style: primaryTextStyle),
                      ],
                    ),
                  ),
                  item(
                    'Date:',
                    '12-Aug-2021',
                    Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Seat 43',
                            style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
                          )
                        ),
                  ),
                  item(
                    'Passenger:',
                    'Bassel Allam',
                    Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          alignment: Alignment.center,
                          child: Icon(Icons.add, color: blackColor, size: 30.0)
                        ),
                    ),
                    item(
                    'Price:',
                    '${model.selectedTicket!.price}',
                    Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          alignment: Alignment.center,
                          child: Icon(Icons.edit, color: blackColor, size: 30.0)
                        ),
                    ),
                    model.isAddTicketLoading == true ? Center(child: CircularProgressIndicator()) : 
                    CustomButton(
                      'Save',
                      () async {
                        bool _isValid = await model.addTicket(model.selectedTicket!, '20-aug-2021', 'bassel allam');
                        if(_isValid == true) {
                          ScaffoldMessenger.of(context).showSnackBar(snack('Added Succes', Colors.green));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(snack('Some thing went wrong', Colors.red));}
                      }
                    )
                ],
              ),
            ),
          ),
        ),
      );
      }, 
    );
  }
  ListTile item(String title, String subtitle, Widget trailing) {
    return ListTile(
      title: Text(
        '$title',
        style: secondaryTextStyle,
      ),
      subtitle: Text(
        '$subtitle',
        style: primaryTextStyle,
      ),
      trailing: trailing,
    );
  }
}