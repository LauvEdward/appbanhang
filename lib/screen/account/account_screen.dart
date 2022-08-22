import 'package:appbanhang/screen/account/account_controller.dart';
import 'package:appbanhang/screen/account/authen_service.dart';
import 'package:appbanhang/screen/account/login/login_page.dart';
import 'package:appbanhang/screen/account/profile/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../component/dialog/dialog.dart';
import '../../component/empty_image_widget/saha_empty_image.dart';
import '../../component/loading/loading_container.dart';

class AccountScreen extends StatelessWidget {
  AuthenticationController controller =
    Get.put(AuthenticationController(FakeAuthenticationService()));
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      if (controller.state is UnAuthenticated) {
        return LoginPage();
      }

      if (controller.state is Authenticated) {
        return ProfileScreen(
          user: (controller.state as Authenticated).user,
        );
      }

      return Container();
    });
  }
}
