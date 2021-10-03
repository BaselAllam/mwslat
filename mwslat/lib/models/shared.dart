import 'package:shared_preferences/shared_preferences.dart';



class Shared{


  static void saveOffline(String key, String value) async {

    SharedPreferences _shared = await SharedPreferences.getInstance();
    _shared.setString(key, value);
  }


  static Future<String> getData(String key) async {
    
    try{
      SharedPreferences _shared = await SharedPreferences.getInstance();
      String? value = _shared.getString(key);

      return value!;
    }catch(e){
      print(e);
      return '';
    }
  }
}