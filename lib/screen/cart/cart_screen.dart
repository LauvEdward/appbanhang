import 'package:appbanhang/component/widget/product_order.dart';
import 'package:appbanhang/model/product_hive.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../component/empty_image_widget/saha_empty_image.dart';
import 'cart_controller.dart';
import 'confirmInformation/confirm_information_screen.dart';
import 'widget/bottom_detail.dart';
import 'widget/item_product.dart';

// ignore: must_be_immutable
class CartScreen extends StatefulWidget {
  bool? isAutoBackIcon;
  CartScreen({Key? key, this.isAutoBackIcon}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController cartController = Get.put(CartController());

  @override
  void initState() {
    // WidgetsBinding.instance!.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final oCcy = new NumberFormat("#,##0", "en_US");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: widget.isAutoBackIcon ?? true,
        title: Column(
          children: [
            Text(
              "Giỏ hàng",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "3 sản phẩm",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      body: Obx(
        () => RefreshIndicator(
            // color: Colors.indigo,
            onRefresh: () async {
              await cartController.getListPro();
            },
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),

                // controller: _scrollController,
                child: Column(
                  children: [
                    Wrap(
                      children: cartController.listOrder
                          .map(
                            (e) => ProductOrder(
                              pro: e,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ))),
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
                // InkWell(
                //   onTap: () {},
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Row(
                //       children: [
                //         Container(
                //           padding: EdgeInsets.all(4),
                //           height: 30,
                //           width: 30,
                //           child: SvgPicture.asset(
                //             "assets/svg/other.svg",
                //             color: Colors.blue,
                //           ),
                //         ),
                //         SizedBox(
                //           width: 10,
                //         ),
                //         Text("Voucher"),
                //         Spacer(),
                //         Text(
                //           "Mã: NEW - đ100.000",
                //           style: TextStyle(fontSize: 13),
                //         ),
                //         const SizedBox(width: 10),
                //         Icon(
                //           Icons.arrow_forward_ios,
                //           size: 12,
                //           color: Colors.blue,
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // Divider(
                //   height: 1,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                //   child: Row(
                //     children: [
                //       Container(
                //         padding: EdgeInsets.all(4),
                //         height: 30,
                //         width: 30,
                //         decoration: BoxDecoration(
                //           color: Color(0xFFF5F6F9),
                //           shape: BoxShape.circle,
                //         ),
                //         child: SvgPicture.asset(
                //           "assets/svg/other.svg",
                //           color: Colors.blue,
                //         ),
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Text(
                //         "Dùng 200 xu ",
                //         style: TextStyle(fontSize: 13),
                //       ),
                //       Spacer(),
                //       Text("[-2000₫] "),
                //       CupertinoSwitch(
                //         value: true,
                //         // cartController.cartData.value.isUsePoints!,
                //         onChanged: (bool value) {
                //           // cartController.cartData.value.isUsePoints =
                //           // !cartController
                //           //     .cartData.value.isUsePoints!;
                //           // cartController.addVoucherCart(
                //           //   cartController.voucherCodeChoose.value,
                //           // );
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                // Divider(
                //   height: 1,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                //   child: Row(
                //     children: [
                //       Container(
                //         padding: EdgeInsets.all(4),
                //         height: 30,
                //         width: 30,
                //         decoration: BoxDecoration(
                //           color: Color(0xFFF5F6F9),
                //           shape: BoxShape.circle,
                //         ),
                //         child: SvgPicture.asset(
                //           "assets/svg/other.svg",
                //           color: Colors.blue,
                //         ),
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Expanded(
                //         child: Text(
                //           "Dùng số dư cộng tác viên ",
                //           style: TextStyle(fontSize: 13),
                //         ),
                //       ),
                //       Text("[-20.000₫] "),
                //       CupertinoSwitch(
                //         value: true,
                //         // cartController.isUseBalanceCollaborator.value,
                //         onChanged: (bool value) {
                //           // cartController
                //           //     .isUseBalanceCollaborator.value =
                //           // !cartController
                //           //     .isUseBalanceCollaborator.value;
                //           // cartController.addVoucherCart(
                //           //   cartController.voucherCodeChoose.value,
                //           // );
                //         },
                //       ),
                //     ],
                //   ),
                // ),
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
                                  "${oCcy.format(cartController.total.value)} đ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            // Container(
                            //   padding: EdgeInsets.all(3),
                            //   height: 20,
                            //   decoration: BoxDecoration(
                            //       color: Colors.red.withOpacity(0.1),
                            //       borderRadius: BorderRadius.circular(3)),
                            //   child: Row(
                            //     children: [
                            //       Text(
                            //         "Khuyến mãi: 10.000 đ",
                            //         style: TextStyle(
                            //             fontSize: 10,
                            //             color: Colors.red,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //       Icon(
                            //         Icons.keyboard_arrow_down,
                            //         size: 16,
                            //         color: Colors.red,
                            //       )
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          cartController.getListPro();
                          // if (cartController.listPro != null) {
                          //   print((cartController.listPro as ProductHive).name);

                          //   // Get.to(() => ConfirmScreen());
                          // }
                        },
                        child: InkWell(
                          onTap: () async {
                            bool isSuccess = await cartController.checkCart();
                            if (isSuccess) {
                              Get.to(() => ConfirmInformationScreen());
                            }
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
                                  "(${cartController.numberOfItem.value})",
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
  }

  // Widget listOrder(ProductHive pro) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 10),
  //     child: Dismissible(
  //       key: UniqueKey(),
  //       direction: DismissDirection.endToStart,
  //       onDismissed: (direction) {},
  //       background: Container(
  //         padding: EdgeInsets.symmetric(horizontal: 20),
  //         decoration: BoxDecoration(
  //           color: Color(0xFFFFE6E6),
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         child: Row(
  //           children: [
  //             Spacer(),
  //             SvgPicture.asset("assets/svg/other.svg"),
  //           ],
  //         ),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Stack(
  //             children: [
  //               SizedBox(
  //                 width: 88,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(2.0),
  //                   child: AspectRatio(
  //                     aspectRatio: 1,
  //                     child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(2),
  //                       child: CachedNetworkImage(
  //                         fit: BoxFit.cover,
  //                         imageUrl:
  //                             'https://thumbs.dreamstime.com/b/marvel-logo-marvel-logo-red-background-vector-format-aviable-ai-127114750.jpg',
  //                         // 'http://chuyennhahanoi.online/lavishop/upload/img/products/01072022/thumbnail_2_hetis-silver-alginate.png',
  //                         errorWidget: (context, url, error) =>
  //                             SahaEmptyImage(),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Positioned(
  //                 top: -12,
  //                 left: 2,
  //                 child: Stack(
  //                   clipBehavior: Clip.none,
  //                   children: [
  //                     Container(
  //                       height: 45,
  //                       width: 45,
  //                       child: SvgPicture.asset(
  //                         "assets/svg/box.svg",
  //                         color: Color(0xfffdd100),
  //                       ),
  //                     ),
  //                     Positioned(
  //                       top: 15,
  //                       left: 5,
  //                       child: Text(
  //                         "-10 %",
  //                         textAlign: TextAlign.center,
  //                         style: TextStyle(
  //                             fontSize: 10,
  //                             fontWeight: FontWeight.bold,
  //                             color: Color(0xfffd5800)),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(width: 20),
  //           Expanded(
  //             child: Container(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Row(
  //                     children: [
  //                       Expanded(
  //                         child: Text(
  //                           'Megasept Wipe',
  //                           style: TextStyle(color: Colors.black, fontSize: 14),
  //                           maxLines: 2,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   InkWell(
  //                     onTap: () {},
  //                     child: Container(
  //                       margin: EdgeInsets.only(top: 10),
  //                       padding: EdgeInsets.only(
  //                           left: 5, right: 5, top: 5, bottom: 5),
  //                       color: Colors.grey[200],
  //                       child: Row(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           ConstrainedBox(
  //                             constraints: new BoxConstraints(
  //                               minWidth: 10,
  //                               maxWidth: Get.width * 0.5,
  //                             ),
  //                             child: Text(
  //                               'Phân loại: 200ml',
  //                               overflow: TextOverflow.ellipsis,
  //                               style: TextStyle(
  //                                   color: Colors.grey[600], fontSize: 12),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(height: 10),
  //                   Row(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       InkWell(
  //                         onTap: () {},
  //                         child: Container(
  //                           height: 25,
  //                           width: 30,
  //                           child: Icon(
  //                             Icons.remove,
  //                             size: 13,
  //                             color: Colors.grey,
  //                           ),
  //                           decoration: BoxDecoration(
  //                             border: Border.all(color: Colors.grey[200]!),
  //                           ),
  //                         ),
  //                       ),
  //                       InkWell(
  //                         onTap: () {},
  //                         child: Container(
  //                           height: 25,
  //                           width: 40,
  //                           child: Center(
  //                             child: Text(
  //                               '3',
  //                               style: TextStyle(fontSize: 14),
  //                             ),
  //                           ),
  //                           decoration: BoxDecoration(
  //                             border: Border.all(color: Colors.grey[200]!),
  //                           ),
  //                         ),
  //                       ),
  //                       InkWell(
  //                         onTap: () {},
  //                         child: Container(
  //                           height: 25,
  //                           width: 30,
  //                           child: Icon(
  //                             Icons.add,
  //                             size: 13,
  //                             color: Colors.black,
  //                           ),
  //                           decoration: BoxDecoration(
  //                             border: Border.all(color: Colors.grey[200]!),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   SizedBox(height: 10),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
