import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/component/text_field/saha_text_field_search.dart';
import 'package:appbanhang/component/widget/news_widget.dart';
import 'package:appbanhang/screen/category/categoryFilter/categroy_filter_screen.dart';
import 'package:appbanhang/screen/category/category_controller.dart';
import 'package:appbanhang/screen/category/category_screen.dart';
import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../../component/button/decoration_button.dart';
import '../../component/empty_image_widget/saha_empty_image.dart';
import '../../component/loading/loading_container.dart';
import '../../component/widget/product_item.dart';
import '../navigation/navigation_controller.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HomeController homeController = HomeController();
  HomeController homeController = Get.put(HomeController());
  String link = 'https://lavishop.vn/upload/img/banner/banner-3.jpg';
  // 'https://image.api.playstation.com/cdn/EP1018/CUSA00258_00/O1gpT9zRh5UZFbeDWwTJ24DHyyarDjAC.png';

  int _current = 0;

  TextEditingController searchEditingController = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 28.0),
      backgroundColor: Colors.green[900],
      visible: true,
      curve: Curves.bounceInOut,
      children: [
        SpeedDialChild(
          child: Icon(Icons.social_distance, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () {
            UrlLauncher.launch("http://zalo.me/3530497876901691451",
                forceSafariVC: true,
                forceWebView: true,
                enableJavaScript: true);
          },
          label: 'Zalo',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
        SpeedDialChild(
          child: Icon(Icons.facebook_sharp, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () {
            UrlLauncher.launch(homeController.linkfb.value,
                forceSafariVC: true,
                forceWebView: true,
                enableJavaScript: true);
          },
          label: 'Facebook',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
        // SpeedDialChild(
        //   child: Icon(Icons.laptop_chromebook, color: Colors.white),
        //   backgroundColor: Colors.green,
        //   onTap: () => print('Pressed Code'),
        //   label: 'Chat',
        //   labelStyle:
        //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        //   labelBackgroundColor: Colors.black,
        // ),
        SpeedDialChild(
          child: Icon(Icons.phone, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () {
            UrlLauncher.launch(
                "tel:${int.tryParse(homeController.phone.value)}");
          },
          label: 'Gọi điện',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      if (homeController.appStatus.value == AppState.DONE) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: Get.width,
                      height: 200,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            width: Get.width,
                            child: CarouselSlider(
                              items: homeController.listBanner.value
                                  .map(
                                    (item) => Padding(
                                      padding:
                                          EdgeInsets.only(top: 0, bottom: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 3.7,
                                                blurRadius: 3.7,
                                                offset: Offset(0,
                                                    3.7), // changes position of shadow
                                              ),
                                            ]),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            width: Get.width,
                                            fit: BoxFit.cover,
                                            imageUrl: item ?? "",
                                            placeholder: (context, url) =>
                                                SahaLoadingContainer(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    SahaEmptyImage(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  viewportFraction: 1,
                                  aspectRatio: 16 / 9,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  }),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  homeController.listBanner.value.map((url) {
                                int index = homeController.listBanner.value
                                    .indexOf(url);
                                return Container(
                                  width: 10.0,
                                  height: 2.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    color: _current == index
                                        ? Colors.white
                                        : Color.fromRGBO(0, 0, 0, 0.4),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -30,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        margin:
                            EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey[300]!),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            borderRadius: BorderRadius.circular(6)),
                        child: SahaTextFieldSearch(
                          textEditingController:
                              homeController.textEditingControllerSearch,
                          hintText: "Tìm kiếm",
                          onSubmitted: (text) {
                            Get.to(() => CategoryFilterScreen(
                                  categoryid: text,
                                ));
                          },
                          onClose: () {
                            homeController.textEditingControllerSearch.clear();
                          },
                          // controller: searchEditingController,
                          // decoration: const InputDecoration(
                          //   isDense: true,
                          //   contentPadding:
                          //       EdgeInsets.only(right: 15, top: 10, bottom: 10),
                          //   border: InputBorder.none,
                          //   hintText: "Tìm kiếm",
                          //   hintStyle: TextStyle(fontSize: 15),
                          //   icon: Icon(
                          //     Icons.search,
                          //     size: 30,
                          //   ),
                          // ),
                          // onChanged: (v) async {
                          //   // productControllerAll.onSearch(v);
                          // },
                          // minLines: 1,
                          // maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                buttonHome(),
                bannerAds(),
                category(),
                post(),
                postNew(),
              ],
            ),
          ),
          floatingActionButton: buildSpeedDial(),
        );
      } else {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }

  Widget buttonHome() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 35, right: 25, left: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    "assets/svg/safe.svg",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Giao hàng\ntoàn quốc',
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                ],
              ),
              Column(
                children: [
                  SvgPicture.asset(
                    "assets/svg/truck.svg",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Giao hàng\nnội thành 2 giờ',
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                ],
              ),
              Column(
                children: [
                  SvgPicture.asset(
                    "assets/svg/hot_outline.svg",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '1 đổi 1 trong\n15 ngày',
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          color: Colors.white,
          height: 90,
          width: Get.width,
          padding: EdgeInsets.all(5),
          child: Wrap(
            runAlignment: WrapAlignment.spaceAround,
            alignment: WrapAlignment.center,
            direction: Axis.vertical,
            children: [
              InkWell(
                canRequestFocus: false,
                onTap: () {
                  // print('tap danh muc');
                  NavigationController navigationController =
                      Get.find<NavigationController>();
                  navigationController.moveToTab(2);
                },
                child: DecorationButton(
                  title: 'Danh mục',
                  child: Center(
                    child: SvgPicture.asset("assets/svg/other.svg",
                        width: 25, height: 25, color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
              ),
              InkWell(
                onTap: (() {
                  Get.to(() => CategoryFilterScreen(
                        sort: Sort.moi_nhat,
                      ));
                }),
                child: DecorationButton(
                  title: 'Mới nhất',
                  child: Center(
                    child: SvgPicture.asset("assets/svg/new.svg",
                        width: 25, height: 25, color: Colors.white),
                  ),
                  color: Colors.pink,
                ),
              ),
              InkWell(
                onTap: (() {
                  Get.to(() => CategoryFilterScreen(
                        sort: Sort.pho_bien,
                      ));
                }),
                child: DecorationButton(
                  title: 'Hot nhất',
                  child: Center(
                    child: SvgPicture.asset("assets/svg/hot.svg",
                        width: 25, height: 25, color: Colors.white),
                  ),
                  color: Colors.red,
                ),
              ),
              InkWell(
                onTap: (() {
                  Get.to(() => CategoryFilterScreen(
                        sort: Sort.ban_chay,
                      ));
                }),
                child: DecorationButton(
                  title: 'Mua nhiều',
                  child: Center(
                    child: SvgPicture.asset("assets/svg/shopping_cart.svg",
                        width: 25, height: 25, color: Colors.white),
                  ),
                  color: Colors.teal,
                ),
              ),
              InkWell(
                onTap: (() {
                  Get.to(() => CategoryFilterScreen(
                        sort: Sort.price_asc,
                      ));
                }),
                child: DecorationButton(
                  title: 'Giảm giá',
                  child: Center(
                    child: SvgPicture.asset("assets/svg/tag.svg",
                        width: 25, height: 25, color: Colors.white),
                  ),
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget bannerAds() {
    return Container(
      padding: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: CachedNetworkImage(
          width: Get.width,
          height: 60,
          fit: BoxFit.cover,
          imageUrl: "https://lavishop.vn/upload/img/banner/banner-3.jpg",
          // "http://chuyennhahanoi.online/lavishop/upload/img/category/ch%C4%83m%20s%C3%B3c%20da.jpg",
          placeholder: (context, url) => SahaLoadingContainer(),
          errorWidget: (context, url, error) => SahaEmptyImage(),
        ),
      ),
    );
  }

  Widget category() {
    return Obx(() => Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15),
                child: Text(
                  "Danh mục sản phẩm",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: SizedBox(
                      width: (Get.width / 4.7) *
                          (homeController.listCategory.length / 2).ceil(),
                      child: Center(
                        child: Wrap(
                          runSpacing: 15,
                          children: homeController.listCategory
                              .map((e) => GestureDetector(
                                    onTap: () {
                                      Get.to(() => CategoryFilterScreen(
                                          categoryid: e.id));
                                    },
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          4.3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration:
                                                BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey[300]!,
                                                blurRadius: 10,
                                                offset: Offset(
                                                    4, 7), // Shadow position
                                              ),
                                            ]),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: CachedNetworkImage(
                                                width: Get.width / 7.5,
                                                height: Get.width / 7.5,
                                                fit: BoxFit.cover,
                                                imageUrl: API.share.baseSite +
                                                    '/${e.image}',
                                                placeholder: (context, url) =>
                                                    SahaLoadingContainer(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        SahaEmptyImage(),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          AutoSizeText(
                                            e.name,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                height: 1),
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }

  Widget postNew() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bài viết mới",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: (() {
                      NavigationController navigationController =
                          Get.find<NavigationController>();
                      navigationController.moveToTab(3);
                    }),
                    child: Text(
                      "Xem thêm >>",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
                children: homeController.listNewProduct
                    .map((e) => NewsItem(
                          width: Get.width / 2,
                          image: API.share.baseSite + "/${e.image}",
                          description: e.description,
                          title: e.title,
                          id: e.id,
                        ))
                    .toList()),
          ],
        ));
  }

  Widget post() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 8),
              child: Text(
                "Sản phẩm hot",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Wrap(
                  children: homeController.listTempHotProduct.map((e) {
                if (homeController.getListPro(e.name).length > 0) {
                  return Container(
                      width: Get.width,
                      child: Column(
                        children: [
                          Text(
                            e.name,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          listProduct(e.name)
                        ],
                      ));
                } else {
                  return Container();
                }
              }).toList()),
            ),
            SizedBox(
              height: 10,
            ),
            // Align(
            //   alignment: Alignment.center,
            //   child: Container(
            //     padding: EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20),
            //         color: Colors.blue),
            //     child: Text(
            //       "Tải thêm",
            //       style: TextStyle(
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ));
  }

  Widget listProduct(String name) {
    var listPro = homeController.getListPro(name);
    // var arr = [];
    // arr.addAll(listPro);
    return SingleChildScrollView(
      // scrollDirection: Scrollver,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: listPro
            .map((e) => ProductItem(
                  width: Get.width / 2,
                  product: e,
                  image: API.share.baseSite +
                      '/upload/img/products/' +
                      (e.proDir ?? "") +
                      "/thumbnail_2_" +
                      (e.image ?? ""),
                ))
            .toList(),
      ),
    );
  }
}
