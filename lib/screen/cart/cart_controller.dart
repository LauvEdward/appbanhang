import 'package:appbanhang/@core/hive_manager.dart';
import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/product_hive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CartController extends GetxController {
  var listPro;
  var listOrder = [].obs;
  var total = 0.obs;
  var numberOfItem = 0.obs;
  var affiliate = "".obs;
  var affiliateTextController = TextEditingController();
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
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
  }

  Future<void> addItem(ProductHive pro) async {
    var box = Hive.box('Cart');
    HiveService.share.addBoxes(pro);
    getListPro();
    update();
  }

  Future<void> removeItem(ProductHive pro) async {
    var box = Hive.box('Cart');
    HiveService.share.removeItem(pro.id!);
    getListPro();
    update();
  }

  Future<void> removeSoLuong(ProductHive pro) async {
    var box = Hive.box('Cart');
    HiveService.share.removeSoluong(pro.id!);
    getListPro();
    update();
  }

  Future<void> addAffiliate() async {
    Get.defaultDialog(
        title: 'Nhập mã liên kết',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: affiliateTextController,
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'Vui lòng nhập mã liên kết của bạn',
                  hintMaxLines: 1,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 4.0))),
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              onPressed: () {
                affiliate.value = affiliateTextController.text;
                affiliateTextController.clear();
                Get.back();
              },
              child: Text(
                'Lưu lại',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              color: Colors.redAccent,
            )
          ],
        ),
        radius: 10.0);
  }

  Future<bool> checkCart() async {
    Map<String, String> listCheckCategory = {};
    var listChecked = [];
    var log = [];
    for (var i = 0; i < listOrder.length; i++) {
      listCheckCategory["cart_data[${i}][product_id]"] = listOrder[i].id;
    }
    final response = await API.share.checkCart(listCheckCategory);
    try {
      if (response.statusCode == 200) {
        var data = response.data;
        // print(data);
        // var datadefault = Product.fromJson(response.data);
        // print("Number of list product ${datadefault.data!.length}");
        listChecked.addAll(data.map((e) => CheckCart.fromJson(e)));
      }
    } catch (e) {
      // status.value = AppState.ERROR;
    }
    for (var item in listChecked) {
      if (item.statusCode == 404) {
        log.add(item.message);
        var box = Hive.box('Cart');
        HiveService.share.removeItem(item.productId);
      }
    }
    getListPro();
    update();
    if (log.isNotEmpty) {
      Get.dialog(
        AlertDialog(
          title: Column(
            children: [
              Wrap(
                children: log.map((e) => Text(e)).toList(),
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("CLOSE"),
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
      );
      return false;
    } else {
      print("Dat hang");
      return true;
    }
  }
}

class CheckCart {
  String? productId;
  int? statusCode;
  String? message;

  CheckCart({this.productId, this.statusCode, this.message});

  CheckCart.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    statusCode = json['statusCode'];
    message = json['message'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}
