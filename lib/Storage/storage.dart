
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  //Returns if dropdown value is set or not.
  static Future<bool> isKeySet(key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) == null ? false : true;
  }

  static Future<bool> isIdKeySet(key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) == null ? false : true;
  }

  // Returns the value of user class from local storage
  static Future<bool> get(key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<String> getId(key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  //Updates the value class value at the local storage
  static void set(key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }
  static void setId(key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

}