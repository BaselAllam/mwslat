import 'package:mwslat/models/category/categoryController.dart';
import 'package:mwslat/models/ticket/ticketController.dart';
import 'package:scoped_model/scoped_model.dart';



class MainModel extends Model with CategoryController, TicketController{}