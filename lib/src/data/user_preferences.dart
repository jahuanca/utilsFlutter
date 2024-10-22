import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instancia = UserPreferences._internal();

  factory UserPreferences() => _instancia;

  UserPreferences._internal();

  SharedPreferences? _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool getBool(String key) => _prefs?.getBool(key) ?? false;
  Future<void> setBool(String key, value) async => await _prefs?.setBool(key, value);

  String? getString(String key) => _prefs?.getString(key);
  Future<void> setString(String key, value) async => await _prefs?.setString(key, value);

  String? getObjectString(String key) => _prefs?.getString(key);

  Future<void> setObjectString(String key, dynamic value) async{
    await _prefs?.setString(key, jsonEncode(value));
  }

  Future<void> setObject(String nameObject, Map<String, dynamic> map) async{
    map.forEach((key, value) async{
      switch(value.runtimeType.toString()){
        case 'String':
          await _prefs?.setString('${nameObject}_$key', value);
          break;
        case 'int':
          await _prefs?.setInt('${nameObject}_$key', value);
          break;
        case 'bool':
          await _prefs?.setBool('${nameObject}_$key', value);
          break;
        case 'double':
          await _prefs?.setDouble('${nameObject}_$key', value);
          break;
        default:
          break;
      }
    });
  }

  Future<void> clearAll() async => await _prefs?.clear();

}
