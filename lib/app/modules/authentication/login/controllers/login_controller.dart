import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenant_app/app/utils/app_utils.dart';

import '../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
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

  Future<void> login() async {
    isLoading(true);
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (validateInput(email, password)) {
      await Future.delayed(2.seconds);
      //Login logic here
      showSnackbar('Login Successful');
      Get.toNamed(Routes.HOME);
    }

    isLoading(false);
  }

  bool validateInput(String email, String password) {
    bool isValid = true;
    if (!email.isEmail) {
      emailError("Enter a valid email");
      isValid = false;
    }
    if (password.length < 8) {
      passwordError("Password must be at least 8 characters");
      isValid = false;
    }
    return isValid;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
