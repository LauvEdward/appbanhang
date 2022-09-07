import 'package:appbanhang/model/affiliate.dart';
import 'package:appbanhang/screen/account/profile/affiliate/affiliate_controller.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AffiliateScreen extends StatefulWidget {
  bool? isAutoBackIcon;
  AffiliateScreen({Key? key, this.isAutoBackIcon}) : super(key: key);

  @override
  _AffiliateScreen createState() => _AffiliateScreen();
}

class _AffiliateScreen extends State<AffiliateScreen> {
  AffiliateController controller = Get.put(AffiliateController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      if (controller.status.value == AppState.DONE) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Cộng tác viên liên kết"),
          ),
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            'Tên chương trình',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w800),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text('Hoa hồng',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w800)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text('Ngày',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800))),
                        ),
                      ]),
                    ],
                  ),
                ),
                Table(
                  border: TableBorder.all(color: Colors.black),
                  children: controller.listaffiliate.map((element) {
                    if (element.typePost == 1) {
                      return products(); //billValue(element);
                    } else if (element.typePost == 2) {
                      return groups();
                    } else {
                      return groups();
                    }
                  }).toList(),
                ),
              ],
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

  TableRow billValue(Promotion value) {
    return TableRow(children: [
      Text(value.name ?? ""),
      Column(
        children: [
          Text('Từ: ${value.conditions!.affiliateBillValue!.fromValue}'),
          Text('Đến: ${value.conditions!.affiliateBillValue!.toValue}'),
          Text('Hoa hồng: ${value.conditions!.affiliateBillValue!.bonus}%'),
        ],
      ),
      Column(
        children: [
          Text('Ngày bắt đầu: ${value.getStartDate}'),
          Text('Ngày kết thúc: ${value.getEndDate}'),
        ],
      ),
    ]);
  }

  TableRow groups() {
    return TableRow(children: [
      Text('Theo nhóm'),
      Text('Hoa hồng: 5.5 %'),
      Column(
        children: [
          Text('Ngày bắt đầu: 2022-08-10'),
          Text('Ngày kết thúc: 2022-09-29'),
        ],
      ),
    ]);
  }

  TableRow products() {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Chương trình 27/07'),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text('ALFASEPT ORAL SENSITIVE')),
                Text('12%'),
              ],
            ),
            Container(
              width: Get.width,
              height: 1,
              color: Colors.black,
            ),
            Row(
              children: [
                Expanded(child: Text('ALFASEPT ORAL SENSITIVE')),
                Text('12%'),
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Ngày bắt đầu: 2022-08-10'),
            Text('Ngày kết thúc: 2022-09-29'),
          ],
        ),
      ),
    ]);
  }
}
