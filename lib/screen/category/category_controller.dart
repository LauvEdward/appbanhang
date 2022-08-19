import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/category.dart';
import '../../model/product.dart';

class CategoryController extends GetxController {
  var isLoadingScreen = false.obs;
  var isLoadingCategory = false.obs;
  var isLoadingProduct = true.obs;
  var isLoadingProductMore = false.obs;
  var categories = RxList<Category>();
  var categoriesChild = RxList<Category>();
  var products = RxList<Product>();
  var categoryCurrent = (-1).obs;
  var categoryCurrentChild = (-1).obs;
  var textSearch = "".obs;
  var sortByShow = "pho_bien".obs;
  var descendingShow = true.obs;
  var page = 1.obs;
  var currentPage = 1;
  var isChooseDiscountSort = false.obs;
  var canLoadMore = true;
  var isDown = false.obs;
  String? sortByCurrent;

  TextEditingController textEditingControllerSearch = TextEditingController();
  var listProduct = [].obs;
  var listAllProduct = [].obs;
  var status = AppState.LOADING.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getListProduct();
    await getAllCategory();
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

  void init() {
    super.onInit();
    getAllCategory();
    searchProduct(
        search: textSearch.value,
        sortBy: sortByShow.value,
        descending: descendingShow.value,
        idCategory: categoryCurrent.value != -1 ? categoryCurrent.value : null);
  }

  void sortDiscount() async {
    if (isChooseDiscountSort.value) {
      List<Product> listProductDiscount = [];
      products.forEach((element) {
        // if (element.productDiscount != null) {
        //   listProductDiscount.add(element);
        // }
      });
      products(listProductDiscount);
    }
  }

  Future<bool?> searchProduct(
      {String? search,
      bool? descending,
      String? sortBy,
      int? idCategory,
      int? idCategoryChild,
      bool isLoadMore = false}) async {}

  void setCategoryCurrent(Category category) {
    categoryCurrent.value = category.id ?? -1;
    categoryCurrentChild.value = -1;
    if (category.id == null) {
      categoriesChild([]);
    } else {
      categoriesChild(category.listCategoryChild);
    }
  }

  void setCategoryCurrentChild(Category category) {
    isLoadingProduct.value = true;
    categoryCurrentChild.value = category.id ?? -1;
    if (category.id == null) {
      categoriesChild([]);
    } else {
      categoriesChild(category.listCategoryChild);
    }
  }

  Future<void> getAllCategory() async {
    final response = await API.share
        .GetAllProduct(sortByShow.value, textSearch.value, page.value);
    try {
      if (response.statusCode == 200) {
        var data = response.data["data"];
        print(data);
        // var datadefault = Pro.fromJson(data);
        print("getAllCategory ${data.length}");
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
}
