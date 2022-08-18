import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../component/dialog/dialog.dart';
import '../../component/empty_image_widget/saha_empty_image.dart';
import '../../component/loading/loading_container.dart';

// class AccountScreenLockScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CheckLogin(child: AccountScreen());
//   }
// }

class AccountScreen extends StatelessWidget {
  //DataAppController dataAppController = Get.find();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cá nhân", style: TextStyle(
          color: Colors.black87,
        ),),
        backgroundColor: Colors.white,
        elevation: 0.5   ,
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
                        imageUrl:
                        'https://photo-cms-kienthuc.zadn.vn/zoom/800/uploaded/nguyenanhson/2019_08_28/4/len-bao-trung-gai-xinh-vong-1-khung-tiet-lo-ve-qua-khu.jpg',
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
                          Text('Hoàng Tiến Sỹ', style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                          ),),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Trang cá nhân của bạn', style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Container(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Đang hiển thị - 1 tin', style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15
                    ),),
                    Divider(),
                    // PostManagerItem(),
                  ],
                ),
              ),

              profileItem(iconData: Icons.featured_play_list, title: 'Cộng tác viên',colorIconBackground: Colors.amber),
              profileItem(iconData: Icons.shopping_cart, title: 'Đơn mua', colorIconBackground: Colors.pink),
              profileItem(iconData: Icons.location_on, title: 'Địa chỉ đã lưu', colorIconBackground: Colors.purple),
              profileItem(iconData: Icons.group, title: 'Bạn bè'),
              profileItem(iconData: Icons.history, title: 'Lịch sử giao dịch', colorIconBackground: Colors.blue),


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
              //Get.to(ChangePassword());
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
  }

  Widget profileItem ({required IconData iconData,required String title, Color? colorIconBackground}) {
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
            child: Icon(iconData, size: 18,color: Colors.white,),
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
