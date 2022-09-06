import 'package:appbanhang/@core/shared_preference.dart';
import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/profile.dart';
import 'package:appbanhang/model/user.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ConfirmController extends GetxController {
  var listPro;
  var listOrder = [].obs;
  var total = 0.obs;
  var numberOfItem = 0.obs;
  var status = AppState.LOADING.obs;
  var profile;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getProfile();
    await getListPro();
  }

  Future<void> getListPro() async {
    listOrder.clear();
    total.value = 0;
    numberOfItem.value = 0;
    var box = Hive.box('Cart');
    // box.clear();
    // if (box.get("name"))
    // ProductHive listPro = box.get('name');
    // // listPro = HiveService.share.getBoxes();
    // print("getListPro ${listPro.name}");
    Box<dynamic> box1 = Hive.box<dynamic>('Cart');
    if (box1.isNotEmpty) {
      listOrder.addAll(box1.values);
      // use data
      for (var item in listOrder) {
        total.value += int.parse(item.priceSale) * (item.soluong as int);
      }
      numberOfItem.value = listOrder.length;
    }
    status.value = AppState.DONE;
  }

  Future<void> getProfile() async {
    String? token = await AppSharePreference.share.getTokenSharePreference();
    try {
      final response =
          await API.share.postProfile(User(token, password: "", email: ""));
      if (response.statusCode == 200) {
        var data = response.data["data"];
        // print(data);
        // var datadefault = Product.fromJson(response.data);
        // print("Number of list product ${datadefault.data!.length}");
        profile = Profile.fromJson(data);
        status.value = AppState.DONE;
      }
    } catch (e) {
      print(e);
      status.value = AppState.ERROR;
    }
  }

  Future<void> order() async {
    List<Map<String, Object>> listCate = [];
    for (var item in listOrder) {
      print(item.soluong);
      Map<String, Object> product = {};
      product["product_id"] = item.id;
      product["qly"] = item.soluong;
      product["size_id"] = "";
      listCate.add(product);
    }
    print(listCate);
    try {
      final response = await API.share.checkoutCart(
          listCate, profile.fullname, profile.address, profile.phone);
      if (response.statusCode == 200) {
        print("Success");
      } else {
        print("Fail");
      }
    } catch (e) {
      print("error ${e}");
    }
  }
}
