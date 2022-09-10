import 'package:appbanhang/model/affiliate.dart';
import 'package:appbanhang/model/affiliateDivi.dart';
import 'package:appbanhang/screen/account/profile/affiliate/affiliate_controller.dart';
import 'package:appbanhang/screen/account/profile/affiliateDivi/affiliateDivi_controller.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AffiliateDiviScreen extends StatefulWidget {
  bool? isAutoBackIcon;
  AffiliateDiviScreen({Key? key, this.isAutoBackIcon}) : super(key: key);

  @override
  _AffiliateScreen createState() => _AffiliateScreen();
}

class _AffiliateScreen extends State<AffiliateDiviScreen> {
  AffiliateDivi controller = Get.put(AffiliateDivi());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      if (controller.status.value == AppState.DONE) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Mã giảm"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(
                              text: controller
                                  .affiliate.data.code.bankAccountNumber))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Số tài khoản đã được copy")));
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue),
                            // color: Colors.grey[300]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  // width: Get.width,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Thông tin người dùng:",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text("Họ tên: "),
                                    Expanded(
                                      child: Text(
                                          controller.affiliate.data.code
                                              .bankAccountHolder,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Số tài khoản: "),
                                    Expanded(
                                      child: Text(
                                          controller.affiliate.data.code
                                              .bankAccountNumber,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Chi nhánh: "),
                                    Expanded(
                                        child: Text(
                                            controller
                                                .affiliate.data.code.bankBranch,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500))),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Tên ngân hàng: "),
                                    Expanded(
                                        child: Text(
                                            controller
                                                .affiliate.data.code.bankName,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500))),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 10,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey,
                            child: Center(
                                child: Icon(
                              Icons.people,
                              size: 30,
                            )),
                          ), //CircularAvatar
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      width: Get.width,
                      child: Text(
                        "Danh sách mã giảm:",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Column(
                    children: controller.arrorder.map((element) {
                      return billValue(element); //billValue(element);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }
    });
  }

  Widget billValue(Order value) {
    final oCcy = new NumberFormat("#,##0", "en_US");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (() =>
            Clipboard.setData(ClipboardData(text: value.orderCode)).then((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${value.orderCode} đã được copy")));
            })),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey[300]!),
                color: Colors.white10,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        value.orderFullName ?? "",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Mã code: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                              Text('${value.orderCode}',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blue)),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Trạng thái: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                              Text(value.orderStatus ?? "",
                                  style: TextStyle(fontSize: 15)),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Tổng tiền: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                              Text(
                                  '${oCcy.format(int.parse(value.orderTotalMoney ?? "0"))}đ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.red)),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Mã giảm: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                              Text(
                                  '${oCcy.format(int.parse(value.codeBonus ?? "0"))}d',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.red)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            Positioned(
              top: 20,
              right: 10,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                foregroundColor: Colors.grey,
                child: Center(child: Icon(Icons.copy)),
              ), //CircularAvatar
            ),
          ],
        ),
      ),
    );
  }
}
