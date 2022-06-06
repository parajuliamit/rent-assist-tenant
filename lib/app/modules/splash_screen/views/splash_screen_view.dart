import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/routes/app_pages.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SplashScreenView'),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: Text('Go To Login'))),
    );
  }
}
