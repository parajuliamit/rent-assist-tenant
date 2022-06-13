import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/modules/authentication/register/views/register_view.dart';
import 'package:tenant_app/app/utils/app_utils.dart';
import 'package:tenant_app/app/utils/constants.dart';
import 'package:tenant_app/widgets/custom_button.dart';
import 'package:tenant_app/widgets/password_field.dart';

import '../../../../../widgets/input_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return WillPopScope(
      onWillPop: () {
        if (controller.isLoading.isTrue) {
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: availableHeight * 0.3,
                  padding: const EdgeInsets.all(10.0),
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
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            color: kWhiteColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: availableHeight * 0.7,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    border: Border.all(width: 2, color: kWhiteColor),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.normal),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => InputField(
                          'Email',
                          const Icon(
                            Icons.email_outlined,
                          ),
                          controller: controller.emailController,
                          inputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          errorMessage: controller.emailError.value,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => PasswordField(
                          'Password',
                          controller: controller.passwordController,
                          errorMessage: controller.passwordError.value,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: () {
                                Get.to(() => RegisterView());
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: kDarkGreyColor,
                                  ),
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        'Login',
                        () {
                          FocusScope.of(context).unfocus();
                          overlayLoading(controller.login);
                        },
                        fillColor: kWhiteColor,
                        textColor: kPrimaryColor,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        'Register',
                        () {
                          controller.login();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
