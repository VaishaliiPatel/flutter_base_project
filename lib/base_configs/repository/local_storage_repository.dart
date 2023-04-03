import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseLocalStorageRepository {
  Future<void> init();

  Future<bool> setString(String key, String value);
  String? getString(String key);

  Future<bool> setBool(String key, bool value);
  bool? getBool(String key);

  Future<bool> setDouble(String key, double value);
  double? getDouble(String key);

  Future<bool> setInt(String key, int value);
  int? getInt(String key);

  Future<bool> setStringList(String key, List<String> value);
  List<String>? getStringList(String key);

  Future<bool> remove(String key);

  Future<bool> clearAll();

  bool containsKey(String key);

  Set<String> getKeys();
}

class LocalStorageRepository extends BaseLocalStorageRepository {
  late final SharedPreferences _pref;

  @override
  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  @override
  Future<bool> setString(String key, String value) {
    return _pref.setString(key, value);
  }

  @override
  String? getString(String key) {
    return _pref.getString(key);
  }

  @override
  Future<bool> setBool(String key, bool value) {
    return _pref.setBool(key, value);
  }

  @override
  bool? getBool(String key) {
    return _pref.getBool(key);
  }

  @override
  Future<bool> setDouble(String key, double value) {
    return _pref.setDouble(key, value);
  }

  @override
  double? getDouble(String key) {
    return _pref.getDouble(key);
  }

  @override
  Future<bool> setInt(String key, int value) {
    return _pref.setInt(key, value);
  }

  @override
  int? getInt(String key) {
    return _pref.getInt(key);
  }

  @override
  Future<bool> setStringList(String key, List<String> value) {
    return _pref.setStringList(key, value);
  }

  @override
  List<String>? getStringList(String key) {
    return _pref.getStringList(key);
  }


  @override
  bool containsKey(String key) {
    return _pref.containsKey(key);
  }

  @override
  Set<String> getKeys() {
    return _pref.getKeys();
  }

  @override
  Future<bool> remove(String key) {
    return _pref.remove(key);
  }

  @override
  Future<bool> clearAll() {
    return _pref.clear();
  }
}