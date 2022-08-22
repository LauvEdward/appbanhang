import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/screen/category/category_controller.dart';
import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/category.dart';
import '../../model/product.dart';

class CategoryFilterController extends GetxController {
  var textSearch = "".obs;
  var sortByShow = Sort.pho_bien.toString().obs;
  var categoryCurrent = (-1).obs;
  var page = 1.obs;
  var categoryid = "".obs;

  TextEditingController textEditingControllerSearch = TextEditingController();
  var listProduct = [].obs;
  var listAllProduct = [].obs;
  var status = AppState.LOADING.obs;
  var isLoadingAll = false;
  // var isLoading
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getAllCategoryByCategory() async {
    final response = await API.share.GetAllProductByCatrgory(
        sortByShow.value, textSearch.value, int.parse(categoryid.value));
    try {
      if (response.statusCode == 200) {
        var data = response.data["data"]["child"];
        print(data);
        // var datadefault = Pro.fromJson(data);
        print("getAllCategory ${data.length}");
        listAllProduct.clear();
        listAllProduct.addAll(data.map((e) => Pro.fromJson(e)));
        status.value = AppState.DONE;
        return;
      }
      status.value = AppState.LOADING;
    } catch (e) {
      status.value = AppState.ERROR;
      print(e);
    }
  }

  Future<void> getListProduct() async {
    final response = await API.share.GetListProduct();
    try {
      if (response.statusCode == 200) {
        var data = response.data["data"];
        // print(data);
        // var datadefault = Product.fromJson(response.data);
        // print("Number of list product ${datadefault.data!.length}");
        listProduct.addAll(data.map((e) => Product.fromJson(e.toJson())));
      }
    } catch (e) {
      // status.value = AppState.ERROR;
    }
  }

  Future<void> getAllCategory() async {
    if (categoryid == null || categoryid == "") {
      // status.value = AppState.LOADING;
      // all product
      final response = await API.share
          .GetAllProduct(sortByShow.value, textSearch.value, page.value);
      try {
        if (response.statusCode == 200) {
          var data = response.data["data"];
          print(data);
          // var datadefault = Pro.fromJson(data);
          print("getAllCategory ${data.length}");
          if (isLoadingAll == true) {
            page.value = 1;
            listAllProduct.clear();
            isLoadingAll = false;
          }
          listAllProduct.addAll(data.map((e) => Pro.fromJson(e)));
          status.value = AppState.DONE;
          return;
        }
        status.value = AppState.LOADING;
      } catch (e) {
        status.value = AppState.ERROR;
        print(e);
      }
    } else {
      // status.value = AppState.LOADING;
      final response = await API.share.GetAllProductByCatrgory(
          sortByShow.value, textSearch.value, int.parse(categoryid.value));
      try {
        if (response.statusCode == 200) {
          var data = response.data["data"]["child"];
          print(data);
          // var datadefault = Pro.fromJson(data);
          print("getAllCategory ${data.length}");
          listAllProduct.clear();
          for (var listPro in data) {
            if (listPro["pro"].length > 0) {
              listAllProduct.addAll(listPro["pro"].map((e) => Pro.fromJson(e)));
            }
          }
          print("======> ${listAllProduct.length}");
          status.value = AppState.DONE;
          // return;
        }
        // status.value = AppState.LOADING;
      } catch (e) {
        status.value = AppState.ERROR;
        print(e);
      }
    }
  }
}
