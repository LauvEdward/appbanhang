import 'package:appbanhang/screen/account/account_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../cart/cart_screen.dart';
import '../category/category_screen.dart';
import '../home/home_screen.dart';
import '../post/post_screen.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;
  final List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    CategoryScreen(),
    PostScreen(),
    AccountScreen(),
  ];
  void moveToTab(int index) {
    selectedIndex.value = index;
    update();
  }
}
