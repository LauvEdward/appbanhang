import 'package:appbanhang/screen/home/model/prduct.dart';
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
  var sortByShow = "views".obs;
  var descendingShow = true.obs;
  var currentPage = 1;
  var isChooseDiscountSort = false.obs;
  var canLoadMore = true;
  var isDown = false.obs;
  String? sortByCurrent;

  TextEditingController textEditingControllerSearch = TextEditingController();

  CategoryController() {
    // final DataAppCustomerController dataAppCustomerController = Get.find();
    // if (dataAppCustomerController.inputModelProducts != null &&
    //     dataAppCustomerController.inputModelProducts!.categoryId != null) {
    //   categoryCurrent.value =
    //   dataAppCustomerController.inputModelProducts!.categoryId!;
    //   if (mapTypeActionSort[
    //   dataAppCustomerController.inputModelProducts!.filterProducts] ==
    //       "discount") {
    //     isChooseDiscountSort.value = true;
    //   } else if (mapTypeActionSort[
    //   dataAppCustomerController.inputModelProducts!.filterProducts] !=
    //       null) {
    //     sortByShow.value = mapTypeActionSort[
    //     dataAppCustomerController.inputModelProducts!.filterProducts];
    //   }
    // }
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

  Future<void> getAllCategory() async {}
}
