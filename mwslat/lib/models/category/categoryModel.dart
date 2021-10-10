import 'package:mwslat/models/ticket/ticketModel.dart';



class CategoryModel{

  String id;
  String name;
  List<TicketModel> tickets;

  CategoryModel(this.id, this.name, this.tickets);
}