import 'package:appbanhang/screen/account/profile/myorder/myorder_controller.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyorderScreen extends StatefulWidget {
  const MyorderScreen({Key? key}) : super(key: key);
  @override
  _MyorderScreen createState() => _MyorderScreen();
}

class _MyorderScreen extends State<MyorderScreen> {
  MyorderController _controller = Get.put(MyorderController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx((() {
      if (_controller.status == AppState.LOADING) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else if (_controller.status == AppState.DONE) {
        return Scaffold(
          appBar: AppBar(
            title: Text('My order'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: _controller.listOrder
                  .map((element) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: Get.height / 5,
                          width: Get.width,
                          color: Colors.red,
                        ),
                      ))
                  .toList(),
            ),
          ),
        );
      } else {
        Get.back();
        return Container();
      }
    }));
  }
}
