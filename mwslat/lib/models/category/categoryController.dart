import 'package:http/http.dart' as http;
import 'package:mwslat/models/ticket/ticketModel.dart';
import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import 'package:mwslat/models/category/categoryModel.dart';


mixin CategoryController on Model{

  List<CategoryModel> _allCategories = [];
  List<CategoryModel> get allCategories => _allCategories;

  bool _isGetCategoryLoading = false;
  bool get isGetCategoryLoading => _isGetCategoryLoading;
  

  Future<void> getData() async {

    _isGetCategoryLoading = true;
    notifyListeners();

    http.Response _res = await http.get(Uri.parse('https://mwslat-c533b-default-rtdb.firebaseio.com/categories.json'));

    Map<String, dynamic> _data = json.decode(_res.body);

    _data.forEach((key, value) {
      CategoryModel _newCategory = CategoryModel(key, value['categoryName'], []);
      value['categoryBuses'].forEach((i) {
        TicketModel _newTicket = TicketModel(i['id'], i['arriveLocation'], i['arriveTime'], i['depatureLocation'], i['depatureTime'], i['price']);
        _newCategory.tickets.add(_newTicket);
      });
      _allCategories.add(_newCategory);
    });

    _isGetCategoryLoading = false;
    notifyListeners();
  }


  CategoryModel? selectedCategory;

  selectCategory(String id) {

    for(CategoryModel categoryModel in _allCategories) {
      if(categoryModel.id == id) {
        selectedCategory = categoryModel;
        break;
      }
    }

    notifyListeners();
  }


}



// ScopedModel
    // 1- Model => class that needs to inherit from to be able to share data and notifyListeners
    // 2- ScopedModel => class being on the top of app tree, define model that will be shared for all app states
    // 3- ScopedModelDecendent => class being as a parent for any widget wants to listen on changes and sharing data