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
            title: Text('Đơn hàng'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: _controller.listOrder
                  .map((element) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(3.0)),
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Họ tên Đặt hàng:",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Container(
                                        width: 10,
                                      ),
                                      Text(
                                        element.fullname ?? "",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Địa chỉ giao hàng:",
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Container(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          element.address ?? "",
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Phương thức:",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Container(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          element.startplaces ?? "",
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
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
