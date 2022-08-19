import 'package:appbanhang/component/empty_image_widget/saha_empty_image.dart';
import 'package:appbanhang/component/loading/loading_container.dart';
import 'package:appbanhang/screen/post/detail/post_detail_screen.dart';
import 'package:appbanhang/screen/product/product_detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class NewsItem extends StatelessWidget {
  NewsItem(
      {Key? key,
      this.width,
      this.showCart = true,
      this.image,
      this.title,
      this.id,
      this.description})
      : super(key: key);

  double? width;
  bool? showCart;
  String? title;
  String? image;
  String? description;
  String? id;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
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
                Get.to(() => PostDetailScreen(id: this.id));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      imageUrl: image!,
                      width: Get.width,
                      height: 100,
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
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                      child: Text(
                        title!,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, bottom: 10),
                      child: Text(
                        description!.parseHtmlString(),
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        maxLines: 3,
                      ),
                    ),
                  ),
                ],
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
