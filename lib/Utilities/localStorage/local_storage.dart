// import 'package:get/get.dart';
// class LocalStorage {
//   static final LocalStorage instance = LocalStorage._internal();
//
//   factory LocalStorage() {
//     return instance;
//   }
//
//   LocalStorage._internal();
//
//   final storage = GetStorage();
//
//   // Generic method to save data
//   Future<void> saveData<T>(String key, T value) async
//   {
//   await storage.write(key, value);
//   }
//
//   // Generic method to read data
//   T? readData<T>(String key) {
//     return storage.read<T>(key);
//
//   }
//
//   // Generic method to remove data
//   Future<void> removeData(String key) async {
//     await storage.remove(key);
//   }
//
// // Clear all data in storage
//   Future<void> clearAll() async {
//     await storage.erase();
//
//   }
// }