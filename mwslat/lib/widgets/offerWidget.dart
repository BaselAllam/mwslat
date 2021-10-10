import 'package:flutter/material.dart';
import 'package:mwslat/models/category/categoryModel.dart';
import 'package:mwslat/models/mainmodel.dart';
import 'package:mwslat/models/ticket/ticketModel.dart';
import 'package:mwslat/screens/ticket.dart';
import 'package:mwslat/theme/sharedcolor.dart';
import 'package:mwslat/theme/sharedfontstyle.dart';
import 'package:scoped_model/scoped_model.dart';




class OfferWidget extends StatefulWidget {

  final int index;
  final TicketModel ticket;

  OfferWidget(this.index, this.ticket);

  @override
  _OfferWidgetState createState() => _OfferWidgetState();
}

class _OfferWidgetState extends State<OfferWidget> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return  InkWell(
        onTap: () {
          model.selectTicket(widget.ticket.id, model.selectedCategory!);
          Navigator.push(context, MaterialPageRoute(builder: (_) {return Ticket();}));
        },
        child: Card(
          color: widget.index.isOdd ? secondaryColor : backGroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15.0)),
          elevation: 10.0,
          margin: EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.index.isOdd ? secondaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 150.0,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Text('${widget.ticket.depatureTime} ', style: primaryTextStyle),
                                Text('  ${widget.ticket.depatureLocation}', style: primaryTextStyle),
                              ],
                            ),
                            Icon(Icons.circle, color: secondaryColor, size: 10.0,),
                            Container(
                              color: primaryColor,
                              width: 3.0,
                              height: 80.0,
                            ),
                            Icon(Icons.circle, color: secondaryColor, size: 10.0,),
                            Row(
                              children: [
                                Text('${widget.ticket.arriveTime}', style: primaryTextStyle),
                                Text('${widget.ticket.arriveLocation}', style: primaryTextStyle),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${widget.ticket.price}\$',
                          style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: widget.index.isOdd ? secondaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  padding: EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          for(int i = 0; i < 9; i++)
                          Container(
                            height: 3.0,
                            width: 20.0,
                            color: Colors.grey,
                            margin: EdgeInsets.all(7),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          secondContainerRow(' 12 KM', Icons.location_on_outlined),
                          secondContainerRow(' Travel Time 35MIN', Icons.watch),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      },
    );
  }
  Row secondContainerRow(String txt, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: primaryColor, size: 20.0),
        Text(
          '$txt',
          style: secondaryTextStyle,
        )
      ],
    );
  }
}