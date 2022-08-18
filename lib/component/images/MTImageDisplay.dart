import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../empty_image_widget/saha_empty_image.dart';
import '../loading/loading_container.dart';

class MtImageDisplay extends StatelessWidget {
  final Function? onClick;
  final List<String> images;
  List<String> listImages = [];

  MtImageDisplay({Key? key, this.onClick, required this.images})
      : super(key: key) {
    listImages = images.cast<String>().toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _myAlbumCard(listImages, "Images");
  }

  _myAlbumCard(List list, String name) {
    if (list.length >= 4) {
      return Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          height: 290,
          width: Get.width,
          padding: EdgeInsets.only(right: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(right: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  getItems(list[0], list[1], 0),
                  SizedBox(
                    height: 1 * SizeConfig.heightMultiplier,
                  ),
                  Expanded(
                    child: getItems(list[2], list[3], list.length - 4),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else if (list.length >= 3) {
      return  getItems(list[0], list[1], 1);

        InkWell(
        onTap: () {
          onClick!(0);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3.0),
          child: CachedNetworkImage(
            imageUrl: list[0],
            height: 200,
            width: Get.width / 2 - 30,
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
      );
    } else if (list.length >= 2) {
      return  getItems(list[0], list[1], 0);

        InkWell(
        onTap: () {
          onClick!(0);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3.0),
          child: CachedNetworkImage(
            imageUrl: list[0],
            height: 200,
            width: Get.width / 2 - 30,
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
      );
    } else if (list.length >= 1) {
      return InkWell(
        onTap: () {
          onClick!(0);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3.0),
          child: CachedNetworkImage(
            imageUrl: list[0],
            height: 200,
            width: Get.width / 2 - 30,
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
      );
    } else {
      return Container();
    }


    return Container();
  }

  getItems(img_path, img_path2, count) {
    return InkWell(
      onTap: () {
        onClick!(listImages.indexOf(img_path));
      },
      child: Container(
        padding: EdgeInsets.only(right: 0),
        width: Get.width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(3.0),
              child: CachedNetworkImage(
                imageUrl: img_path,
                height: 140,
                width: Get.width / 2 - 20,
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
            Spacer(),
            (count > 0)
                ? Stack(
                    alignment: Alignment.center,
                    // overflow: Overflow.visible,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(3.0),
                        child: CachedNetworkImage(
                          imageUrl: img_path2,
                          height: 140,
                          width: Get.width / 2 - 20,
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
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.only(right: 0),
                          height: 140,
                          width: Get.width / 2 - 20,
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(3.0)),
                          child: Center(
                            child: Text(
                              "$count +",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(3.0),
                    child: CachedNetworkImage(
                      imageUrl: img_path2,
                      height: 140,
                      width: Get.width / 2 - 20,
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
          ],
        ),
      ),
    );
  }
}

class SizeConfig {
  static double _screenWidth = Get.width;
  static double _screenHeight = Get.height;
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static double textMultiplier = 0;
  static double imageSizeMultiplier = 0;
  static double heightMultiplier = 10;
  static double widthMultiplier = 0;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    textMultiplier = _blockSizeVertical;
    imageSizeMultiplier = _blockSizeHorizontal;
    heightMultiplier = _blockSizeVertical;
    widthMultiplier = _blockSizeHorizontal;

  }
}
