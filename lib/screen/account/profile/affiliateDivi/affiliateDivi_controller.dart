import 'dart:ffi';

import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/affiliateDivi.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AffiliateDivi extends GetxController {
  var affiliate;
  var arrorder = [];
  var status = AppState.LOADING.obs;
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getAffiliateDivi();
  }

  Future<void> getAffiliateDivi() async {
    try {
      final response = await API.share.getAffiliateDivi();
      affiliate = affiliateDivi.fromJson(response.data);
      for (var item in affiliate.data.order) {
        arrorder.add(item);
      }
      status.value = AppState.DONE;
    } catch (e) {
      await Get.dialog(
        AlertDialog(
          // title: ,
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text("Hiện tại bạn mã giảm nào"),
              ),
              RaisedButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                child: Text("Quay lại"),
              )
            ],
          ),
        ),
      );
      status.value = AppState.ERROR;
      print(e);
    }
  }
}
