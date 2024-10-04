import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_app/Modals/category_modal.dart';

class CategoryRepository extends GetxController {

  static CategoryRepository get _instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //CategoryRepository._internal();



  Future<List<CategoryModal>> fetchAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((element) => CategoryModal.fromSnapshot(element)).toList();
      return list;
    } catch (e) {
      // Log the error details
      debugPrint('Error fetching categories: $e');
      // Throw a custom exception or return a Future with an error state
      throw Exception('Failed to fetch categories'); // Example custom exception
    }
  }
}

