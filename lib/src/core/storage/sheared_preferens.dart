import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

import "app_storage.dart";

@immutable
class StorageService {
  final SharedPreferences db;

  const StorageService._internal({required this.db});

  static Future<StorageService> get instance async {
    final prefs = await SharedPreferences.getInstance();
    return StorageService._internal(db: prefs);
  }

  String? read(String key) => db.getString(key);

  Future<bool> remove(String key) => db.remove(key);

  Future<bool> store(String key, String data) => db.setString(key, data);

  static Future<void> storeData({required StorageKey key, required String value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key.name, value);
  }

  static Future<String?> loadData({required StorageKey key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key.name);
  }

  static Future<void> removeData({required StorageKey key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key.name);
  }



  // final SharedPreferences db;
  // const StorageService({required this.db});
  // static Future<SharedPreferences> get init async => SharedPreferences.getInstance();
  //
  // String? read(String key) => db.getString(key);
  //
  // Future<bool> remove(String key) => db.remove(key);
  //
  // Future<bool> store(String key, String data) => db.setString(key, data);
  //
  //
  // /// store data
  // static Future<void> storeData({required StorageKey key, required String value})async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(key.name, value);
  // }
  //
  // /// load data
  // static Future<String?> loadData({required StorageKey key})async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(key.name);
  // }
  //
  // /// remove data
  // static Future<void> removeData({required StorageKey key})async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove(key.name);
  // }
}

