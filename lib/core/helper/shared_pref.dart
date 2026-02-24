import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper ._();


  static late SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({required String key, required dynamic value} )async{
    if (value is String) return _pref.setString(key, value);
    if (value is int) return _pref.setInt(key, value);
    if (value is bool) return _pref.setBool(key, value);
    if (value is double) return _pref.setDouble(key, value);

    return false;
  }

  static int? getInt({required String key}){
    return _pref.getInt(key)??0;
  }
  static bool? getBool({required String key}){
    return _pref.getBool(key);
  }
  static double? getDouble({required String key})  {
    return _pref.getDouble(key);
  }
  static String? getString({required String key})  {
    return _pref.getString(key) ;
  }


  static Future<bool> removeData(String key)  {
  return   _pref.remove(key);
  }

  static Future<bool> clearAllData()  {
  return   _pref.clear();
  }
}