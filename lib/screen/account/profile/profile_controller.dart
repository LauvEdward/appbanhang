import 'package:appbanhang/@core/shared_preference.dart';
import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/profile.dart';
import 'package:appbanhang/model/user.dart';
import 'package:appbanhang/screen/account/account_controller.dart';
import 'package:appbanhang/screen/account/authen_service.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final AuthenticationController _authenticationController = Get.find();
  var user;
  var status = AppState.LOADING.obs;
  var profile;
  ProfileController(this.user);

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await login();
  }

  AuthenticationState getState() {
    return _authenticationController.state;
  }

  Future<void> login() async {
    status.value = AppState.LOADING;
    final response = await API.share.postProfile(user);
    try {
      if (response.statusCode == 200) {
        var data = response.data["data"];
        // print(data);
        // var datadefault = Product.fromJson(response.data);
        // print("Number of list product ${datadefault.data!.length}");
        profile = Profile.fromJson(data);
        status.value = AppState.DONE;
      }
    } catch (e) {
      print(e);
      status.value = AppState.ERROR;
    }
  }

  void signOut() {
    AppSharePreference.share.removekey();
    _authenticationController.signOut();
  }
}
