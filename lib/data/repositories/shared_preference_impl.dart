import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceImpl {
  Future<void> deleteData(String key) async {
    final shared = await SharedPreferences.getInstance();
    shared.remove(key);
  }

  Future<String> getData(String key) async {
    final shared = await SharedPreferences.getInstance();
    return shared.getString(key) ?? "";
  }

  Future<void> storeData(String key, String value) async {
    final shared = await SharedPreferences.getInstance();
    shared.setString(key, value);
  }

  Future<void> storeBool(String key, bool value) async {
    final shared = await SharedPreferences.getInstance();
    shared.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    final shared = await SharedPreferences.getInstance();
    return shared.getBool(key) ?? false;
  }
}