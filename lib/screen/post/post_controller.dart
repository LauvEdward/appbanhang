import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/news.dart';
import 'package:appbanhang/screen/home/model/news.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PostController extends GetxController {
  var page = 1.obs;
  var search = "".obs;
  var listNews = [].obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getListNew();
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
