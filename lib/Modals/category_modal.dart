import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryModal {
String id;
  String name;
  String parentID;
  bool isFeatured;
  String asset;

  CategoryModal({
    required this.id,
    required this.name,
    this.parentID = '',
    required this.isFeatured,
    required this.asset,
  });

  static CategoryModal isEmpty() => CategoryModal(id: '', name: '', isFeatured: false, asset: '');


  Map<String, dynamic> toJSON() {
    return {
      'id' : id,
      'name' : name,
      'parentID' : parentID,
      'isFeatured' : isFeatured,
      'asset' : asset,
    };
  }


  factory CategoryModal.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model
      return CategoryModal(
        id: document.id,
        name: data['name'] ?? '',
        asset: data['asset'] ?? '',
        parentID: data['ParentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      // Handle case where document.data() is null
      return CategoryModal.isEmpty();
    }
  }

}