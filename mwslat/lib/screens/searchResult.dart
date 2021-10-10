import 'package:flutter/material.dart';
import 'package:mwslat/models/category/categoryModel.dart';
import 'package:mwslat/models/mainmodel.dart';
import 'package:mwslat/models/ticket/ticketModel.dart';
import 'package:mwslat/screens/more.dart';
import 'package:mwslat/theme/sharedcolor.dart';
import 'package:mwslat/theme/sharedfontstyle.dart';
import 'package:mwslat/widgets/backButton.dart';
import 'package:mwslat/widgets/offerWidget.dart';
import 'package:scoped_model/scoped_model.dart';



class SearchResult extends StatefulWidget {

  final MainModel model;

  SearchResult(this.model);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

@override
void initState() {
  widget.model.getData();
  super.initState();
}

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
                    categories(model)
                  ],
                ),
              ),
              Row(
                children: [
                  Item('With Offer', Icons.local_offer, Option.withOffer),
                  Item('Last Time', Icons.watch, Option.lastTime),
                ],
              ),
              offers(model)
            ],
          ),
        ),
      );
      },
    );
  }
  offers(MainModel model) {
    if(model.selectedCategory == null) {
      return Center(child: Text('Select Category', style: TextStyle(color: Colors.black)));
    }else{
      return Column(
        children: [
          for(TicketModel ticket in model.selectedCategory!.tickets)
          OfferWidget(0, ticket)
        ],
      );
    }
  }
  categories(MainModel model) {
    if(model.isGetCategoryLoading == true) {
      return Center(child: CircularProgressIndicator());
    }else{
     return Row(
       children: [
         for(CategoryModel category in model.allCategories)
         InkWell(
           onTap: () {
             model.selectCategory(category.id);
           },
           child: Container(
             child: Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    margin: EdgeInsets.all(11.0),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Icon(Icons.bus_alert, color: blackColor, size: 40.0),
                  ),
                  Text(
                    '${category.name}',
                    style: primaryTextStyle,
                  )
                ],
              ),
           ),
         ),
       ],
     );
    }
  }
}



class Item extends StatefulWidget {

  final String txt;
  final IconData icon;
  Option option;

  Item(this.txt, this.icon, this.option);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {

  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.option == Option.lastTime ? secondaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
          border: widget.option == Option.lastTime ? Border.all(color: secondaryColor) : Border.all(color: blackColor, width: 0.5)
        ),
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(7.0),
        width: MediaQuery.of(context).size.width/2.5,
        child: Row(
          children: [
            Icon(widget.icon, color: primaryColor, size: 20.0),
            Text('  ${widget.txt}', style: secondaryTextStyle,)
          ],
        ),
      ),
    );
  }
}

enum Option{
  withOffer, lastTime
}