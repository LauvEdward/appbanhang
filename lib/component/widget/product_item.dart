import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../screen/product/product_detail_screen.dart';
import '../empty_image_widget/saha_empty_image.dart';
import '../loading/loading_container.dart';

class ProductItem extends StatelessWidget {
  ProductItem({
    Key? key,
    this.width,
    this.showCart = true,
    this.image,
    this.product,
  }) : super(key: key);

  double? width;
  bool? showCart;
  String? image;
  Pro? product;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: width,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            blurRadius: 10,
            offset: Offset(4, 7), // Shadow position
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.all(7),
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                Get.to(() => ProductDetailScreen(
                      product: product!,
                    ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        topLeft: Radius.circular(5.0)),
                    child: CachedNetworkImage(
                      height: (Get.height / 3) * 0.6,
                      width: Get.width,
                      fit: BoxFit.cover,
                      imageUrl: this.image!,
                      placeholder: (context, url) => SahaLoadingContainer(),
                      errorWidget: (context, url, error) => SahaEmptyImage(),
                    ),
                  ),
                  SizedBox(height: 5),
                  product!.price != "0" ? price() : contract()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget contract() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                product!.name ?? "",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                maxLines: 2,
              ),
            ),
            Text(
              "Liên hệ",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget price() {
    final oCcy = new NumberFormat("#,##0", "en_US");
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                product!.name ?? "",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                maxLines: 2,
              ),
            ),
            Text(
              "${oCcy.format(int.parse(product!.price ?? ""))}",
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${oCcy.format(int.parse(product!.priceSale ?? ""))}",
                    // product!.pro!.first.priceSale ?? "",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)),
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
                  child: Text(
                    '-10%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  // String? textMoney() {
  //   if (product!.minPrice == 0) {
  //     if (product.productDiscount == null) {
  //       return "${product.price == 0 ? "Liên hệ" : "${SahaStringUtils().convertToMoney(product.price)}₫"}";
  //     } else {
  //       return "${product.productDiscount!.discountPrice == 0 ? "Liên hệ" : "${SahaStringUtils().convertToMoney(product.productDiscount!.discountPrice)}₫"}";
  //     }
  //   } else {
  //     if (product.productDiscount == null) {
  //       return "${product.minPrice == 0 ? "Liên hệ" : "${SahaStringUtils().convertToMoney(product.minPrice)}₫"}";
  //     } else {
  //       return "${product.minPrice == 0 ? "Liên hệ" : "${SahaStringUtils().convertToMoney(product.minPrice! - ((product.minPrice! * product.productDiscount!.value!) / 100))}₫"}";
  //     }
  //   }
  // }

  // double? checkMinMaxPrice(double? price) {
  //   return product.productDiscount == null
  //       ? (price ?? 0)
  //       : ((price ?? 0) -
  //           ((price ?? 0) * (product.productDiscount!.value! / 100)));
  // }
}
