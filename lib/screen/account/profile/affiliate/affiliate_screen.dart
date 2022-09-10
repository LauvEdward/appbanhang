import 'package:appbanhang/model/affiliate.dart';
import 'package:appbanhang/screen/account/profile/affiliate/affiliate_controller.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: controller.listaffiliate.map((element) {
                  if (element.typePost == 1) {
                    return billValue(element); //billValue(element);
                  } else if (element.typePost == 2) {
                    return products(element);
                  } else {
                    return groups(element);
                  }
                }).toList(),
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

  Widget billValue(Promotion value) {
    final oCcy = new NumberFormat("#,##0", "en_US");
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey[300]!),
        color: Colors.white10,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              value.name ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 18),
            ),
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
                    'Từ: ',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  Text(
                      '${oCcy.format(value.conditions!.affiliateBillValue!.fromValue)}',
                      style: TextStyle(fontSize: 15, color: Colors.red)),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Đến: ',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  Text(
                      '${oCcy.format(value.conditions!.affiliateBillValue!.toValue)}',
                      style: TextStyle(fontSize: 15, color: Colors.red)),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Hoa hồng: ',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  Text('${value.conditions!.affiliateBillValue!.bonus}%',
                      style: TextStyle(fontSize: 15, color: Colors.blue)),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Ngày bắt đầu:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  Text(' ${value.getStartDate}',
                      style: TextStyle(fontSize: 15)),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Ngày kết thúc:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  Text('${value.getEndDate}', style: TextStyle(fontSize: 15)),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget groups(Promotion value) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey[300]!),
        color: Colors.white10,
      ),
      child: Column(children: [
        Center(
            child: Text(
          value.name ?? "",
          style:
              TextStyle(fontWeight: FontWeight.w700, color: Colors.amber[900]),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('Hoa hồng: ',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              Text('${value.conditions!.affiliateGroups!.bonus}%',
                  style: TextStyle(fontSize: 15, color: Colors.amber[900])),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Ngày bắt đầu:',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                  Text('${value.getStartDate}', style: TextStyle(fontSize: 15)),
                ],
              ),
              Row(
                children: [
                  Text('Ngày kết thúc:',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                  Text('${value.getEndDate}', style: TextStyle(fontSize: 15)),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget products(Promotion value) {
    var listProduct = [];
    listProduct.addAll(value.conditions!.affiliateProducts!);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey[300]!),
        color: Colors.white10,
      ),
      child: Column(children: [
        Center(
            child: Text(value.name ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.amber[900]))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: listProduct.map((e) {
              return Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(e.productName)),
                        Text('${e.bonus}%'),
                      ],
                    ),
                    Container(
                      width: Get.width,
                      height: 1,
                      color: Colors.black,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Ngày bắt đầu: ${value.getStartDate}'),
              Text('Ngày kết thúc: ${value.getEndDate}'),
            ],
          ),
        ),
      ]),
    );
  }
}
