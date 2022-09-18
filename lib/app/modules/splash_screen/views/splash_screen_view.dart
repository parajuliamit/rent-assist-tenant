import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/utils/constants.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.roofing_outlined,
            size: 35,
            color: kWhiteColor,
          ),
          Text(
            'RENT ASSIST',
            style: TextStyle(fontSize: 25, color: kWhiteColor),
          ),
        ],
      )),
    );
  }
}
