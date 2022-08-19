import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../component/empty_image_widget/saha_empty_image.dart';
import '../../component/loading/loading_widget.dart';
import '../../component/text_field/saha_text_field_search.dart';
import '../../component/widget/product_item.dart';
import '../../model/category.dart';
import 'category_controller.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatefulWidget {
  bool autoSearch;

  CategoryScreen({Key? key, this.autoSearch = false}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryController categoryController1 = Get.put(CategoryController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // key: _scaffoldKey,
      onEndDrawerChanged: (v) {},
      endDrawer: Drawer(
        child: Container(
          width: Get.width / 2,
          height: Get.height,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Bộ lọc tìm kiếm",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Divider(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                    ),
                    Text("Sản phẩm"),
                    Container(
                      height: 40,
                      margin: EdgeInsets.all(10),
                      child: Obx(
                        () => FilterChip(
                          label: Text(
                            "Giảm giá",
                            style: TextStyle(fontSize: 13),
                          ),
                          selected:
                              categoryController1.isChooseDiscountSort.value,
                          backgroundColor: Colors.transparent,
                          shape: StadiumBorder(
                              side: BorderSide(color: Colors.grey[300]!)),
                          onSelected: (bool value) {
                            categoryController1.isChooseDiscountSort.value =
                                !categoryController1.isChooseDiscountSort.value;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryTextTheme.headline1!.color,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                    onTap: () {},
                    child: SahaTextFieldSearch(
                      textEditingController:
                          categoryController1.textEditingControllerSearch,
                      enabled: false,
                    )),
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // _scaffoldKey.currentState!.openEndDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 10.0),
              child: Icon(
                Icons.filter_alt_rounded,
                color: Colors.black87,
              ),
            ),
          ),
        ],
        automaticallyImplyLeading: true,
      ),
      body: Obx(() {
        if (categoryController1.status == AppState.DONE) {
          return Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: buildItemOrderBy(
                              title: "Phổ biến", key: "views")),
                      Expanded(
                          child: buildItemOrderBy(
                              title: "Mới nhất", key: "created_at")),
                      Expanded(
                          child: buildItemOrderBy(
                              title: "Bán chạy", key: "sales")),
                      Expanded(
                          child: buildItemOrderBy(title: "Giá", key: "price")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          // width: Get.width,
                          color: Colors.white.withOpacity(0.8),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categoryController1.listProduct.length,
                              itemBuilder: (context, index) {
                                return buildItem(
                                    category:
                                        categoryController1.listProduct[index]);
                              }),
                        ),
                      ),
                    ],
                  ),
                  // if (categoryController1.categoriesChild.isNotEmpty)
                  //   Row(
                  //     children: [
                  //       Expanded(
                  //         child: Container(
                  //           height: 60,
                  //           // width: Get.width,
                  //           color: Colors.white.withOpacity(0.8),
                  //           child: ListView.builder(
                  //               scrollDirection: Axis.horizontal,
                  //               itemCount:
                  //                   categoryController1.categoriesChild.length,
                  //               itemBuilder: (context, index) {
                  //                 return buildItemChild(
                  //                     category: categoryController1
                  //                         .categoriesChild[index]);
                  //               }),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                ],
              ),
              Expanded(child: buildList()),
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
          );
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      }),
    );
  }

  Widget buildItemOrderBy({String? title, String? key, Function? onTap}) {
    return Obx(
      () {
        bool? selected = key == categoryController1.sortByShow.value;

        return InkWell(
          onTap: () {
            if (categoryController1.sortByShow.value == "price" &&
                key == "price") {
              categoryController1.searchProduct(
                  sortBy: key,
                  descending: !categoryController1.descendingShow.value);
              return;
            }
            categoryController1.searchProduct(sortBy: key);
          },
          child: Row(
            children: [
              selected
                  ? VerticalDivider(
                      color: Colors.grey,
                      width: 1,
                    )
                  : Container(),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text(title ?? ""),
                          ),
                          key == "price" && selected
                              ? (Transform.rotate(
                                  angle:
                                      (!categoryController1.descendingShow.value
                                              ? -90
                                              : 90) *
                                          math.pi /
                                          180,
                                  child: Icon(
                                    Icons.arrow_right_alt_outlined,
                                  ),
                                ))
                              : Container()
                        ],
                      ),
                      Container(
                        height: 2,
                        color: selected ? Colors.blue : null,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              selected
                  ? VerticalDivider(
                      color: Colors.grey,
                      width: 1,
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  var listImage = [
    'https://thumbs.dreamstime.com/b/marvel-logo-marvel-logo-red-background-vector-format-aviable-ai-127114750.jpg'
    // 'http://chuyennhahanoi.online/lavishop/upload/img/category/cho-em-be-1.jpg',
    // 'http://chuyennhahanoi.online/lavishop/upload/img/category/cho-nam-gioi-1.jpg',
    // 'http://chuyennhahanoi.online/lavishop/upload/img/category/cho-phu-nu-1.jpg',
    // 'http://chuyennhahanoi.online/lavishop/upload/img/category/cham-soc-da-1-1.jpg',
    // 'http://chuyennhahanoi.online/lavishop/upload/img/category/cham-soc-toc-1.jpg',
    // 'http://chuyennhahanoi.online/lavishop/upload/img/category/rang-ming-1.jpg',
    // 'http://chuyennhahanoi.online/lavishop/upload/img/category/cham-soc-vet-thuong.jpg',
    // 'http://chuyennhahanoi.online/lavishop/upload/img/category/khu-khuan-dung-cu-1.jpg',
    // 'http://chuyennhahanoi.online/lavishop/upload/img/category/be-mat-1.jpg',
    // 'http://chuyennhahanoi.online/lavishop/upload/img/category/rua-tay-1.jpg',
  ];

  Widget buildList() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Wrap(
            children: categoryController1.listAllProduct
                .map(
                  (e) => ProductItem(
                    width: Get.width / 2,
                    product: e,
                    // image: listImage[0],
                    image: e.proDir == null
                        ? listImage[0]
                        : API.share.baseSite +
                            '/upload/img/products/' +
                            e.proDir +
                            "/${e.image}",
                  ),
                )
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                categoryController1.page.value += 1;
                categoryController1.getAllCategory();
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue),
                  child: Text(
                    "Tải thêm",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildItem({DataProduct? category}) {
    return Obx(
      () => Container(
        width: 80,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: Colors.blue,
                width: categoryController1.categoryCurrent.value == category!.id
                    ? 2
                    : 0),
          ),
          color: categoryController1.categoryCurrent.value == category.id
              ? Colors.white
              : null,
        ),
        child: InkWell(
          onTap: () {
            // categoryController1.setCategoryCurrent(category);

            // categoryController1.searchProduct(idCategory: category.id);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: category.image == null
                      ? Center(child: Icon(Icons.view_module_rounded))
                      : CachedNetworkImage(
                          imageUrl: API.share.baseSite + "/${category.image}",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              SahaEmptyImage(),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Text(
                category.name ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 13,
                    color:
                        categoryController1.categoryCurrent.value == category.id
                            ? Colors.blue
                            : Colors.black54),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemChild({Category? category}) {
    return Obx(
      () => Container(
        width: 70,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: Colors.blue,
                width: categoryController1.categoryCurrentChild.value ==
                        category!.id
                    ? 2
                    : 0),
            right: BorderSide(color: Colors.grey, width: 0.5),
            left: BorderSide(color: Colors.grey, width: 0.5),
          ),
          color: categoryController1.categoryCurrentChild.value == category.id
              ? Colors.white
              : null,
        ),
        child: InkWell(
          onTap: () {
            categoryController1.setCategoryCurrentChild(category);

            categoryController1.searchProduct(idCategory: category.id);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: category.id == null
                    ? Center(
                        child: SvgPicture.asset(
                          "packages/sahashop_customer/assets/svg/all.svg",
                          color: Colors.blue,
                          width: 20.0,
                          height: 20.0,
                        ),
                      )
                    : CachedNetworkImage(
                        imageUrl: category.imageUrl ?? "",
                        imageBuilder: (context, imageProvider) => Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        placeholder: (context, url) => SahaLoadingWidget(
                          size: 20,
                        ),
                        errorWidget: (context, url, error) => SahaEmptyImage(
                          height: 20,
                          width: 20,
                        ),
                        fit: BoxFit.cover,
                      ),
              ),
              Text(
                category.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 12,
                    color: categoryController1.categoryCurrentChild.value ==
                            category.id
                        ? Colors.blue
                        : Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
