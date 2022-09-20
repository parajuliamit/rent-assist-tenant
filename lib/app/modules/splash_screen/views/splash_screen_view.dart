import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/constants.dart';
import '../../../widgets/error_page.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Obx(() => controller.isError.isTrue
              ? ErrorPage(controller.errorMessage, controller.getToken)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.roofing_outlined,
                      size: 45,
                      color: kWhiteColor,
                    ),
                    Text(
                      'RENT ASSIST',
                      style: TextStyle(fontSize: 35, color: kWhiteColor),
                    )
                  ],
                )),
        ));
  }
}
