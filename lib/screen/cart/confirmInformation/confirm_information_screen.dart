import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/component/empty_image_widget/saha_empty_image.dart';
import 'package:appbanhang/component/widget/product_order.dart';
import 'package:appbanhang/model/product_hive.dart';
import 'package:appbanhang/screen/account/register/list_provice_screen.dart';
import 'package:appbanhang/screen/account/register/register_controller.dart';
import 'package:appbanhang/screen/cart/confirmInformation/confirm_information_controller.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ConfirmInformationScreen extends StatefulWidget {
  bool? isAutoBackIcon;
  ConfirmInformationScreen({Key? key, this.isAutoBackIcon}) : super(key: key);

  @override
  _ConfirmInformation createState() => _ConfirmInformation();
}

class _ConfirmInformation extends State<ConfirmInformationScreen> {
  // final _passwordController = TextEditingController();
  // final _emailController = TextEditingController();
  final ConfirmController _controller = Get.put(ConfirmController());
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
                Column(
                  children: [
                    Wrap(
                      children: _controller.listOrder
                          .map(
                            (e) => ProductCart(
                              pro: e,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                )
              ]),
            ),
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
            child: Obx(
              () => SafeArea(
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
                              // OrderDetailBottomDetail.show(cartController);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Tổng cộng: ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "${_controller.total} đ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
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
                                _controller.order();
                              },
                              child: Container(
                                width: 120,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    border:
                                        Border.all(color: Colors.grey[200]!)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Đặt hàng ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .primaryTextTheme
                                              .headline6!
                                              .color,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "(${_controller.numberOfItem})",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6!
                                            .color,
                                      ),
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
                          Text("${_controller.profile.fullname ?? ""}"),
                          InkWell(
                              onTap: () {
                                Get.defaultDialog(
                                    title: '',
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          // controller: settingsScreenController.categoryNameController,
                                          keyboardType: TextInputType.text,
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                              labelText: 'Category Name',
                                              hintMaxLines: 1,
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.green,
                                                      width: 4.0))),
                                        ),
                                        SizedBox(
                                          height: 30.0,
                                        ),
                                        RaisedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Lưu',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0),
                                          ),
                                          color: Colors.redAccent,
                                        )
                                      ],
                                    ),
                                    radius: 10.0);
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
                  Get.defaultDialog(
                      title: '',
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            // controller: settingsScreenController.categoryNameController,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            decoration: InputDecoration(
                                labelText: 'Category Name',
                                hintMaxLines: 1,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 4.0))),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          RaisedButton(
                            onPressed: () {},
                            child: Text(
                              'Lưu',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                            color: Colors.redAccent,
                          )
                        ],
                      ),
                      radius: 10.0);
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
                          Text("${_controller.profile.phone}"),
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
                    Get.defaultDialog(
                        title: '',
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              // controller: settingsScreenController.categoryNameController,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  labelText: 'Category Name',
                                  hintMaxLines: 1,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.green, width: 4.0))),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            RaisedButton(
                              onPressed: () {},
                              child: Text(
                                'Lưu',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              color: Colors.redAccent,
                            )
                          ],
                        ),
                        radius: 10.0);
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
                        children: [Text("phuc le"), Icon(Icons.edit)],
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
                  Get.defaultDialog(
                      title: '',
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            // controller: settingsScreenController.categoryNameController,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            decoration: InputDecoration(
                                labelText: 'Category Name',
                                hintMaxLines: 1,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 4.0))),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          RaisedButton(
                            onPressed: () {},
                            child: Text(
                              'Lưu',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                            color: Colors.redAccent,
                          )
                        ],
                      ),
                      radius: 10.0);
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
                        children: [Text("Chon"), Icon(Icons.edit)],
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
                    Get.defaultDialog(
                        title: '',
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              // controller: settingsScreenController.categoryNameController,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  labelText: 'Category Name',
                                  hintMaxLines: 1,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.green, width: 4.0))),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            RaisedButton(
                              onPressed: () {},
                              child: Text(
                                'Lưu',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              color: Colors.redAccent,
                            )
                          ],
                        ),
                        radius: 10.0);
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
                          Text(_controller.profile.address),
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
                  child: TextField(
                    // controller: _controller.ghichuTextController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.blueGrey),
                      ),
                      hintText: "Nhập tên ngân hàng của bạn",
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

class ProductCart extends StatelessWidget {
  ProductCart({Key? key, required this.pro}) : super(key: key);

  ProductHive pro;
  @override
  Widget build(BuildContext context) {
    final oCcy = new NumberFormat("#,##0", "en_US");

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {},
        background: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xFFFFE6E6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Spacer(),
              SvgPicture.asset("assets/svg/other.svg"),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 88,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: API.share.baseSite +
                              '/upload/img/products' +
                              '/${pro.prodir}' +
                              '/${pro.image}',
                          errorWidget: (context, url, error) =>
                              SahaEmptyImage(),
                        ),
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   top: -12,
                //   left: 2,
                //   child: Stack(
                //     clipBehavior: Clip.none,
                //     children: [
                //       // Container(
                //       //   height: 45,
                //       //   width: 45,
                //       //   child: CachedNetworkImage(
                //       //     imageUrl: API.share.baseSite +
                //       //         '/upload/img/products' +
                //       //         '/${pro.prodir}' +
                //       //         '/${pro.image}',
                //       //     color: Color(0xfffdd100),
                //       //     errorWidget: (context, url, error) => Padding(
                //       //       padding: const EdgeInsets.all(3.0),
                //       //       child: SahaEmptyImage(),
                //       //     ),
                //       //   ),
                //       // ),
                //       // Positioned(
                //       //   top: 15,
                //       //   left: 5,
                //       //   child: Text(
                //       //     "-10 %",
                //       //     textAlign: TextAlign.center,
                //       //     style: TextStyle(
                //       //         fontSize: 10,
                //       //         fontWeight: FontWeight.bold,
                //       //         color: Color(0xfffd5800)),
                //       //   ),
                //       // )
                //     ],
                //   ),
                // ),
              ],
            ),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            pro.name ?? "",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.only(
                            left: 5, right: 5, top: 5, bottom: 5),
                        color: Colors.grey[200],
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ConstrainedBox(
                              constraints: new BoxConstraints(
                                minWidth: 10,
                                maxWidth: Get.width * 0.5,
                              ),
                              child: Text(
                                '${oCcy.format(int.parse(pro.priceSale!))} đ',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Số lượng"),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 25,
                            width: 40,
                            child: Center(
                              child: Text(
                                '${pro.soluong}',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[200]!),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
