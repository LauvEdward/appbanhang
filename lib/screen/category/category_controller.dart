import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/product_detail.dart';
import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/category.dart';
import '../../model/product.dart';

enum Sort { pho_bien, moi_nhat, ban_chay, price_asc, price_desc }

extension SortType on Sort {
  String get name {
    switch (this) {
      case Sort.pho_bien:
        return 'Phổ biến';
      case Sort.moi_nhat:
        return 'Mới nhất';
      case Sort.ban_chay:
        return 'Bán chạy';
      case Sort.price_asc:
        return 'Giá cao';
      case Sort.price_desc:
        return 'Thấp';
    }
  }

  String get sortType {
    switch (this) {
      case Sort.pho_bien:
        return 'pho_bien';
      case Sort.moi_nhat:
        return 'moi_nhat';
      case Sort.ban_chay:
        return 'ban_chay';
      case Sort.price_asc:
        return 'price_asc';
      case Sort.price_desc:
        return 'price_desc';
    }
  }
}

class CategoryController extends GetxController {
  var textSearch = "".obs;
  var sortByShow = Sort.pho_bien.obs;
  var categoryCurrent = 0.obs;
  var page = 1.obs;
  var listProduct = [].obs;
  var listAllProduct = [].obs;
  var status = AppState.LOADING.obs;
  var isLoadingAll = false;
  TextEditingController textEditingControllerSearch = TextEditingController();
  // var isLoading
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getListCategory();
    await getAllCategory();
  }

  Future<void> getListCategory() async {
    final response = await API.share.GetCategory();
    try {
      if (response.statusCode == 200) {
        var data = response.data["data"];
        // print(data);
        // var datadefault = Product.fromJson(response.data);
        // print("Number of list product ${datadefault.data!.length}");
        listProduct.addAll(data.map((e) => CategoryProduct.fromJson(e)));
      }
    } catch (e) {
      print(e);
      // status.value = AppState.ERROR;
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

  // Future<void> getAllCategory() async {
  //   // status.value = AppState.LOADING;
  //   // all product
  //   final response = await API.share
  //       .GetAllProduct(sortByShow.value.sortType, textSearch.value, page.value);
  //   try {
  //     if (response.statusCode == 200) {
  //       var data = response.data["data"];
  //       print(data);
  //       // var datadefault = Pro.fromJson(data);
  //       print("getAllCategory ${data.length}");
  //       if (isLoadingAll == true) {
  //         page.value = 1;
  //         listAllProduct.clear();
  //         isLoadingAll = false;
  //       }
  //       listAllProduct.addAll(data.map((e) => Pro.fromJson(e)));
  //       status.value = AppState.DONE;
  //       return;
  //     }
  //     status.value = AppState.LOADING;
  //   } catch (e) {
  //     status.value = AppState.ERROR;
  //     print(e);
  //   }
  // }
  Future<void> getAllCategory() async {
    if (categoryCurrent.value == 0) {
      // status.value = AppState.LOADING;
      // all product
      final response = await API.share.GetAllProduct(
          sortByShow.value.sortType, textSearch.value, page.value);
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
          sortByShow.value.sortType, textSearch.value, categoryCurrent.value);
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
