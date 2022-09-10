import 'package:appbanhang/screen/account/register/list_provice_screen.dart';
import 'package:appbanhang/screen/account/register/register_controller.dart';
import 'package:appbanhang/screen/product/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRegisterScreen extends StatelessWidget {
  // final _passwordController = TextEditingController();
  // final _emailController = TextEditingController();
  MyRegisterController _controller = Get.put(MyRegisterController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.status.value == AppState.DONE) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Đăng kí tài khoản"),
            elevation: 0,
          ),
          backgroundColor: Colors.white70,
          body: SingleChildScrollView(
            child: Container(
              child: Column(children: [
                inforUser(),
                inforContract(),
                address(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        addRadioButton(0, "Male"),
                        addRadioButton(1, "Female"),
                        addRadioButton(2, "Other")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Đăng kí',
                        style: TextStyle(
                          color: Color(0xff4c505b),
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            FocusManager.instance.primaryFocus!.unfocus();
                            _onRegisterPressed(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        );
      } else if (_controller.status.value == AppState.LOADING) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else {
        return Scaffold(
          body: AlertDialog(
            content: Text("API ERROR"),
          ),
        );
      }
    });
  }

  Widget inforUser() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 1),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                child: TextFormField(
                  controller: _controller.emailTextController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    hintText: "Nhập Email đăng kí tài khoản",
                    hintStyle: const TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Nhập mật khẩu",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                child: TextField(
                  controller: _controller.passwordTextController,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    hintText: "Nhập mật khẩu",
                    hintStyle: const TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Họ tên",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                child: TextField(
                  controller: _controller.fullnameTextController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    hintText: "Nhập họ tên của bạn",
                    hintStyle: const TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inforContract() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 1),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Số điện thoại",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                child: TextField(
                  controller: _controller.phoneTextController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    hintText: "Nhập số điện thoại của bạn",
                    hintStyle: const TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Số tài khoản",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                child: TextField(
                  controller: _controller.bankAccountTextController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    hintText: "Nhập số tài khoản của bạn",
                    hintStyle: const TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Ghi chú",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                child: TextField(
                  controller: _controller.ghichuTextController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    hintText: "Nhập tên ngân hàng của bạn",
                    hintStyle: const TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget address() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 1),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Tỉnh thành phố",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => ListProvice(
                        provice: _controller.arrProvice,
                        changeText: (String text, String id) {
                          _controller.district.value = "";
                          _controller.provice.value = text;
                          _controller.proviceid.value = id;
                        },
                      ));
                },
                child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_controller.provice.value == ""
                                ? "Chọn tỉnh thành phố"
                                : _controller.provice.value),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    )),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    _controller.provice.value == ""
                        ? "Xã Phường"
                        : _controller.provice.value,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (_controller.provice.isEmpty) {
                    print("object");
                  } else {
                    await _controller.getdistrict(_controller.proviceid.value);
                    Get.to(() => ListProvice(
                          provice: _controller.arrDistrict,
                          changeText: (String text, String id) {
                            _controller.district.value = text;
                          },
                        ));
                  }
                },
                child: Obx(
                  () => Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_controller.district.value == ""
                                ? "Chọn xã phường"
                                : _controller.district.value),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Ghi chú",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    hintText: "Nhập địa chỉ cụ thể của bạn",
                    hintStyle: const TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onRegisterPressed(BuildContext context) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (_controller.emailTextController.value.text == "") {
      _showToast(context, "Vui lòng nhập Email");
      return;
    }
    if (!regex.hasMatch(_controller.emailTextController.value.text)) {
      _showToast(context, "Email sai");
      return;
    }
    if (_controller.passwordTextController.value.text == "") {
      _showToast(context, "Vui lòng nhập Password");
      return;
    }
    if ((_controller.fullnameTextController.value.text
        .contains(new RegExp(r'[0-9]')))) {
      _showToast(context, "Tên không bao gồm số");
      return;
    }
    if (!_controller.phoneTextController.value.text.isNum) {
      _showToast(context, "Số điện thoại phải là số");
      return;
    }
    if (!_controller.bankAccountTextController.value.text.isNum) {
      _showToast(context, "Số tài khoản phải là số");
      return;
    }

    _controller.registerUser();
  }

  void _showToast(BuildContext context, String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: TextStyle(color: Colors.red),
        ),
        action: SnackBarAction(
            label: 'Ẩn', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  Row addRadioButton(int btnIndex, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GetBuilder<MyRegisterController>(
          builder: (_) => Radio(
              activeColor: Colors.blue,
              value: _controller.gender[btnIndex],
              groupValue: _controller.select,
              onChanged: (value) => _controller.onClickRadioButton(value)),
        ),
        Text(title)
      ],
    );
  }
}
