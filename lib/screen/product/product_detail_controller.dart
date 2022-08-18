import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/product_detail.dart';
import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:get/get.dart';

enum AppState { LOADING, ERROR, DONE, UPDATING }

class ProductDetailController extends GetxController {
  ProductDetailController(this.id);
  var productdetail;
  var status = AppState.LOADING.obs;
  String id;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getDetailProduct(int.parse(id));
  }

  Future<void> getDetailProduct(int id) async {
    final response = await API.share.GetDetailProduct(id);
    try {
      var data = response.data["data"];
      var datadefault = ProductDetail.fromJson(response.data);
      print("getDetailProduct ${datadefault.data!.item!.name}");
      productdetail = datadefault;
      // print(productdetail.statusCode);
      print(productdetail.data.item.id);
      if (response.statusCode != 200) {
        status.value = AppState.ERROR;
      } else {
        status.value = AppState.DONE;
      }
    } catch (e) {
      print(e);
      status.value = AppState.LOADING;
    }
  }
}
