import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/news.dart';
import 'package:appbanhang/screen/home/model/news.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PostController extends GetxController {
  var page = 1.obs;
  var search = "".obs;
  var listNews = [].obs;
  var numberOfItem = 0.obs;
  var listOrder = [].obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getListNew();
    // await getListPro();
  }

  Future<void> getListPro() async {
    listOrder.clear();
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
      numberOfItem.value = listOrder.length;
    }
  }

  Future<void> getListNew() async {
    final response = await API.share.GetListNew(page.value, search.value);
    try {
      if (response.statusCode == 200) {
        var data = response.data["data"];
        // print(data);
        var datadefault = NewsPost.fromJson(response.data);
        print("Number of post ${datadefault.data!.length}");
        listNews.addAll(
            datadefault.data!.map((e) => NewsPostData.fromJson(e.toJson())));
      }
    } catch (e) {
      // status.value = AppState.ERROR;
    }
  }
}
