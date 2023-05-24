import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPrefrences ;
  static init()async{
    sharedPrefrences = await SharedPreferences.getInstance() ;
  }
  static void putData({required String key , required List<String> Li}){
    sharedPrefrences?.setStringList(key,Li);
  }
  static void putbool({required String key , required bool Li}){
    sharedPrefrences!.setBool(key,Li);
  }
  static dynamic getData({required String key}){
    sharedPrefrences!.getStringList(key);
    print("Yes");
  }
  static dynamic getbool({required String key}){
    sharedPrefrences!.getBool(key);
    print("Yes");
  }
}
