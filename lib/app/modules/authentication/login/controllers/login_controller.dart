import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenant_app/app/app_controller.dart';

import '../../../../app_repository.dart';
import '../../../../data/exception/server_exception.dart';
import '../../../../data/models/auth/login_request.dart';
import '../../../../data/models/auth/register_device_request.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_utils.dart';
import '../views/widgets/login_bottom_sheet.dart';

class LoginController extends GetxController {
  final authRepo = Get.find<AppRepository>().getAuthRepository();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  final emailError = "".obs;
  final passwordError = "".obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailController.addListener(() {
      emailError.value = "";
    });
    passwordController.addListener(() {
      passwordError.value = "";
    });
  }

  @override
  void onReady() {
    super.onReady();
    showLoginBottom();
  }

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (validateInput(email, password)) {
      try {
        await authRepo.login(LoginRequest(username: email, password: password));
        registerDeviceId();
        if (await getOwnerDetail()) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.offAllNamed(Routes.SCAN_OWNER);
        }
        showSnackbar('Login Successful');
      } catch (e) {
        if (e is DioError) {
          handleError(e);
        } else {
          showSnackbar(e.toString(), isBottom: false, isError: true);
        }
      }
    }
  }

  void registerDeviceId() async {
    try {
      var messaging = FirebaseMessaging.instance;
      var deviceToken = await messaging.getToken();
      if (deviceToken == null) return;
      await authRepo.registerDevice(RegisterDeviceRequest(
          registrationId: deviceToken,
          type: Platform.isIOS ? 'ios' : 'android'));
    } catch (e) {
      print(e);
    }
  }

  Future<bool> getOwnerDetail() async {
    try {
      var owner =
          await Get.find<AppRepository>().getUserRepository().getOwnerDetail();
      if (owner == null) {
        return false;
      }
      Get.find<AppController>().setOwner(owner);
      return true;
    } catch (e) {
      if (e is DioError) {
        showSnackbar(ServerError.withError(error: e).getErrorMessage());
      } else {
        showSnackbar(e.toString(), isBottom: false, isError: true);
      }
      return false;
    }
  }

  // void registerDeviceId() async {
  //   try {
  //     var messaging = FirebaseMessaging.instance;
  //     var deviceToken = await messaging.getToken();
  //     if (deviceToken == null) return;
  //     await authRepo.registerDeviceId(RegisterDeviceRequest(
  //         registrationId: deviceToken,
  //         type: Platform.isIOS ? 'ios' : 'android'));
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  bool validateInput(String email, String password) {
    bool isValid = true;
    // if (!email.isEmail) {
    //   emailError("Enter a valid email");
    //   isValid = false;
    // }
    // if (password.length < 8) {
    //   passwordError("Password must be at least 8 characters");
    //   isValid = false;
    // }
    return isValid;
  }

  void handleError(DioError e) {
    var error = ServerError.withError(error: e).getError();
    if (error != null) {
      if (error.containsKey('detail')) {
        showSnackbar(error['detail'], isError: true);
        return;
      }
      if (error.containsKey('non_field_errors')) {
        showSnackbar(error['non_field_errors']![0], isError: true);
      }
    } else {
      showSnackbar(ServerError.withError(error: e).getErrorMessage(),
          isError: true);
    }
  }

  void showLoginBottom() {
    scaffoldKey.currentState?.showBottomSheet(
        (context) => const LoginBottomSheet(),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        enableDrag: false);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
