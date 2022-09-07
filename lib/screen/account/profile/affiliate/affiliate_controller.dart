import 'dart:ffi';

import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/affiliate.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AffiliateController extends GetxController {
  var listaffiliate = [];
  var status = AppState.LOADING.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getAffiliate();
  }

  Future<void> getAffiliate() async {
    final response = await API.share.getAffiliate();
    try {
      if (response.statusCode == 200) {
        var data = response.data;
        var affiliate = promotion.fromJson(data);
        print(affiliate);
        listaffiliate.addAll(affiliate.data!.promotion!);
        status.value = AppState.DONE;
      }
    } catch (e) {
      print(e);
      status.value = AppState.ERROR;
    }
  }
}
