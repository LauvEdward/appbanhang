import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../empty_image_widget/saha_empty_image.dart';
import '../loading/loading_container.dart';

class SahaDialogApp {
  static void showDialogTypeFunction6({
    required String title,
    String? des,
    String? imageUrl,
  }) {
    Get.dialog(
      AlertDialog(
        title: Column(
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl: imageUrl ?? "",
                width: 50,
                height: 50,
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
              borderRadius: BorderRadius.circular(10),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text(title, textAlign: TextAlign.center,)),
              ],
            ),
          ],
        ),
        content: Text(des ?? ""),
      ),
      barrierDismissible: true,
    );
  }

  static void showDialogOneButton(
      {String? mess, bool barrierDismissible = true, Function? onClose}) {
    // flutter defined function
    showDialog(
      barrierDismissible: barrierDismissible,
      context: Get.context!,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Thành công!"),
          content: new Text(
              mess == null ? "Gửi yêu cầu bài hát mới thành công!" : mess),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                onClose!();
              },
            ),
          ],
        );
      },
    );
  }

  static void showDialogNotificationOneButton(
      {String? mess, bool barrierDismissible = true, Function? onClose}) {
    // flutter defined function
    showDialog(
      barrierDismissible: barrierDismissible,
      context: Get.context!,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Thông báo!"),
          content: new Text(mess == null ? "Chú ý!" : mess),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                onClose!();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showDialogInput(
      {String? title,
      String? hintText,
      Function? onInput,
      Function? onCancel}) {
    return showDialog<String>(
        context: Get.context!,
        builder: (BuildContext context) {
          TextEditingController textEditingController =
              new TextEditingController();
          return new AlertDialog(
            contentPadding: const EdgeInsets.all(16.0),
            content: new Row(
              children: <Widget>[
                new Expanded(
                  child: new TextField(
                    autofocus: true,
                    controller: textEditingController,
                    decoration: new InputDecoration(
                        labelText: title ?? "", hintText: hintText ?? ""),
                  ),
                )
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                  child: const Text('Hủy'),
                  onPressed: () {
                    if (onCancel != null) onCancel();
                    Navigator.pop(context);
                  }),
              new FlatButton(
                  child: const Text('Đồng ý'),
                  onPressed: () {
                    onInput!(textEditingController.text);
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  static void showDialogError(
      {required BuildContext context, String? errorMess}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Có lỗi xảy ra"),
          content: new Text(errorMess!),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showDialogYesNo(
      {String? mess,
      bool barrierDismissible = true,
      Function? onClose,
      Function? onOK}) {
    // flutter defined function
    showDialog(
      barrierDismissible: barrierDismissible,
      context: Get.context!,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Thông báo!"),
          content: new Text(mess == null ? "Chú ý!" : mess),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text(
                "Hủy",
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onClose!();
              },
            ),
            new TextButton(
              child: new Text(
                "Đồng ý",
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onOK!();
              },
            ),
          ],
        );
      },
    );
  }
}
