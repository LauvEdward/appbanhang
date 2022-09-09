import 'package:appbanhang/component/empty_image_widget/saha_empty_image.dart';
import 'package:appbanhang/component/loading/loading_container.dart';
import 'package:appbanhang/screen/account/profile/contact/contact_controller.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:get/get.dart';

class ContactScreen extends StatelessWidget {
  final ContactController _controller = Get.put(ContactController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      if (_controller.status.value == AppState.DONE) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Contact"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                bannerAds(),
                information(),
                linkLienket(),
              ],
            ),
          ),
          bottomNavigationBar: bottomtext(),
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

  Widget bannerAds() {
    return Container(
      padding: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: CachedNetworkImage(
          width: Get.width,
          height: 100,
          fit: BoxFit.cover,
          imageUrl: _controller.banner.value,
          // "http://chuyennhahanoi.online/lavishop/upload/img/category/ch%C4%83m%20s%C3%B3c%20da.jpg",
          placeholder: (context, url) => SahaLoadingContainer(),
          errorWidget: (context, url, error) => SahaEmptyImage(),
        ),
      ),
    );
  }

  Widget information() {
    return Column(children: [
      Center(
          child: Text(
        _controller.nameShop.value,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      )),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.grey[300]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text("Địa chỉ: ${_controller.address}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text("Điện thoại: ${_controller.phone}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text("Email: ${_controller.email}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }

  Widget linkLienket() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.grey[300]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () async {},
                        child: Text("Facebook: ${_controller.linkfb.value}",
                            style: TextStyle(fontSize: 15)),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () async {},
                        child: Text("Yoututbe: ${_controller.linkyt.value}",
                            style: TextStyle(fontSize: 15)),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () async {},
                        child: Text("Page: ${_controller.linksitepage.value}",
                            style: TextStyle(fontSize: 15)),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }

  Widget bottomtext() {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          _controller.copyRight.value,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
