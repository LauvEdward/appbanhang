import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/category.dart';
import 'package:appbanhang/model/product.dart';
import 'package:appbanhang/screen/home/model/news.dart';
import 'package:appbanhang/screen/home/model/news_detail.dart';
import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var listCategory = [].obs;
  var listProduct = [].obs;
  var listHotProduct = [].obs;
  var listNewProduct = [].obs;
  TextEditingController textEditingControllerSearch = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getListCategory();
    await getListProduct();
    await getListHotProduct();
    await getListNewProduct();
  }

  Future<void> getListProduct() async {
    final response = await API.share.GetListProduct();
    try {
      if (response.statusCode == 200) {
        var data = response.data["data"];
        // print(data);
        var datadefault = Product.fromJson(response.data);
        print("Number of list product ${datadefault.data!.length}");
        listProduct.addAll(
            datadefault.data!.map((e) => DataProduct.fromJson(e.toJson())));
      }
    } catch (e) {
      // status.value = AppState.ERROR;
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
        listCategory.addAll(data.map((e) => CategoryProduct.fromJson(e)));
      }
    } catch (e) {
      print(e);
      // status.value = AppState.ERROR;
    }
  }

  Future<void> getListHotProduct() async {
    final response = await API.share.GetHotProduct();
    var listTempHotProduct = [].obs;
    try {
      if (response.statusCode == 200) {
        var data = response.data["data"];
        // print(data);
        var datadefault = Product.fromJson(response.data);
        print("Number of list product ${datadefault.data!.length}");
        listTempHotProduct.addAll(
            datadefault.data!.map((e) => DataProduct.fromJson(e.toJson())));
        for (var item in listTempHotProduct) {
          if ((item as DataProduct).pro!.length > 0) {
            listHotProduct.add(item);
          }
        }
      }
    } catch (e) {
      // status.value = AppState.ERROR;
    }
  }

  Future<void> getListNewProduct() async {
    final response = await API.share.GetNewProduct();
    try {
      if (response.statusCode == 200) {
        var data = response.data["data"];
        // print(data);
        var datadefault = News.fromJson(response.data);
        print("Number of new product ${datadefault.data!.length}");
        listNewProduct.addAll(
            datadefault.data!.map((e) => DataNews.fromJson(e.toJson())));
      }
    } catch (e) {
      // status.value = AppState.ERROR;
    }
  }
}
