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

class ChangeInformationController extends GetxController {
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
  var cmndTextController = TextEditingController();
  var bankaccountTextController = TextEditingController();
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
  var birthday = "".obs;
  var bankAccount = "".obs;
  var cmnd = "".obs;

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
        if (proviceid.value != "") {
          provice.value = arrProvice
                  .where((element) => element.id == proviceid.value)
                  .first
                  .name ??
              "";
        }
        if (districtid.value != "") {
          await getdistrict(proviceid.value);
          district.value = arrDistrict
                  .where((element) => element.id == districtid.value)
                  .first
                  .name ??
              "";
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
        proviceid.value = profile.addressProvince;
        districtid.value = profile.addressDistrict;
        name.value = profile.fullname;
        phone.value = profile.phone;
        ghichu.value = profile.ghichu;
        diachi.value = profile.address;
        cmnd.value = profile.cmnd;
        bankAccount.value = profile.bankAccount;
        birthday.value = profile.birthday;
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
      case 5:
        textfieldController = cmndTextController;
        break;
      case 6:
        textfieldController = bankaccountTextController;
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
                    if (nameTextController.value.text == "") {
                      Get.dialog(
                        AlertDialog(
                          title: Text(
                            "Nhập tên của bạn",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      );
                      return;
                    }
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
                    if (diachiTextController.value.text == "") {
                      Get.dialog(
                        AlertDialog(
                          title: Text(
                            "Nhập Địa chỉ của bạn",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      );
                      return;
                    }
                    diachi.value = diachiTextController.text;
                    break;
                  case 5:
                    if (!cmndTextController.value.text.isNum) {
                      Get.dialog(
                        AlertDialog(
                          title: Text(
                            "Cmnd phải là số",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      );
                      return;
                    }
                    cmnd.value = cmndTextController.text;
                    break;
                  case 6:
                    if (!bankaccountTextController.value.text.isNum) {
                      Get.dialog(
                        AlertDialog(
                          title: Text(
                            "Số tài khoản phải là số",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      );
                      return;
                    }
                    bankAccount.value = bankaccountTextController.text;
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

  Future<void> changeInformationUser() async {
    final response = await API.share.profileUpdate(Profile(
        fullname: name.value,
        phone: phone.value,
        birthday: birthday.value,
        cmnd: cmnd.value,
        bankAccount: bankAccount.value,
        address: diachi.value,
        ghichu: ghichu.value,
        addressProvince: proviceid.value,
        addressDistrict: districtid.value));
    try {
      if (response.statusCode == 200) {
        Get.dialog(
          AlertDialog(
            title: Text(
              "Cập nhật thành công",
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        );
      } else {
        Get.dialog(
          AlertDialog(
            title: Text(
              "Cập nhật thất bại",
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        );
      }
    } catch (e) {
      Get.dialog(
        AlertDialog(
          title: Text(
            "Cập nhật thất bại",
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
      );
    }
  }
}
