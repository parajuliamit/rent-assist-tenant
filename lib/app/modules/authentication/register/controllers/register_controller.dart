import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenant_app/app/routes/app_pages.dart';
import 'package:tenant_app/app/utils/app_utils.dart';

import '../views/widgets/register_bottom_sheet.dart';

class RegisterController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final isLoading = false.obs;
  late final TextEditingController fnameController;
  late final TextEditingController lnameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  final fnameError = ''.obs;
  final lnameError = ''.obs;
  final emailError = ''.obs;
  final passwordError = ''.obs;
  final confirmPasswordError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fnameController = TextEditingController();
    lnameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    fnameController.addListener(() {
      fnameError.value = "";
    });
    lnameController.addListener(() {
      lnameError.value = "";
    });

    emailController.addListener(() {
      emailError.value = "";
    });

    passwordController.addListener(() {
      passwordError.value = "";
    });

    confirmPasswordController.addListener(() {
      confirmPasswordError.value = "";
    });
  }

  @override
  void onReady() {
    super.onReady();
    showRegisterBottom();
  }

  Future<void> register() async {
    isLoading(true);
    String fname = fnameController.text.trim();
    String lname = lnameController.text.trim();

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    if (validateInput(fname, email, password, confirmPassword)) {
      await Future.delayed(2.seconds);
      showSnackbar('Register Successful');
      Get.toNamed(Routes.HOME);
    }

    isLoading(false);
  }

  bool validateInput(
      String name, String email, String password, String confirmPassowrd) {
    bool isValid = true;
    if (!email.isEmail) {
      emailError("Enter valid email");
      isValid = false;
    }

    if (password.length < 8) {
      passwordError("Passowrd must be at least 8 characters");
      isValid = false;
    }

    if (password != confirmPassowrd) {
      confirmPasswordError("password doesnot match");
      isValid = false;
    }

    if (name.length < 4) {
      fnameError("Enter a valid name");
      isValid = false;
    }
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.rawSnackbar(message: 'All fields are required');
      isValid = false;
    }
    return isValid;
  }

  void showRegisterBottom() {
    scaffoldKey.currentState?.showBottomSheet(
        (context) => const RegisterBottomSheet(),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        enableDrag: false);
  }

  @override
  void onClose() {
    super.onClose();
    fnameController.dispose();
    lnameController.dispose();

    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
