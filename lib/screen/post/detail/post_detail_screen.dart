import 'package:appbanhang/model/news.dart';
import 'package:appbanhang/model/news_detail.dart';
import 'package:appbanhang/screen/post/detail/post_detail_controller.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class PostDetailScreen extends StatefulWidget {
  final String? id;

  const PostDetailScreen({Key? key, required this.id}) : super(key: key);
  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  PostDetailController? _postDetailController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postDetailController =
        Get.put(PostDetailController(int.parse(widget.id ?? "")));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      if (_postDetailController!.status == AppState.DONE) {
        return Scaffold(
          backgroundColor: Colors.grey[200]!,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black87),
            title: Text(
              _postDetailController!.data.title ?? "",
              style: TextStyle(color: Colors.black87),
            ),
            actions: [
              // IconButton(
              //     onPressed: () {}, icon: Icon(Icons.favorite_border_rounded)),
              // IconButton(
              //     onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined))
            ],
          ),
          body: SingleChildScrollView(
              child: Html(data: _postDetailController!.data.content)),
        );
      } else {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      }
    });
  }
}
