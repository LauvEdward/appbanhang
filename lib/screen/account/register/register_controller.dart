import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/provice.dart';
import 'package:get/get.dart';

class MyRegisterController extends GetxController {
  List<Provice> arrProvice = [];
  var provice = "".obs;
  var proviceid = "".obs;
  var district = "".obs;
  var districtid = "".obs;
  List<District> arrDistrict = [];
  @override
  void onInit() async {
    super.onInit();
    await getProvice();
  }

  Future<void> getProvice() async {
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
        // arrProvice.addAll(data.map((e) => Provice.fromJson(e)));
      }
    } catch (e) {
      print(e);
      // status.value = AppState.ERROR;
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
}
