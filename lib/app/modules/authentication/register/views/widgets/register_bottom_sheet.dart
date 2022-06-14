import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/custom_button.dart';
import '../../../../../../widgets/input_field.dart';
import '../../../../../../widgets/loading.dart';
import '../../../../../../widgets/password_field.dart';
import '../../../../../utils/constants.dart';
import '../../../login/views/login_view.dart';
import '../../controllers/register_controller.dart';

class RegisterBottomSheet extends StatelessWidget {
  const RegisterBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: kWhiteColor,
        border: Border.all(width: 2, color: kWhiteColor),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Create Account',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              'First name',
              const Icon(
                Icons.person_outline_outlined,
              ),
              controller: controller.fnameController,
              inputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            InputField(
              'Last name',
              const Icon(
                Icons.person_outline_outlined,
              ),
              controller: controller.lnameController,
              inputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            InputField(
              'Email',
              const Icon(
                Icons.email_outlined,
              ),
              controller: controller.emailController,
              inputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            PasswordField(
              'password',
              controller: controller.passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            PasswordField(
              'confirm password',
              controller: controller.confirmPasswordController,
            ),
            const SizedBox(
              height: 50,
            ),
            Obx(() => controller.isLoading.isTrue
                ? const Loading(
                    size: 100,
                  )
                : Center(
                    child: CustomButton(
                    'Submit',
                    () {
                      controller.register();
                    },
                    fillColor: kWhiteColor,
                    textColor: kPrimaryColor,
                  ))),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an Account?'),
                TextButton(
                    onPressed: () {
                      Get.to(() => LoginView());
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
