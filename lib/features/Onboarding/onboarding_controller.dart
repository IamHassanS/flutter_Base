import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Login/login_view.dart';



class OnboardingController extends GetxController {
  //Variables
static  OnboardingController get instance => Get.find();
PageController pageController = PageController();
Rx<int> currentPage = 0.obs;
  void updatePageIndicator(index) {
    currentPage = index;
  }

  void onPageControllerTapped(index) {
    currentPage.value = index;
    pageController.jumpTo(index);
  }

  void skipPage() {
    Get.offAll(LoginVIew());
  }

  void nextPage() {

    if  (currentPage.value >= 2) {
      print("Move to login page");
      Get.offAll(LoginVIew());
     // Navigator.push(context, MaterialPageRoute(builder: builder))
    } else {
      currentPage.value =  currentPage.value + 1;
    pageController.jumpToPage(currentPage.value);
    }

  }
}
