import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenant_app/app/app_repository.dart';
import 'package:tenant_app/app/routes/app_pages.dart';
import 'package:tenant_app/app/utils/app_utils.dart';

import '../../../../data/exception/server_exception.dart';
import '../../../../data/models/auth/register_request.dart';

class RegisterController extends GetxController {
  final authRepo = Get.find<AppRepository>().getAuthRepository();

  final isLoading = false.obs;
  late final TextEditingController fnameController;
  late final TextEditingController lnameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController phoneController;

  final fnameError = ''.obs;
  final lnameError = ''.obs;
  final emailError = ''.obs;
  final passwordError = ''.obs;
  final confirmPasswordError = ''.obs;
  final phoneError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fnameController = TextEditingController();
    lnameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();

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
    phoneController.addListener(() {
      phoneError.value = "";
    });
  }

  Future<void> register() async {
    isLoading(true);
    String fname = fnameController.text.trim();
    String lname = lnameController.text.trim();

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String phone = phoneController.text.trim();
    if (validateInput(fname, lname, email, password, confirmPassword, phone)) {
      try {
        await authRepo.registerUser(RegisterRequest(
            firstName: fname,
            lastName: lname,
            username: email,
            password1: password,
            password2: confirmPassword,
            phoneNumber: phone));
        showSnackbar('Register Successful');
        Get.toNamed(Routes.HOME);
      } catch (e) {
        if (e is DioError) {
          handleError(e);
        } else {
          showSnackbar(e.toString(), isError: true);
        }
      }
    }

    isLoading(false);
  }

  void handleError(DioError e) {
    var error = ServerError.withError(error: e).getError();
    print(error);
    if (error != null) {
      if (error.containsKey('non_field_errors')) {
        showSnackbar(error['non_field_errors']![0], isError: true);
      }
      if (error.containsKey('username')) {
        emailError.value = error['username']![0];
      }
      if (error.containsKey('password1')) {
        passwordError.value = error['password1']![0];
      }
      if (error.containsKey('password2')) {
        confirmPasswordError.value = error['password2']![0];
      }
      if (error.containsKey('phone_number')) {
        phoneError.value = error['phone_number']![0];
      }
      if (error.containsKey('first_name')) {
        fnameError.value = error['first_name']![0];
      }
      if (error.containsKey('last_name')) {
        lnameError.value = error['last_name']![0];
      }
    } else {
      showSnackbar(ServerError.withError(error: e).getErrorMessage(),
          isError: true);
    }
  }

  bool validateInput(String fname, String lname, String email, String password,
      String confirmPassowrd, String phone) {
    bool isValid = true;
    if (!email.isEmail) {
      emailError("Enter a valid email");
      isValid = false;
    }

    if (password.length < 8) {
      passwordError("Passowrd must be at least 8 characters long");
      isValid = false;
    }

    if (password != confirmPassowrd) {
      confirmPasswordError("Password does not match");
      isValid = false;
    }

    if (fname.isEmpty) {
      fnameError("Enter first name");
      isValid = false;
    }
    if (lname.isEmpty) {
      lnameError("Enter last name");
      isValid = false;
    }
    if (phone.length < 10) {
      phoneError("Enter a valid phone number");
      isValid = false;
    }

    return isValid;
  }

  @override
  void onClose() {
    super.onClose();
    fnameController.dispose();
    lnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
