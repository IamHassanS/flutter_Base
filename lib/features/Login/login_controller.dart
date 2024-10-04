import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Modals/category_modal.dart';

class UsersModel {

  String email;
  String password;


  UsersModel({
    required this.email,
    required this.password,
  });

  static UsersModel isEmpty() => UsersModel(email: '', password: '');

  factory UsersModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model
      return UsersModel(

        email: data['email'] ?? '',
        password: data['password'] ?? '',

      );
    } else {
      // Handle case where document.data() is null
      return UsersModel.isEmpty();
    }
  }

}

class LoginController extends GetxController {

  static  LoginController get instance => Get.find();
final _db = FirebaseFirestore.instance;
  Future<bool> validateLogin({
    required String email,
    required String password,
  }) async {
    // Add your validation logic here

    // Example:
    if (email.isEmpty || password.isEmpty) {
      return false; // Handle empty fields
    }
    try {
      final snapshot = await _db.collection('Users').get();
      final users = snapshot.docs.map((element) => UsersModel.fromSnapshot(element)).toList();
      
    } catch (e) {
      // Log the error details
      debugPrint('Error fetching categories: $e');
      // Throw a custom exception or return a Future with an error state
      throw Exception('Failed to fetch categories'); // Example custom exception
    }
    // Perform API or database calls to validate credentials
    // ...

    return true; // Assuming successful validation
  }

}