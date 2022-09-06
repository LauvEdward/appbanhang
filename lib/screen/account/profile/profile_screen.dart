import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/component/dialog/dialog.dart';
import 'package:appbanhang/component/empty_image_widget/saha_empty_image.dart';
import 'package:appbanhang/component/loading/loading_container.dart';
import 'package:appbanhang/model/user.dart';
import 'package:appbanhang/screen/account/authen_service.dart';
import 'package:appbanhang/screen/account/profile/myorder/myorder.dart';
import 'package:appbanhang/screen/account/profile/profile_controller.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class ProfileScreen extends StatefulWidget {
//   User user;

//   ProfileScreen({Key? key, required this.user}) : super(key: key);

//   @override
//   _ProfileScreen createState() {
//     return _ProfileScreen();
//   }
// }

class ProfileScreen extends StatelessWidget {
  final User user;
  ProfileScreen({Key? key, required this.user}) : super(key: key);
  Widget build(BuildContext context) {
    final ProfileController _controller = Get.put(ProfileController(user));
    // TODO: implement build
    return Obx(() {
      if (_controller.status.value == AppState.DONE) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              "Cá nhân",
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0.5,
            actions: [
              IconButton(
                  onPressed: () {
                    // Get.to(() => EditProfileUser(
                    //       user: dataAppController.badge.value.currentUser ?? User(),
                    //     ));
                  },
                  icon: Icon(Icons.edit))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl: API.share.baseSite +
                                "/${_controller.profile.avatar}",
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => SahaLoadingContainer(
                              height: 40,
                              width: 40,
                            ),
                            errorWidget: (context, url, error) => Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SahaEmptyImage(),
                            ),
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _controller.profile.fullname,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Trang cá nhân của bạn',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Thông tin',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        Divider(),
                        // PostManagerItem(),
                      ],
                    ),
                  ),
                  // profileItem(
                  //     iconData: Icons.featured_play_list,
                  //     title: 'Cộng tác viên',
                  //     colorIconBackground: Colors.amber),
                  InkWell(
                    onTap: () {
                      Get.to(() => MyorderScreen());
                    },
                    child: profileItem(
                        iconData: Icons.shopping_cart,
                        title: 'Đơn mua',
                        colorIconBackground: Colors.pink),
                  ),
                  InkWell(
                    onTap: () {
                      Get.dialog(AlertDialog(
                        // title: ,
                        title: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text("Địa chỉ của bạn"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: Get.width,
                                  height: 50,
                                  // decoration: BoxDecoration(
                                  //     border:
                                  //         Border.all(color: Colors.blueAccent)),
                                  child: Center(
                                      child: Text(
                                    _controller.profile.address,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.blue),
                                  ))),
                            )
                          ],
                        ),
                      ));
                    },
                    child: profileItem(
                        iconData: Icons.location_on,
                        title: 'Địa chỉ đã lưu',
                        colorIconBackground: Colors.purple),
                  ),
                  // profileItem(iconData: Icons.group, title: 'Bạn bè'),
                  // profileItem(
                  //     iconData: Icons.history,
                  //     title: 'Lịch sử giao dịch',
                  //     colorIconBackground: Colors.blue),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  SahaDialogApp.showDialogYesNo(
                      mess: "Bạn muốn đăng xuất",
                      onOK: () {
                        _controller.signOut();
                        // UserInfo().logout();
                      });
                },
                child: Text(
                  "Đăng xuất",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.grey[500]),
                ),
              ),
              TextButton(
                onPressed: () {
                  _controller.changePassword();
                },
                child: Text(
                  "Thay đổi mật khẩu",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      } else if (_controller.status.value == AppState.LOADING) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else {
        _controller.signOut();
        return Container();
      }
    });
  }

  Widget profileItem(
      {required IconData iconData,
      required String title,
      Color? colorIconBackground}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: colorIconBackground ?? Theme.of(Get.context!).primaryColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(7),
            child: Icon(
              iconData,
              size: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(child: Text(title)),
        ],
      ),
    );
  }
}
