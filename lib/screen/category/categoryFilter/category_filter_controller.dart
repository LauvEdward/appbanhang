import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/category.dart';
import 'package:appbanhang/model/categoryFilter.dart';
import 'package:appbanhang/screen/category/category_controller.dart';
import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryFilterController extends GetxController {
  var textSearch = "".obs;
  var sortByShow = Sort.pho_bien.obs;
  var categoryCurrent = (-1).obs;
  var page = 1.obs;
  var categoryid = 0.obs;

  TextEditingController textEditingControllerSearch = TextEditingController();
  var listProduct = [].obs;
  var listAllProduct = [].obs;
  var status = AppState.LOADING.obs;
  var isLoadingAll = false;
  var categorysubid = 0.obs;
  var sortPrices = Sort.price_asc.obs;
  // var isLoading
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    // await getAllCategoryByCategory();
  }

  Future<void> getAllCategoryByCategory() async {
    // status.value = AppState.LOADING;
    if (categoryid.value == 0) {
      final response = await API.share.GetAllProduct(
          sortByShow.value.sortType, textSearch.value, page.value);
      try {
        if (response.statusCode == 200) {
          var data = response.data["data"];
          // print(data);
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
      final response = await API.share.GetAllProductByCatrgory(
          sortByShow.value.sortType, textSearch.value, categoryid.value);
      if (response.statusCode == 200) {
        var data = response.data["data"]["category"]["pro"];
        // print(data);
        // var datadefault = Pro.fromJson(data);
        listAllProduct.clear();
        listProduct.clear();
        try {
          var dataPro = data.first["pro"];
          // print(dataPro);
          if (dataPro != null) {
            for (var listPro in data) {
              listProduct.add(ProCa.fromJson(listPro));
              // if (listPro["pro"].length > 0) {
              //   listAllProduct.addAll(listPro["pro"].map((e) => Pro.fromJson(e)));
              // }
            }
            categorysubid.value = int.parse(listProduct.first.id);
            getListProByCate(int.parse(listProduct.first.id));
          } else {
            listAllProduct.addAll(data.map((e) => Pro.fromJson(e.toJson())));
          }
          // listProduct.addAll(data.map((e) => Category.fromJson(e)));

        } catch (e) {
          listAllProduct.addAll(data.map((e) => Pro.fromJson(e)));
        }

        status.value = AppState.DONE;
        // return;
      }
    }
  }

  Future<void> getListProByCate(int id) async {
    listAllProduct.clear();
    for (var item in listProduct) {
      if (int.tryParse(item.id) == id) {
        for (var pro in item.pro) {
          listAllProduct.add(Pro.fromJson(pro.toJson()));
        }
      }
    }
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
        status.value = AppState.DONE;
      }
    } catch (e) {
      print(e);
      status.value = AppState.ERROR;
    }
  }
  // Future<void> getListProduct() async {
  //   final response = await API.share.GetListProduct();
  //   try {
  //     if (response.statusCode == 200) {
  //       var data = response.data["data"];
  //       // print(data);
  //       // var datadefault = Product.fromJson(response.data);
  //       // print("Number of list product ${datadefault.data!.length}");
  //       listProduct.addAll(data.map((e) => Product.fromJson(e.toJson())));
  //     }
  //   } catch (e) {
  //     // status.value = AppState.ERROR;
  //   }
  // }

  // Future<void> getAllCategory() async {
  //   final response = await API.share.GetAllProductByCatrgory(
  //       sortByShow.value.sortType,
  //       textSearch.value,
  //       int.parse(categoryid.value));
  //   try {
  //     if (response.statusCode == 200) {
  //       var data = response.data["data"]["child"];
  //       print(data);
  //       // var datadefault = Pro.fromJson(data);
  //       print("getAllCategory ${data.length}");
  //       listAllProduct.clear();
  //       for (var listPro in data) {
  //         if (listPro["pro"].length > 0) {
  //           listAllProduct.addAll(listPro["pro"].map((e) => Pro.fromJson(e)));
  //         }
  //       }
  //       print("======> ${listAllProduct.length}");
  //       status.value = AppState.DONE;
  //       // return;
  //     }
  //     // status.value = AppState.LOADING;
  //   } catch (e) {
  //     status.value = AppState.ERROR;
  //     print(e);
  //   }
  // }
}
