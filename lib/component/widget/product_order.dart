import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/product_hive.dart';
import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../screen/product/product_detail_screen.dart';
import '../empty_image_widget/saha_empty_image.dart';
import '../loading/loading_container.dart';

class ProductOrder extends StatelessWidget {
  ProductOrder({Key? key, required this.pro}) : super(key: key);

  ProductHive pro;
  @override
  Widget build(BuildContext context) {
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
                Positioned(
                  top: -12,
                  left: 2,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        child: CachedNetworkImage(
                          imageUrl: API.share.baseSite +
                              '/upload/img/products' +
                              '/${pro.prodir}' +
                              '/${pro.image}',
                          color: Color(0xfffdd100),
                          errorWidget: (context, url, error) => Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: SahaEmptyImage(),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        left: 5,
                        child: Text(
                          "-10 %",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfffd5800)),
                        ),
                      )
                    ],
                  ),
                ),
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
                                'Phân loại: 200ml',
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
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 25,
                            width: 30,
                            child: Icon(
                              Icons.remove,
                              size: 13,
                              color: Colors.grey,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[200]!),
                            ),
                          ),
                        ),
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
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 25,
                            width: 30,
                            child: Icon(
                              Icons.add,
                              size: 13,
                              color: Colors.black,
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
