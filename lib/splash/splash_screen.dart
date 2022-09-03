import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/home/home_screen.dart';
import '../screen/navigation/navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
        (_) => Future.delayed(const Duration(seconds: 1), () {
              Get.offAll(() => NavigationScreen());
            }));
  }

  // Future<void> checkLogin() async {
  //   try {
  //     FirebaseMessaging _messaging;
  //     _messaging = FirebaseMessaging.instance;
  //     _messaging.getToken().then((token) async {
  //       print("FCMTOKEN:" + (token ?? ""));
  //
  //       try {
  //         RepositoryManager.deviceRepository.deviceToken(token!);
  //       } catch (err) {}
  //     });
  //   } catch (err) {}
  //
  //   if (await UserInfo().hasLogged()) {
  //     Get.offAll(() => RouterScreen());
  //   } else {
  //     Get.offAll(() => LoginScreen());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.white,
                  child: Image.asset(
                    "assets/logo_ios.png",
                    height: 300,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
