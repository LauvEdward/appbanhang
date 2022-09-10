import 'package:appbanhang/@core/shared_preference.dart';
import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/profile.dart';
import 'package:appbanhang/model/user.dart';
import 'package:appbanhang/screen/account/account_controller.dart';
import 'package:appbanhang/screen/account/authen_service.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final AuthenticationController _authenticationController = Get.find();
  var user;
  var status = AppState.LOADING.obs;
  var profile;
  ProfileController(this.user);
  var olderTextController = TextEditingController();
  var newTextController = TextEditingController();
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await login();
  }

  AuthenticationState getState() {
    return _authenticationController.state;
  }

  Future<void> login() async {
    status.value = AppState.LOADING;
    final response = await API.share.postProfile(user);
    try {
      if (response.statusCode == 200) {
        var data = response.data["data"];
        // print(data);
        // var datadefault = Product.fromJson(response.data);
        // print("Number of list product ${datadefault.data!.length}");
        profile = Profile.fromJson(data);
        status.value = AppState.DONE;
      }
    } catch (e) {
      print(e);
      status.value = AppState.ERROR;
    }
  }

  void signOut() {
    AppSharePreference.share.removekey();
    _authenticationController.signOut();
  }

  Future<void> changePassword() async {
    Get.defaultDialog(
        title: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: olderTextController,
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'Nhập mật khẩu cũ',
                  hintMaxLines: 1,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 4.0))),
            ),
            Container(
              height: 20,
            ),
            TextField(
              controller: newTextController,
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'Nhập mật khẩu mới',
                  hintMaxLines: 1,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 4.0))),
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              onPressed: () async {
                final reponse = await API.share
                    .postLogin(profile.email, olderTextController.text);
                print(reponse.data['statusCode']);

                if (reponse.data['statusCode'] == 200) {
                  print("is Older password");
                  Map<String, String> map = {};
                  map["old_pass"] = olderTextController.text;
                  map["new_pass"] = newTextController.text;
                  final changeresponse = await API.share.changePassword(
                      olderTextController.text, newTextController.text);
                  if (changeresponse.data['statusCode'] == 200) {
                    Get.dialog(
                      AlertDialog(
                        title: Text(
                          "Thay đổi mật khẩu thành công",
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      ),
                    );
                    Get.back();
                    Get.back();
                  } else {
                    Get.dialog(
                      AlertDialog(
                        title: Text(
                          "Thay đổi mật khẩu thất bại",
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      ),
                    );
                  }
                } else {
                  print("is not older pass");
                  Get.dialog(
                    AlertDialog(
                      title: Text(
                        "Mật khẩu cũ không đúng",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                  );
                }
                // Get.back();
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
}
