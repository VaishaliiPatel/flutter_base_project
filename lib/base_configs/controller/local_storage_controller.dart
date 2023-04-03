import 'package:cmsocpp/base_configs/configs/storage_config.dart';

import '../../../../../core/base/base_controller.dart';
import '../repository/local_storage_repository.dart';

class LocalStorageController extends ServiceController {
  final BaseLocalStorageRepository _repository;

  LocalStorageController({required BaseLocalStorageRepository repository}) : _repository = repository;

  Future<bool> setString(String key, String value) => _repository.setString(key, value);

  String? getString(String key) => _repository.getString(key);

  Future<bool> setBool(String key, bool value) => _repository.setBool(key, value);

  bool? getBool(String key) => _repository.getBool(key) ?? false;

  Future<bool> setDouble(String key, double value) => _repository.setDouble(key, value);

  double? getDouble(String key) => _repository.getDouble(key);

  Future<bool> setInt(String key, int value) => _repository.setInt(key, value);

  int? getInt(String key) => _repository.getInt(key) ?? 0;

  Future<bool> setStringList(String key, List<String> value) => _repository.setStringList(key, value);

  List<String>? getStringList(String key) => _repository.getStringList(key);

  // Save access token
  void saveAccessToken(String token) => _repository.setString(StorageConfig.accessToken, token);

  // Get access token
  String? getAccessToken() => _repository.getString(StorageConfig.accessToken);

  // Save refresh token
  void saveRefreshToken(String token) => _repository.setString(StorageConfig.refreshToken, token);

  // Get refresh token
  String? getRefreshToken() => _repository.getString(StorageConfig.refreshToken);

  // Set is user logged in or not
  void setIsUserLoggedIn(bool isLoggedIn) => _repository.setBool(StorageConfig.isLoggedIn, isLoggedIn);

  // Get is user logged in or not
  bool? getIsUserLoggedIn() => _repository.getBool(StorageConfig.isLoggedIn) ?? false;

  // Save if dark theme selected
  void saveIsDarkTheme(bool isDarkTheme) => _repository.setBool(StorageConfig.isDarkTheme, isDarkTheme);

  // Get theme
  bool? getIsDarkTheme() => _repository.getBool(StorageConfig.isDarkTheme) ?? false;

  // Save Index key
  void saveIndexKey(int index) => _repository.setInt(StorageConfig.saveIndexKey, index);

  // Get index key
  int? getIndexKey() => _repository.getInt(StorageConfig.saveIndexKey) ?? 0;

  Future<bool> remove(String key) => _repository.remove(key);

  Future<bool> clearAll() => _repository.clearAll();

  bool containsKey(String key) => _repository.containsKey(key);

  Set<String> getKeys() => _repository.getKeys();

  // Save Transaction id
  void saveTransactionId(int index) => _repository.setInt(StorageConfig.getTransactionID, index);

  // Get Transaction id
  int? getTransactionId() => _repository.getInt(StorageConfig.getTransactionID) ?? 0;
  // Set Transaction status
  void setTransactionOnStatus(bool status) => _repository.setBool(StorageConfig.transactionOnStatus, status);

  // Get Transaction status
  bool getTransactionOnStatus() => _repository.getBool(StorageConfig.transactionOnStatus) ?? false;

  // Get Task ID of start transaction
  int? getTaskId() => _repository.getInt(StorageConfig.taskId) ?? 0;

  // Set Task Id of start transaction
  void setTaskId(int data) => _repository.setInt(StorageConfig.taskId, data);

  // Get Charger name
  String? getChargerName() => _repository.getString(StorageConfig.chargerName) ?? '';

  // Set Charger name
  void setChargerName(String data) => _repository.setString(StorageConfig.chargerName, data);

  // Set User data
  void setUserData(String data) => _repository.setString(StorageConfig.getUserData, data);

  // Get User data
  String getUserData() => _repository.getString(StorageConfig.getUserData) ?? '{}';
}
