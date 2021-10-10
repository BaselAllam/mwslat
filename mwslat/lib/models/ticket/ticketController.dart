import 'dart:convert';

import 'package:mwslat/models/category/categoryModel.dart';
import 'package:mwslat/models/ticket/ticketModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;



mixin TicketController on Model{

  bool _isAddTicketLoading = false;
  bool get isAddTicketLoading => _isAddTicketLoading;

  TicketModel? selectedTicket;

  selectTicket(String id, CategoryModel selecteCategory) {
    for(TicketModel ticket in selecteCategory.tickets) {
      if(ticket.id == id) {
        selectedTicket = ticket;
        break;
      }
    }

    notifyListeners();
  }


  Future<bool> addTicket(TicketModel selectedTicket, String date, String userName) async {

    _isAddTicketLoading = true;
    notifyListeners();

    Map<String, dynamic> _data = {
      'depatureTime' : selectedTicket.depatureTime,
      'depatureLocation' : selectedTicket.depatureLocation,
      'arriveTime' : selectedTicket.arriveTime,
      'arriveLocation' : selectedTicket.arriveLocation,
      'price' : selectedTicket.price,
      'userName' : userName,
      'date' : date
    };

    http.Response _res = await http.post(Uri.parse('https://mwslat-c533b-default-rtdb.firebaseio.com/tickets.json'), body: json.encode(_data));

    if(_res.statusCode == 200) {
      _isAddTicketLoading = false;
      notifyListeners();
      return true;
    }else{
      _isAddTicketLoading = false;
      notifyListeners();
      return false;
    }
  }
}