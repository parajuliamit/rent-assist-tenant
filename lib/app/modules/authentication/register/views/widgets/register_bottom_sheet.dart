import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/widgets.dart';
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
            Obx(
              () => InputField(
                'First name',
                icon: const Icon(
                  Icons.person_outline_outlined,
                ),
                controller: controller.fnameController,
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                errorMessage: controller.fnameError.value,
              ),
            ),
            Obx(
              () => InputField(
                'Last name',
                icon: const Icon(
                  Icons.person_outline_outlined,
                ),
                controller: controller.lnameController,
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                errorMessage: controller.lnameError.value,
              ),
            ),
            Obx(
              () => InputField(
                'Email',
                icon: const Icon(
                  Icons.email_outlined,
                ),
                controller: controller.emailController,
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                errorMessage: controller.emailError.value,
              ),
            ),
            Obx(
              () => PasswordField(
                'password',
                controller: controller.passwordController,
                errorMessage: controller.passwordError.value,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => PasswordField(
                'confirm password',
                controller: controller.confirmPasswordController,
                errorMessage: controller.confirmPasswordError.value,
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
                      Get.back();
                      Get.back();
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
