import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../account/account_screen.dart';
import '../cart/cart_screen.dart';
import '../category/category_screen.dart';
import '../home/home_screen.dart';
import '../post/post_screen.dart';
import 'navigation_controller.dart';

class NavigationScreen extends StatelessWidget {
  NavigationController navigationController = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: navigationController.selectedIndex.value,
          children: navigationController.pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Ionicons.home),
              label: 'Mua sắm',
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.cart),
              label: 'Giỏ hàng',
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.apps),
              label: 'Danh mục',
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.newspaper),
              label: 'Tin tức',
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.person),
              label: 'Tài khoản',
            ),
          ],
          currentIndex: navigationController.selectedIndex.value,
          onTap: (currentIndex) {
            navigationController.selectedIndex.value = currentIndex;
          },
        ),
      ),
    );
  }
}
