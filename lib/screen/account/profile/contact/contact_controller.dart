import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  var status = AppState.LOADING.obs;
  var banner = "".obs;
  var nameShop = "".obs;
  var address = "".obs;
  var phone = "".obs;
  var email = "".obs;
  var linkfb = "".obs;
  var linksitepage = "".obs;
  var linkyt = "".obs;
  var copyRight = "".obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getContact();
  }

  Future<void> getContact() async {
    final reponse = await API.share.getcontact();
    try {
      banner.value = API.share.baseSite + "/${reponse.data["site_logo"]}";
      nameShop.value = reponse.data["site_name"];
      address.value = reponse.data["address"];
      phone.value = reponse.data["map_phone"];
      email.value = reponse.data["site_email"];
      linkyt.value = reponse.data["link_youtube"];
      linkfb.value = reponse.data["face_id"];
      linksitepage.value = reponse.data["site_fanpage"];
      copyRight.value = reponse.data["coppy_right"];
      status.value = AppState.DONE;
    } catch (e) {
      print(e);
    }
  }
}
