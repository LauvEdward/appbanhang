import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/provice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  List<Provice> arrProvice = [];
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
}
