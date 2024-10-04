import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Modals/category_modal.dart';
import '../Repository/category_repository.dart';

class CategoryVM extends GetxController {


  final _categoryRepository = Get.put(CategoryRepository());

  RxList<CategoryModal> allCategories =  <CategoryModal>[].obs;
  final isloading = true.obs;
  @override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
    fetchCategories();

  }

  Future fetchCategories() async {
    isloading.value = true;
try {
  final fetchedCategories = await _categoryRepository.fetchAllCategories();
  allCategories.assignAll(fetchedCategories);
  isloading.value = false;
} catch(e) {
  throw Exception('Failed to fetch categories');
} finally{
  isloading.value = false;
}
  }

}