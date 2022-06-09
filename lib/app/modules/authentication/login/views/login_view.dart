import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/modules/authentication/register/views/register_view.dart';
import 'package:tenant_app/constants.dart';
import 'package:tenant_app/widgets/custom_button.dart';
import 'package:tenant_app/widgets/loading.dart';
import 'package:tenant_app/widgets/password_field.dart';

import '../../../../../widgets/input_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: blueColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Icon(
                Icons.roofing_outlined,
                size: 35,
                color: blueColor,
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text(
                'RENT ASSIST',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                    color: blueColor),
              ),
            ),

            // const Text('Enter your credentials.'),
            const SizedBox(
              height: 80,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.70,
              decoration: BoxDecoration(
                color: whiteColor,
                border: Border.all(width: 2, color: whiteColor),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'Welcome',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: InputField(
                      'Email',
                      const Icon(
                        Icons.email_outlined,
                        color: blueColor,
                      ),
                      controller: controller.emailController,
                      inputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: PasswordField(
                      'password',
                      controller: controller.passwordController,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Obx(() => controller.isLoading.isTrue
                      ? const Loading(
                          size: 100,
                        )
                      : Center(
                          child: CustomButton('Login', () {
                          controller.login();
                        }, whiteColor, blueColor))),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const Text('Forgot password?'),
                      // const SizedBox(height: 20),
                      TextButton(
                          onPressed: () {
                            Get.to(() => RegisterView());
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton('Register', () {
                        controller.login();
                      }, blueColor, whiteColor)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
