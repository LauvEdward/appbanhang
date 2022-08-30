import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/news_detail.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController {
  var id;
  var data;
  var status = AppState.LOADING.obs;
  PostDetailController(this.id);
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getNewsDetail();
  }

  Future<void> getNewsDetail() async {
    final response = await API.share.GetNewsDetail(id);
    try {
      // var data = response.data["data"];
      // print(response.data);
      data = NewsDetailsData.fromJson(response.data["data"]);
      if (response.statusCode != 200) {
        status.value = AppState.ERROR;
      } else {
        status.value = AppState.DONE;
      }
    } catch (e) {
      print(e);
      status.value = AppState.ERROR;
    }
  }

  void updateid(int id) {
    this.id.value = id;
  }
}
