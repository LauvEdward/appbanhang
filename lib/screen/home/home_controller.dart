import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/banner.dart';
import 'package:appbanhang/model/category.dart';
import 'package:appbanhang/model/product.dart';
import 'package:appbanhang/screen/home/model/news.dart';
import 'package:appbanhang/screen/home/model/news_detail.dart';
import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var listCategory = [].obs;
  var listProduct = [].obs;
  var listHotProduct = [].obs;
  var listNewProduct = [].obs;
  var listBanner = [].obs;
  TextEditingController textEditingControllerSearch = TextEditingController();
  var appStatus = AppState.LOADING.obs;
  var listTempHotProduct = [].obs;
  var nameShop = "".obs;
  var address = "".obs;
  var phone = "".obs;
  var email = "".obs;
  var linkfb = "".obs;
  var linksitepage = "".obs;
  var linkyt = "".obs;
  var copyRight = "".obs;

  Future<void> getContact() async {
    final reponse = await API.share.getcontact();
    try {
      nameShop.value = reponse.data["site_name"];
      address.value = reponse.data["address"];
      phone.value = reponse.data["hotline1"];
      email.value = reponse.data["site_email"];
      linkyt.value = reponse.data["link_youtube"];
      linkfb.value = reponse.data["face_id"];
      linksitepage.value = reponse.data["site_fanpage"];
      copyRight.value = reponse.data["coppy_right"];
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getListCategory();
    await getListProduct();
    await getListHotProduct();
    await getListNewProduct();
    await getListbanner();
    await getContact();
  }

  Future<void> getListbanner() async {
    final response = await API.share.Getbanner();
    try {
      if (response.statusCode == 200) {
        // var data = response.data["data"];
        // print(data);
        var datadefault = banner.fromJson(response.data);
        print("data banner ${datadefault.data!.length}");
        for (var item in datadefault.data!) {
          listBanner.add(API.share.baseSite + "/${item.image}");
        }
        appStatus.value = AppState.DONE;
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
        var datadefault = Product.fromJson(response.data);
        print("Number of list product ${datadefault.data!.length}");
        listProduct.addAll(
            datadefault.data!.map((e) => DataProduct.fromJson(e.toJson())));
      }
    } catch (e) {
      print(e);
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

  List getListPro(String name) {
    var listTempProHot = [].obs;
    var listProHot =
        listTempHotProduct.where((p0) => p0.name == name).toList().first;
    listTempProHot.addAll(listProHot.pro);
    return listTempProHot;
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
