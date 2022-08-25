// import 'package:get/get.dart';
// import 'package:sahashop_customer/app_customer/model/cart_model.dart';
// import 'package:sahashop_customer/app_customer/repository/repository_customer.dart';
// import 'package:sahashop_customer/app_customer/screen_default/login/login_screen.dart';
// import '../../components//toast/saha_alert.dart';
// import '../../model/cart.dart';
// import '../../model/combo.dart';
// import '../../model/order.dart';
// import '../data_app_controller.dart';
//
// class CartController extends GetxController {
//   var listOrder = RxList<LineItem>();
//   var voucherCodeChoose = "".obs;
//   var listQuantityProduct = RxList<int>();
//   var listCombo = RxList<Combo>();
//   var listUsedCombo = RxList<UsedCombo>();
//   var enoughCondition = RxList<bool>([]);
//   var enoughConditionCB = RxList<bool>([]);
//   var cartData = CartModel().obs;
//   var balanceCollaboratorCanUse = 0.0.obs;
//   var balanceCollaboratorUsed = 0.0.obs;
//   var isUseBalanceCollaborator = false.obs;
//   var isLoadingRefresh = false.obs;
//
//   void increaseItem(index, List<DistributesSelected>? listDistributes) {
//     listQuantityProduct[index] = listQuantityProduct[index] + 1;
//     updateItemCart(listOrder[index].id, listOrder[index].product!.id!,
//         listQuantityProduct[index], listDistributes ?? []);
//   }
//
//   void decreaseItem(index, List<DistributesSelected>? listDistributes) {
//     if (listQuantityProduct[index] > 1) {
//       listQuantityProduct[index] = listQuantityProduct[index] - 1;
//       updateItemCart(listOrder[index].id, listOrder[index].product!.id!,
//           listQuantityProduct[index], listDistributes ?? []);
//     } else {
//       return;
//     }
//   }
//
//   Future<void> refresh() async {
//     isLoadingRefresh.value = true;
//     listCombo([]);
//     listUsedCombo([]);
//     listOrder([]);
//     listQuantityProduct([]);
//     getComboCustomer();
//     getItemCart();
//   }
//
//   Future<void> getComboCustomer() async {
//     List<Combo> listComboNew = [];
//     List<bool> enoughConditionNew = [];
//     List<bool> enoughConditionCBNew = [];
//     try {
//       var res = await CustomerRepositoryManager.marketingRepository
//           .getComboCustomer();
//       res!.data!.forEach((e) {
//         bool checkInCombo = false;
//         for (int i = 0; i < listOrder.length; i++) {
//           int checkHasInCombo = e.productsCombo!.indexWhere(
//               (element) => element.product!.id == listOrder[i].product!.id);
//           if (checkHasInCombo != -1) {
//             checkInCombo = true;
//             break;
//           } else {}
//         }
//         if (checkInCombo == true) {
//           listComboNew.add(e);
//           enoughConditionNew.add(false);
//           enoughConditionCBNew.add(false);
//         }
//       });
//       enoughCondition(enoughConditionNew);
//       enoughConditionCB(enoughConditionCBNew);
//       listCombo(listComboNew);
//
//       for (int i = 0; i < listCombo.length; i++) {
//         var checkEnough = listUsedCombo
//             .indexWhere((element) => element.combo!.id == listCombo[i].id);
//         if (checkEnough != -1) {
//           enoughCondition[i] = true;
//           for (int j = 0; j < listOrder.length; j++) {
//             var index = listUsedCombo[checkEnough]
//                 .combo!
//                 .productsCombo!
//                 .indexWhere((el) => el.product!.id == listOrder[j].product!.id);
//             if (index != -1) {
//               if (listUsedCombo[checkEnough]
//                       .combo!
//                       .productsCombo![index]
//                       .quantity! <=
//                   listOrder[j].quantity!) {
//                 enoughConditionCB[i] = true;
//               } else {
//                 enoughConditionCB[i] = false;
//                 break;
//               }
//             }
//           }
//         } else {
//           enoughCondition[i] = false;
//         }
//       }
//     } catch (err) {
//       SahaAlert.showError(message: err.toString());
//     }
//     enoughCondition.refresh();
//     enoughConditionCB.refresh();
//     cartData.refresh();
//   }
//
//   Future<void> getItemCart() async {
//     List<int> listQuantityProductNew = [];
//     try {
//       var res = await CustomerRepositoryManager.cartRepository.getItemCart(
//           voucherCodeChoose.value,
//           cartData.value.isUsePoints!,
//           isUseBalanceCollaborator.value);
//       listOrder(res!.data!.lineItems!);
//       listUsedCombo(res.data!.usedCombos!);
//       res.data!.lineItems!.forEach((element) {
//         listQuantityProductNew.add(element.quantity!);
//       });
//       cartData.value = res.data!;
//       balanceCollaboratorCanUse.value =
//           res.data!.balanceCollaboratorCanUse ?? 0;
//       balanceCollaboratorUsed.value = res.data!.balanceCollaboratorUsed ?? 0;
//       listQuantityProduct(listQuantityProductNew);
//       getComboCustomer();
//     } catch (err) {
//       SahaAlert.showError(message: err.toString());
//     }
//     isLoadingRefresh.value = false;
//   }
//
//   Future<void> addVoucherCart(String codeVoucher) async {
//     List<int> listQuantityProductNew = [];
//     cartData.value.voucherDiscountAmount = 0.0;
//     try {
//       var res = await CustomerRepositoryManager.cartRepository.addVoucherCart(
//           codeVoucher,
//           cartData.value.isUsePoints!,
//           isUseBalanceCollaborator.value);
//       listOrder(res!.data!.lineItems!);
//       listUsedCombo(res.data!.usedCombos!);
//       res.data!.lineItems!.forEach((element) {
//         listQuantityProductNew.add(element.quantity!);
//       });
//       listQuantityProduct(listQuantityProductNew);
//       cartData.value = res.data!;
//       balanceCollaboratorCanUse.value =
//           res.data!.balanceCollaboratorCanUse ?? 0;
//       balanceCollaboratorUsed.value = res.data!.balanceCollaboratorUsed ?? 0;
//       print("=======================${cartData.value.isUsePoints}");
//       getComboCustomer();
//     } catch (err) {
//       print(err);
//       // SahaAlert.showError(message: err.toString());
//     }
//   }
//
//   Future<void> updateItemCart(int? lineItemId, int productId, int quantity,
//       List<DistributesSelected> listDistributes) async {
//     print("ssss");
//     List<int> listQuantityProductNew = [];
//     try {
//       var res = await CustomerRepositoryManager.cartRepository.updateItemCart(
//           lineItemId,
//           productId,
//           quantity,
//           listDistributes,
//           voucherCodeChoose.value);
//       listOrder(res!.data!.lineItems!);
//       listUsedCombo(res.data!.usedCombos!);
//       res.data!.lineItems!.forEach((element) {
//         listQuantityProductNew.add(element.quantity!);
//       });
//       listQuantityProduct(listQuantityProductNew);
//       cartData.value = res.data!;
//       getComboCustomer();
//     } catch (err) {
//       voucherCodeChoose.value = "";
//       refresh();
//       SahaAlert.showError(message: err.toString());
//     }
//   }
//
//   Future<void> addItemCart(int? idProduct, int quantity,
//       List<DistributesSelected> listDistributes) async {
//     DataAppCustomerController dataAppCustomerController = Get.find();
//     print(dataAppCustomerController.isLogin.value);
//     if (dataAppCustomerController.isLogin.value == true) {
//       List<int> listQuantityProductNew = [];
//       try {
//         var res = await CustomerRepositoryManager.cartRepository
//             .addItemCart(idProduct, quantity, listDistributes);
//         listOrder(res!.data!.lineItems!);
//         listUsedCombo(res.data!.usedCombos!);
//         res.data!.lineItems!.forEach((element) {
//           listQuantityProductNew.add(element.quantity!);
//         });
//         listQuantityProduct(listQuantityProductNew);
//         cartData.value = res.data!;
//         getComboCustomer();
//       } catch (err) {
//         SahaAlert.showError(message: err.toString());
//       }
//     } else {
//       Get.to(() => LoginScreenCustomer())!
//           .then((value) => {dataAppCustomerController.getBadge()});
//     }
//   }
// }

import 'package:appbanhang/@core/hive_manager.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var listPro = [].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getListPro();
  }

  void getListPro() {
    listPro = HiveService.share.getBoxes();
  }
}
