import 'package:appbanhang/@core/hive_manager.dart';
import 'package:appbanhang/@core/shared_preference.dart';
import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/profile.dart';
import 'package:appbanhang/model/provice.dart';
import 'package:appbanhang/model/user.dart';
import 'package:appbanhang/screen/cart/cart_controller.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ConfirmController extends GetxController {
  var listPro;
  var listOrder = [].obs;
  var total = 0.obs;
  var numberOfItem = 0.obs;
  var status = AppState.LOADING.obs;
  var profile;
  var nameTextController = TextEditingController();
  var phoneTextController = TextEditingController();
  var diachiTextController = TextEditingController();
  var ghichuTextController = TextEditingController();
  List<Provice> arrProvice = [];
  List<District> arrDistrict = [];
  var provice = "".obs;
  var proviceid = "".obs;
  var district = "".obs;
  var districtid = "".obs;
  var name = "".obs;
  var phone = "".obs;
  var diachi = "".obs;
  var ghichu = "".obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getProfile();
    await getListPro();
    await getProvice();
  }

  Future<void> getProvice() async {
    status.value = AppState.LOADING;
    final response = await API.share.getProvice();
    try {
      if (response.statusCode == 200) {
        var data = response.data["data"];
        // print(data);
        // var datadefault = Product.fromJson(response.data);
        // print("Number of list product ${datadefault.data!.length}");
        arrProvice.clear();
        for (var item in data) {
          arrProvice.add(Provice.fromJson(item));
        }
        status.value = AppState.DONE;
        // arrProvice.addAll(data.map((e) => Provice.fromJson(e)));
      }
    } catch (e) {
      print(e);
      status.value = AppState.ERROR;
    }
  }

  Future<void> getdistrict(String proviceId) async {
    final response = await API.share.getDistrict(int.parse(proviceId));
    try {
      if (response.statusCode == 200) {
        var data = response.data["data"];
        arrDistrict.clear();
        for (var item in data) {
          arrDistrict.add(District.fromJson(item));
        }
      }
    } catch (e) {
      print(e);
      // status.value = AppState.ERROR;
    }
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
    status.value = AppState.DONE;
  }

  Future<void> getProfile() async {
    String? token = await AppSharePreference.share.getTokenSharePreference();
    try {
      final response =
          await API.share.postProfile(User(token, password: "", email: ""));
      if (response.statusCode == 200) {
        var data = response.data["data"];
        // print(data);
        // var datadefault = Product.fromJson(response.data);
        // print("Number of list product ${datadefault.data!.length}");
        profile = Profile.fromJson(data);
        name.value = profile.fullname;
        phone.value = profile.phone;
        ghichu.value = profile.ghichu;
        diachi.value = profile.address;
        status.value = AppState.DONE;
      }
    } catch (e) {
      print(e);
      status.value = AppState.ERROR;
    }
  }

  Future<void> changeProfile(int option) async {
    var textfieldController;
    switch (option) {
      case 1:
        textfieldController = nameTextController;
        break;
      case 2:
        textfieldController = phoneTextController;
        break;
      case 3:
        textfieldController = ghichuTextController;
        break;
      case 4:
        textfieldController = diachiTextController;
        break;
      default:
    }
    Get.defaultDialog(
        title: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textfieldController,
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'Nhập thông tin',
                  hintMaxLines: 1,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 4.0))),
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              onPressed: () {
                switch (option) {
                  case 1:
                    name.value = nameTextController.text;
                    break;
                  case 2:
                    if (!phoneTextController.value.text.isNum) {
                      Get.dialog(
                        AlertDialog(
                          title: Text(
                            "Số điện thoại phải là số",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      );
                      return;
                    }

                    phone.value = phoneTextController.text;
                    break;
                  case 3:
                    ghichu.value = nameTextController.text;
                    break;
                  case 4:
                    diachi.value = diachiTextController.text;
                    break;
                  default:
                }

                Get.back();
              },
              child: Text(
                'Lưu',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              color: Colors.redAccent,
            )
          ],
        ),
        radius: 10.0);
  }

  Future<void> order() async {
    Map<String, Object> product = {};
    if (name.value == "") {
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
    if (diachi.value == "") {
      Get.dialog(
        AlertDialog(
          title: Text(
            "Vui lòng địa chỉ",
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
      );
      return;
    }
    if (phone.value == "") {
      Get.dialog(
        AlertDialog(
          title: Text(
            "Vui lòng nhập số điện thoại",
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
      );
      return;
    }
    for (var i = 0; i < listOrder.length; i++) {
      product["cart_data[${i}][product_id]"] = listOrder[i].id;
      product["cart_data[${i}][qty]"] = listOrder[i].soluong;
      // product["size_id"] = "";
    }
    // for (var item in listOrder) {
    //   print(item.soluong);
    //   product["cart_data[${0}][product_id]"] = item.id;
    //   product["qly"] = item.soluong;
    //   product["size_id"] = "";
    // }
    product["fullname"] = name.value;
    product["address"] = diachi.value;
    product["phone"] = phone.value;
    product["province"] = proviceid.value;
    product["district"] = districtid.value;
    product["note"] = ghichuTextController.text;
    Get.dialog(
      AlertDialog(
        title: Column(
          children: [
            Center(
              child: Container(
                  width: 50, height: 50, child: CircularProgressIndicator()),
            ),
            Text("đặt hàng  ...")
          ],
        ),
      ),
    );
    try {
      final response = await API.share.checkoutCart(product);
      if (response.statusCode == 200) {
        Navigator.of(Get.overlayContext!).pop();
        Get.dialog(
          AlertDialog(
            title: Text(
              "Đặt hàng thành công",
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        );

        await Future.delayed(Duration(seconds: 1));
        Navigator.of(Get.overlayContext!).pop();
        for (var item in listOrder) {
          var box = Hive.box('Cart');
          HiveService.share.removeItem(item.id);
        }
        CartController controller = Get.find();
        controller.getListPro();
        controller.update();
        Get.back();
      } else {
        print("Fail");
      }
    } catch (e) {
      Get.dialog(
        AlertDialog(
          title: Text(
            "Đặt hàng chưa thành công",
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
      );
      return;
      print("error ${e}");
    }
  }
}
