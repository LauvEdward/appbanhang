import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/screen/cart/cart_screen.dart';
import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../component/empty_image_widget/saha_empty_image.dart';
import '../../../component/loading/loading_container.dart';

class ProductDetailScreen extends StatefulWidget {
  final String product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductDetailController? productDetailController;
  var _current = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productDetailController = Get.put(ProductDetailController(widget.product));
    productDetailController!.prod = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(
      () {
        if (productDetailController!.status == AppState.ERROR) {
          return Scaffold(
            body: AlertDialog(
              content: Text("API ERROR"),
            ),
          );
        } else if (productDetailController!.status == AppState.DONE) {
          return Scaffold(
            backgroundColor: Colors.grey[200]!,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black87),
              title: Text(
                productDetailController?.productdetail.data.item.name ?? "",
                style: TextStyle(color: Colors.black87),
              ),
              actions: [
                // IconButton(
                //     onPressed: () {},
                //     icon: Icon(Icons.favorite_border_rounded)),
                IconButton(
                    onPressed: () {
                      Get.to(() => CartScreen());
                    },
                    icon: Icon(Icons.shopping_bag_outlined))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  banner(),
                  content(),
                  SizedBox(
                    height: 8,
                  ),
                  infoDecoration(),
                  SizedBox(
                    height: 8,
                  ),
                  body(),
                  SizedBox(
                    height: 8,
                  ),
                  postsSame(),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 80,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: Colors.blue)),
                        child: Column(
                          children: [
                            Icon(
                              Icons.chat_outlined,
                              color: Colors.blue,
                              size: 16,
                            ),
                            Text(
                              'Chat',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 10),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            productDetailController!.addProductToCart();
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                'Thêm vào giỏ hàng',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  var link =
      'https://thumbs.dreamstime.com/b/marvel-logo-marvel-logo-red-background-vector-format-aviable-ai-127114750.jpg';
  // 'http://chuyennhahanoi.online/lavishop/upload/img/products/01072022/megasept-wipe.jpg';

  Widget banner() {
    return Container(
      width: Get.width,
      height: Get.height / 2.5,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: Get.width,
            child: CarouselSlider(
              items: productDetailController!.listImage
                  .map(
                    (item) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: CachedNetworkImage(
                        width: Get.width,
                        fit: BoxFit.contain,
                        imageUrl: API.share.baseSite + '/${item.image}',
                        placeholder: (context, url) => SahaLoadingContainer(),
                        errorWidget: (context, url, error) => SahaEmptyImage(),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: false,
                  viewportFraction: 1,
                  aspectRatio: 1,
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
              children: listImage.map((url) {
                int index = productDetailController!.listImage.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget content() {
    // print(productDetailController!.productdetail.data.item.price);
    // print(productDetailController!.productdetail.data.item.price != "0");
    final oCcy = new NumberFormat("#,##0", "en_US");
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productDetailController!.productdetail.data.item.name,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            maxLines: 3,
          ),
          SizedBox(
            height: 10,
          ),
          (productDetailController!.productdetail.data.item.price != "0")
              ? Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${oCcy.format(int.tryParse(productDetailController!.productdetail.data.item.priceSale))} đ',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${oCcy.format(int.tryParse(productDetailController!.productdetail.data.item.price))} đ',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Text(
                  'Liên Hệ',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
          Divider(),
          Center(
            child: Container(
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 3,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Mã sản phẩm: ${productDetailController!.productdetail.data.item.id}'),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Thương hiệu: ${productDetailController!.productdetail.data.item.descriptionSeo}',
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget infoDecoration() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              SvgPicture.asset(
                "assets/svg/safe.svg",
                height: 25,
                width: 25,
                color: Colors.blue,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Hàng chính hàng,\nbảo hành\ntoàn quốc',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(
                "assets/svg/truck.svg",
                color: Colors.blue,
                height: 25,
                width: 25,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Giao hàng ngay,\n(Nội thành\nHà Nội - TP.HCM)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(
                "assets/svg/hot_outline.svg",
                color: Colors.blue,
                height: 25,
                width: 25,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Giao trong vòng,\n2 đến 3 ngày\n(Toàn quốc)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget body() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Mô tả sản phẩm',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Html(
              data:
                  productDetailController!.productdetail.data.item.description,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget postsSame() {
    if (productDetailController!.listAllProduct.length > 0) {
      return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Tin đăng tương tự",
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: productDetailController!.listAllProduct
                      .map(
                        (e) => ProductSameList(
                          width: Get.width / 2,
                          product: e,
                          // image: listImage[0],
                          image: e.proDir == null
                              ? listImage[0]
                              : API.share.baseSite +
                                  '/upload/img/products/' +
                                  e.proDir +
                                  "/${e.image}",
                          onClick: (() async {
                            productDetailController!.id = e.id;
                            await productDetailController!
                                .getDetailProduct(int.parse(e.id));
                          }),
                        ),
                      )
                      .toList()),
            )
            // SizedBox(
            //   height: 50,
            // ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  var listImage = [
    'https://thumbs.dreamstime.com/b/marvel-logo-marvel-logo-red-background-vector-format-aviable-ai-127114750.jpg',
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
}

class ProductSameList extends StatelessWidget {
  ProductSameList({
    Key? key,
    this.width,
    this.showCart = true,
    this.image,
    this.product,
    required this.onClick,
  }) : super(key: key);

  double? width;
  bool? showCart;
  String? image;
  Pro? product;
  VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
                onClick();
                print("object");
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
