import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/news.dart';
import 'package:appbanhang/screen/navigation/navigation_controller.dart';
import 'package:appbanhang/screen/post/detail/post_detail_screen.dart';
import 'package:appbanhang/screen/post/post_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/empty_image_widget/saha_empty_image.dart';
import '../../component/loading/loading_container.dart';
import 'package:html/parser.dart';

class PostScreen extends StatelessWidget {
  PostController _postController = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Tin tức',
            style: TextStyle(color: Colors.black87),
          ),
          actions: [
            Obx(
              () => Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        NavigationController navigationController =
                            Get.find<NavigationController>();
                        navigationController.moveToTab(1);
                      },
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black87,
                      )),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: new Container(
                      padding: EdgeInsets.all(1),
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: new Text(
                        '${_postController.numberOfItem}',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Wrap(
            children: _postController.listNews.map((e) => postItem(e)).toList(),
          ),
        ),
      ),
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

  Widget postItem(NewsPostData url) {
    return InkWell(
      onTap: (() {
        Get.to(() => PostDetailScreen(id: url.id));
      }),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                color: Colors.black12,
                blurRadius: 10,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: API.share.baseSite + "/${url.image}",
                width: Get.width,
                height: 200,
                fit: BoxFit.cover,
                placeholder: (context, url) => SahaLoadingContainer(
                  height: 40,
                  width: 30,
                ),
                errorWidget: (context, url, error) => Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SahaEmptyImage(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                url.title ?? "",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
              child: Text(
                url.description!.parseHtmlString(),
                style: TextStyle(fontSize: 12, color: Colors.grey),
                maxLines: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on String {
  String parseHtmlString() {
    final document = parse(this);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}
