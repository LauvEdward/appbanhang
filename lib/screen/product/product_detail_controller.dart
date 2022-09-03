import 'dart:js';

import 'package:appbanhang/@core/hive_manager.dart';
import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/product_detail.dart';
import 'package:appbanhang/model/product_hive.dart';
import 'package:appbanhang/screen/cart/cart_controller.dart';
import 'package:appbanhang/screen/category/category_controller.dart';
import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppState { LOADING, ERROR, DONE, UPDATING }

class ProductDetailController extends GetxController {
  ProductDetailController(this.id);
  var productdetail;
  var prod;
  var status = AppState.LOADING.obs;
  String id;
  var sortByShow = Sort.pho_bien.obs;
  var textSearch = "".obs;
  var page = 1.obs;
  var listAllProduct = [].obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getDetailProduct(int.parse(id));
  }

  Future<void> productSame(String id) async {
    final response = await API.share.GetAllProductByCatrgory(
        sortByShow.value.sortType, textSearch.value, int.parse(id));
    try {
      if (response.statusCode == 200) {
        var data = response.data["data"]["category"]["pro"];
        // print(data);
        // var datadefault = Pro.fromJson(data);
        page.value = 1;
        listAllProduct.clear();
        if (int.parse(id) == 195) {
          listAllProduct.addAll(data.map((e) => Pro.fromJson(e)));
        } else {
          for (var listPro in data) {
            if (listPro["pro"].length > 0) {
              listAllProduct.addAll(listPro["pro"].map((e) => Pro.fromJson(e)));
            }
          }
        }
        status.value = AppState.DONE;
        return;
      }
      status.value = AppState.LOADING;
    } catch (e) {
      status.value = AppState.DONE;
      print(e);
    }
  }

  Future<void> getDetailProduct(int id) async {
    final response = await API.share.GetDetailProduct(id);
    try {
      var data = response.data["data"];
      var datadefault = ProductDetail.fromJson(response.data);
      print("getDetailProduct ${datadefault.data!.item!.name}");
      productdetail = datadefault;
      // print(productdetail.statusCode);
      print(productdetail.data.item.id);
      if (response.statusCode != 200) {
        status.value = AppState.ERROR;
      } else {
        productSame(datadefault.data!.cateCurrent!.id!);
        status.value = AppState.DONE;
      }
    } catch (e) {
      print(e);
      status.value = AppState.LOADING;
    }
  }

  Future<void> addProductToCart() async {
    if (productdetail.data.cateCurrent.id != null) {
      var idOption;
      var listOption = [].obs;
      if (productdetail.data.sizeS.length > 0) {
        // print("${}");
        listOption.addAll(productdetail.data.sizeS);
        await Get.dialog(
          AlertDialog(
            title: Text("Chọn Loại sản phẩm"),
            content: Column(
              children: [
                Wrap(
                  children: listOption
                      .map((e) => InkWell(
                          onTap: () {
                            idOption = e.id;
                            Get.back();
                          },
                          child: Text(e.name)))
                      .toList(),
                )
              ],
            ),
          ),
        );
        if (idOption != null) {
          var productBox = ProductHive()
            ..id = idOption
            ..image = productdetail.data.item.image
            ..name = productdetail.data.item.name
            ..price = productdetail.data.item.price
            ..priceSale = productdetail.data.item.priceSale
            ..soluong = 1
            ..prodir = productdetail.data.item.proDir;
          HiveService.share.addBoxes(productBox);
          Get.dialog(
            AlertDialog(
              title: Text(
                "Thêm sản phẩm thành công",
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
          );

          await Future.delayed(Duration(seconds: 1));
          Navigator.of(Get.overlayContext!).pop();
          CartController cartController = Get.find();
          cartController.getListPro();
        }
      } else {
        var productBox = ProductHive()
          ..id = productdetail.data.item.id
          ..image = productdetail.data.item.image
          ..name = productdetail.data.item.name
          ..price = productdetail.data.item.price
          ..priceSale = productdetail.data.item.priceSale
          ..soluong = 1
          ..prodir = productdetail.data.item.proDir;
        HiveService.share.addBoxes(productBox);
        Get.dialog(
          AlertDialog(
            title: Text(
              "Thêm sản phẩm thành công",
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        );

        await Future.delayed(Duration(seconds: 1));
        Navigator.of(Get.overlayContext!).pop();
        CartController cartController = Get.find();
        cartController.getListPro();
      }
    }
  }

  Future<void> select() async {}

  // Future<void>
}
