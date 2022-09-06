import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/myorder.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MyorderController extends GetxController {
  var listOrder = [].obs;
  var status = AppState.LOADING.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getMyOrder();
  }

  Future<void> getMyOrder() async {
    final response = await API.share.getMyorder();
    try {
      final data = response.data["data"];
      listOrder.addAll(data.map((e) => MyOrderData.fromJson(e)));
      status.value = AppState.DONE;
    } catch (e) {
      print(e);
      status.value = AppState.ERROR;
    }
  }
}
