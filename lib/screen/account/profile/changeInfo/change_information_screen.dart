import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/component/empty_image_widget/saha_empty_image.dart';
import 'package:appbanhang/component/widget/product_order.dart';
import 'package:appbanhang/model/product_hive.dart';
import 'package:appbanhang/screen/account/profile/changeInfo/change_information_controller.dart';
import 'package:appbanhang/screen/account/register/list_provice_screen.dart';
import 'package:appbanhang/screen/account/register/register_controller.dart';
import 'package:appbanhang/screen/cart/confirmInformation/confirm_information_controller.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChangeInformationScreen extends StatefulWidget {
  bool? isAutoBackIcon;
  ChangeInformationScreen({Key? key, this.isAutoBackIcon}) : super(key: key);

  @override
  _ChangeInformationScreen createState() => _ChangeInformationScreen();
}

class _ChangeInformationScreen extends State<ChangeInformationScreen> {
  // final _passwordController = TextEditingController();
  // final _emailController = TextEditingController();
  final ChangeInformationController _controller =
      Get.put(ChangeInformationController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.status.value == AppState.DONE) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Xác nhận thông tin"),
          ),
          body: SingleChildScrollView(
            child: Container(
                child: Column(children: [
              address(),
            ])),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -15),
                  blurRadius: 20,
                  color: Color(0xFFDADADA).withOpacity(0.15),
                )
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            // cartController.getListPro();
                            // if (cartController.listPro != null) {
                            //   print((cartController.listPro as ProductHive).name);

                            //   // Get.to(() => ConfirmScreen());
                            // }
                          },
                          child: InkWell(
                            onTap: () async {
                              // _controller.order();
                            },
                            child: Container(
                              width: 120,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  border: Border.all(color: Colors.grey[200]!)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Lưu",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6!
                                            .color,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else if (_controller.status.value == AppState.LOADING) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else {
        return Scaffold(
          body: AlertDialog(
            content: Text("API ERROR"),
          ),
        );
      }
    });
  }

  Widget address() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 1),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Họ tên:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () async {
                  // if (_controller.provice.isEmpty) {
                  //   print("object");
                  // } else {
                  //   await _controller.getdistrict(_controller.proviceid.value);
                  //   Get.to(() => ListProvice(
                  //         provice: _controller.arrDistrict,
                  //         changeText: (String text, String id) {
                  //           _controller.district.value = text;
                  //         },
                  //       ));
                  // }
                },
                child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${_controller.name}"),
                          InkWell(
                              onTap: () {
                                _controller.changeProfile(1);
                                // Get.defaultDialog(
                                //     title: '',
                                //     content: Column(
                                //       mainAxisSize: MainAxisSize.min,
                                //       children: [
                                //         TextField(
                                //           // controller: settingsScreenController.categoryNameController,
                                //           keyboardType: TextInputType.text,
                                //           maxLines: 1,
                                //           decoration: InputDecoration(
                                //               labelText: 'Category Name',
                                //               hintMaxLines: 1,
                                //               border: OutlineInputBorder(
                                //                   borderSide: BorderSide(
                                //                       color: Colors.green,
                                //                       width: 4.0))),
                                //         ),
                                //         SizedBox(
                                //           height: 30.0,
                                //         ),
                                //         RaisedButton(
                                //           onPressed: () {

                                //           },
                                //           child: Text(
                                //             'Lưu',
                                //             style: TextStyle(
                                //                 color: Colors.white,
                                //                 fontSize: 16.0),
                                //           ),
                                //           color: Colors.redAccent,
                                //         )
                                //       ],
                                //     ),
                                //     radius: 10.0);
                              },
                              child: Icon(Icons.edit))
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Số điện thoại:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () async {
                  _controller.changeProfile(2);
                  // Get.defaultDialog(
                  //     title: '',
                  //     content: Column(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         TextField(
                  //           // controller: settingsScreenController.categoryNameController,
                  //           keyboardType: TextInputType.text,
                  //           maxLines: 1,
                  //           decoration: InputDecoration(
                  //               labelText: 'Category Name',
                  //               hintMaxLines: 1,
                  //               border: OutlineInputBorder(
                  //                   borderSide: BorderSide(
                  //                       color: Colors.green, width: 4.0))),
                  //         ),
                  //         SizedBox(
                  //           height: 30.0,
                  //         ),
                  //         RaisedButton(
                  //           onPressed: () {},
                  //           child: Text(
                  //             'Lưu',
                  //             style: TextStyle(
                  //                 color: Colors.white, fontSize: 16.0),
                  //           ),
                  //           color: Colors.redAccent,
                  //         )
                  //       ],
                  //     ),
                  //     radius: 10.0);
                },
                child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${_controller.phone}"),
                          Icon(Icons.edit)
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Tỉnh/ Thành phố:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                  onTap: () {
                    Get.to(() => ListProvice(
                          provice: _controller.arrProvice,
                          changeText: (String text, String id) {
                            _controller.district.value = "";
                            _controller.provice.value = text;
                            _controller.proviceid.value = id;
                          },
                        ));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_controller.provice.value == ""
                              ? "Chọn tỉnh thành phố"
                              : _controller.provice.value),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Chọn quận/ Huyện:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (_controller.provice.isEmpty) {
                    print("object");
                  } else {
                    await _controller.getdistrict(_controller.proviceid.value);
                    Get.to(() => ListProvice(
                          provice: _controller.arrDistrict,
                          changeText: (String text, String id) {
                            _controller.district.value = text;
                          },
                        ));
                  }
                },
                child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_controller.district.value == ""
                              ? "Chọn xã phường"
                              : _controller.district.value),
                          Icon(
                            Icons.arrow_drop_down,
                          )
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Địa chỉ:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                  onTap: () {
                    _controller.changeProfile(4);
                    // Get.defaultDialog(
                    //     title: '',
                    //     content: Column(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         TextField(
                    //           // controller: settingsScreenController.categoryNameController,
                    //           keyboardType: TextInputType.text,
                    //           maxLines: 1,
                    //           decoration: InputDecoration(
                    //               labelText: 'Category Name',
                    //               hintMaxLines: 1,
                    //               border: OutlineInputBorder(
                    //                   borderSide: BorderSide(
                    //                       color: Colors.green, width: 4.0))),
                    //         ),
                    //         SizedBox(
                    //           height: 30.0,
                    //         ),
                    //         RaisedButton(
                    //           onPressed: () {},
                    //           child: Text(
                    //             'Lưu',
                    //             style: TextStyle(
                    //                 color: Colors.white, fontSize: 16.0),
                    //           ),
                    //           color: Colors.redAccent,
                    //         )
                    //       ],
                    //     ),
                    //     radius: 10.0);
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${_controller.diachi}'),
                          Icon(Icons.edit)
                        ],
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Ghi chú:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () async {},
                child: Container(
                  height: 50,
                  child: TextField(
                    controller: _controller.ghichuTextController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.blueGrey),
                      ),
                      hintText: "Ghi chú",
                      hintStyle: const TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
