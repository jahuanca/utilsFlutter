import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

const _token = 'TOKEN';

class UserPreferences {
  static final UserPreferences _instancia = UserPreferences._internal();

  factory UserPreferences() => _instancia;

  UserPreferences._internal();

  SharedPreferences? _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int? getInt(String key) => _prefs?.getInt(key);
  Future<void> setInt(String key, int value) async => await _prefs?.setInt(key, value);

  bool getBool(String key) => _prefs?.getBool(key) ?? false;
  Future<void> setBool(String key, bool value) async => await _prefs?.setBool(key, value);

  String? getString(String key) => _prefs?.getString(key);
  Future<void> setString(String key, String value) async => await _prefs?.setString(key, value);

  String? getObjectString(String key) => _prefs?.getString(key);

  String? getToken() => _prefs?.getString(_token);
  Future<void> setToken(String value) async => await _prefs?.setString(_token, value);

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

  Future<void> remove(String key) async => await _prefs?.remove(key);

}
