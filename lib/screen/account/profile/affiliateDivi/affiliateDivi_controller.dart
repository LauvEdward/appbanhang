import 'dart:ffi';

import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/affiliateDivi.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
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
      status.value = AppState.ERROR;
      print(e);
    }
  }
}
