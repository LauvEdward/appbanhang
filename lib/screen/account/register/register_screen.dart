import 'package:appbanhang/screen/account/register/list_provice_screen.dart';
import 'package:appbanhang/screen/account/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRegisterScreen extends StatelessWidget {
  // final _passwordController = TextEditingController();
  // final _emailController = TextEditingController();
  MyRegisterController _controller = Get.put(MyRegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Đăng kí tài khoản"),
        elevation: 0,
      ),
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [inforUser(), inforContract(), address()]),
        ),
      ),
    );
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
                      ));
                },
                child: Container(
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
                          Text("Chọn tỉnh thành phố"),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Chọn xã/Phường",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {
                  // Get.to(() => ListProviceScreen());
                },
                child: Container(
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
                          Text("Chọn xã phường"),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    )),
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
}
