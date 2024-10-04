import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/Utilities/constants/colors.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_app/features/Profile/profile_view.dart';
import 'package:my_first_flutter_app/features/Store/search_view.dart';

import '../Home/home_view.dart';

class NavigationController extends GetxController {

  static  NavigationController get instance => Get.find();

  Rx<int> selectedIndex = 0.obs;

  List screens = [Container(child: const HomeView()), Container(child: const SearchView()), Container(color: Colors.yellow), Container(child: const ProfileView()),];
}

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {

final controller = Get.put(NavigationController());
    return  Scaffold(
      bottomNavigationBar: Obx(
          () =>  NavigationBar(
            selectedIndex: controller.selectedIndex.value,
            elevation: 0,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            destinations:
            [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.store), label: 'Store'),
              NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'cart'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ],

          )

      ),
      body: Obx(
          () => controller.screens[controller.selectedIndex.value],
      ),

    );

  }
}



