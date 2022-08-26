import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/profile.dart';
import 'package:appbanhang/model/provice.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';

class MyRegisterController extends GetxController {
  var status = AppState.LOADING.obs;
  List<Provice> arrProvice = [];
  var provice = "".obs;
  var proviceid = "".obs;
  var district = "".obs;
  var districtid = "".obs;
  List<District> arrDistrict = [];
  // information user
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  var fullnameTextController = TextEditingController();
  var phoneTextController = TextEditingController();
  var bankAccountTextController = TextEditingController();
  var ghichuTextController = TextEditingController();
  var sex;
  var passwordVisible = false.obs;
  var selectedGender;
  var gender = ["Male", "Female", "Other"];

  var select;
  void onClickRadioButton(value) {
    print(value);
    select = value;
    selectedGender = gender.indexOf(value);
    update();
  }

  @override
  void onInit() async {
    super.onInit();
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

  Future<void> registerUser() async {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              strokeWidth: 10,
            ),
          ),
        ),
      ),
    );
    final response = await API.share.registerUser(Profile.userinfo(
        emailTextController.text,
        passwordTextController.text,
        fullnameTextController.text,
        phoneTextController.text,
        bankAccountTextController.text,
        ghichuTextController.text,
        sex,
        proviceid.value));
    try {
      if (response.data['statusCode'] == 200) {
        await openAndCloseLoadingDialog(
            "Bạn sẽ phải đăng nhập lại", "Đăng kí thành công");
      } else {
        await openAndCloseLoadingDialog(
            response.data['message'], "Đăng kí thất bại");
      }
    } catch (e) {
      print(e);
      // status.value = AppState.ERROR;
    }
  }

  Future<void> openAndCloseLoadingDialog(String text, String title) async {
    // Dismiss CircularProgressIndicator
    Navigator.of(Get.overlayContext!).pop();
    Get.dialog(
      AlertDialog(
        title: Text(
          title,
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
        content: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 13),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("CLOSE"),
            onPressed: () {
              Get.back();
              if (title == "Đăng kí thành công") {
                Get.back();
              }
            },
          )
        ],
      ),
      // barrierDismissible: false,
    );
    // if (title == "Đăng kí thành công") {
    //   await Future.delayed(Duration(seconds: 1));
    //   Get.back();
    //   Get.back();

    // Get.back();
    // await Future.delayed(Duration(seconds: 3));
    // Navigator.of(Get.overlayContext).pop();
  }
}
