import 'package:appbanhang/@core/hive_manager.dart';
import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/product_detail.dart';
import 'package:appbanhang/model/product_hive.dart';
import 'package:appbanhang/screen/cart/cart_controller.dart';
import 'package:appbanhang/screen/category/category_controller.dart';
import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

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
  var listImage = [].obs;
  var commentTextController = TextEditingController();
  var nameTextController = TextEditingController();
  var emailTextController = TextEditingController();
  var rating = 3.obs;

  var listcomments = [].obs;
  var firstHalf;
  var secondHalf;
  var listProductSeen = [].obs;
  var flag = true;
  var listOrder = [].obs;
  var numberOfItem = 0.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getDetailProduct(int.parse(id));
    await getListPro();
  }

  Future<void> getListPro() async {
    listOrder.clear();
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
      numberOfItem.value = listOrder.length;
    }
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
      // status.value = AppState.LOADING;
    } catch (e) {
      status.value = AppState.DONE;
      print(e);
    }
  }

  Future<void> getDetailProduct(int id) async {
    listImage.clear();
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
        await productSame(datadefault.data!.cateCurrent!.id!);
        // listImage.addAll(datadefault.data!.pImages!);
        // print("${datadefault.data!.pImages!.length}");
        for (var item in datadefault.data!.pImages!) {
          listImage.add(API.share.baseSite + "/${item.image}");
        }
        listcomments.addAll(productdetail.data.comments);
        if (productdetail.data.item.configPro.first.content.length > 500) {
          firstHalf =
              productdetail.data.item.configPro.first.content.substring(0, 500);
          secondHalf = productdetail.data.item.configPro.first.content
              .substring(
                  500, productdetail.data.item.configPro.first.content.length);
        } else {
          firstHalf = productdetail.data.item.configPro.first.content;
          secondHalf = "";
        }
        var productBox = ProductHive()
          ..id = productdetail.data.item.id
          ..image = productdetail.data.item.image
          ..name = productdetail.data.item.name
          ..price = productdetail.data.item.price
          ..priceSale = productdetail.data.item.priceSale
          ..soluong = 1
          ..prodir = productdetail.data.item.proDir
          ..keyid = productdetail.data.item.id;
        HiveService.share.addSeenBoxes(productBox);
        Box<dynamic> box1 = Hive.box<dynamic>('Seen');
        // listProductSeen.clear();
        if (box1.isNotEmpty) {
          var listtemp = [].obs;
          listProductSeen.addAll(box1.values);
          // if (listtemp.length > 5) {
          //   listProductSeen.clear();
          //   listProductSeen.value = listtemp.sublist(5);
          // }
          // use data
          // for (var item in listProductSeen) {
          //   total.value += int.parse(item.priceSale) * (item.soluong as int);
          // }
          // numberOfItem.value = listOrder.length;
        }
        status.value = AppState.DONE;
      }
    } catch (e) {
      print(e);
      status.value = AppState.ERROR;
    }
  }

  Future<void> addProductToCart() async {
    // if (productdetail.data.cateCurrent.id != null) {
    var listOption = [].obs;
    var price = 0.obs;
    var soLuong = 1.obs;
    var idOption;
    var priceTemp = (-1).obs;
    var soLuongTemp = 1.obs;
    var idOptionTemp;
    var namesize;
    var nameTemp;
    final oCcy = new NumberFormat("#,##0", "en_US");
    if (productdetail.data.sizeS.length > 0 ||
        productdetail.data.sizeSType.length > 0) {
      if (productdetail.data.sizeS.length > 0) {
        listOption.addAll(productdetail.data.sizeS);
      } else {
        listOption.addAll(productdetail.data.sizeSType);
      }
      print(listOption);
      await Get.bottomSheet(
        Container(
          color: Colors.white,
          width: Get.width,
          // height: Get.height / 2.5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      width: Get.width / 4,
                      height: Get.width / 4,
                      child: CachedNetworkImage(
                        imageUrl: API.share.baseSite +
                            '/upload/img/products' +
                            '/${productdetail.data.item.proDir}' +
                            '/${productdetail.data.item.image}',
                      ),
                    ),
                    Obx(() => Text(priceTemp.value == -1
                        ? "Liên hệ"
                        : "${oCcy.format(priceTemp.value)}đ"))
                  ],
                ),
                Text("Phân loại"),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: listOption
                          .map((e) => InkWell(
                                onTap: () {
                                  priceTemp.value = int.parse(e.priceSale);
                                  idOptionTemp = e.id;
                                  nameTemp = e.name;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: priceTemp.value ==
                                                int.parse(e.priceSale)
                                            ? Border.all(color: Colors.blue)
                                            : Border.all(
                                                color: Colors.grey[300]!),
                                        // color: Colors.white10,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(e.name),
                                      )),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                Text("Số lượng"),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          if (soLuongTemp > 1) {
                            soLuongTemp -= 1;
                          }
                          // CartController cartController = Get.find();
                          // if (pro.soluong! > 1) {
                          //   cartController.removeSoLuong(pro);
                          // } else {
                          //   cartController.removeItem(pro);
                          // }
                        },
                        child: Container(
                          height: 25,
                          width: 30,
                          child: Icon(
                            Icons.remove,
                            size: 13,
                            color: Colors.grey,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[200]!),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 25,
                          width: 40,
                          child: Container(
                            child: Obx(
                              () => Center(
                                child: Text(
                                  '${soLuongTemp}',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[200]!),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          soLuongTemp += 1;
                          // CartController cartController = Get.find();
                          // cartController.addItem(pro);
                        },
                        child: Container(
                          height: 25,
                          width: 30,
                          child: Icon(
                            Icons.add,
                            size: 13,
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[200]!),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                      child: FlatButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            soLuong = soLuongTemp;
                            price = priceTemp;
                            idOption = idOptionTemp;
                            namesize = nameTemp;
                            Get.back();
                          },
                          child: Text("Thêm vào"))),
                )
              ],
            ),
          ),
        ),
      );
      if (idOption != null) {
        var productBox = ProductHive()
          ..id = productdetail.data.item.id
          ..image = productdetail.data.item.image
          ..name = productdetail.data.item.name
          ..price = productdetail.data.item.price
          ..priceSale = priceTemp.value.toString()
          ..soluong = soLuong.value
          ..prodir = productdetail.data.item.proDir
          ..sizeid = idOption
          ..nameSize = namesize
          ..keyid = productdetail.data.item.id + (idOption ?? "");
        HiveService.share.addBoxes(productBox);
        Get.dialog(
          AlertDialog(
            title: Text(
              "Thêm sản phẩm thành công",
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        );
        await getListPro();
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
        ..prodir = productdetail.data.item.proDir
        ..sizeid = ""
        ..nameSize = ""
        ..keyid = productdetail.data.item.id + (idOption ?? "");
      HiveService.share.addBoxes(productBox);
      Get.dialog(
        AlertDialog(
          title: Text(
            "Thêm sản phẩm thành công",
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
      );
      await getListPro();
      await Future.delayed(Duration(seconds: 1));
      Navigator.of(Get.overlayContext!).pop();
      CartController cartController = Get.find();
      cartController.getListPro();
    }
    // }
  }

  Future<void> sendComment() async {
    if (nameTextController.text == "") {
      Get.dialog(
        AlertDialog(
          title: Text(
            "Vui lòng nhập tên",
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
      );
      return;
    }
    if (commentTextController.text == "") {
      Get.dialog(
        AlertDialog(
          title: Text(
            "Nhập bình luận",
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
      );
      return;
    }
    if (emailTextController.text == "") {
      Get.dialog(
        AlertDialog(
          title: Text(
            "Nhập email",
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
      );
      return;
    }
    FocusManager.instance.primaryFocus!.unfocus();
    final response = await API.share.summitComment(
        productdetail.data.item.id,
        nameTextController.text,
        emailTextController.text,
        commentTextController.text,
        rating.value);
    if (response.statusCode == 200) {
      Get.dialog(
        AlertDialog(
          title: Text(
            "Đã thêm bình luận",
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
      );
      emailTextController.clear();
      nameTextController.clear();
      commentTextController.clear();

      await Future.delayed(Duration(seconds: 1));
      Navigator.of(Get.overlayContext!).pop();
    }
  }

  // Future<void>
}
