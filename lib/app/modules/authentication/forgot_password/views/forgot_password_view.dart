import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/utils/constants.dart';
import 'package:tenant_app/app/widgets/input_field.dart';

import '../../../../widgets/custom_button.dart';

class ForgotPasswordView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reset password'),
          // backgroundColor: kPrimaryColor,
          centerTitle: true,
        ),
        // backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Forgot',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  // color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Password?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  // color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Confirm your email we will send you the instructions.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  // color: Colors.white70,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const InputField(
                'email',
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                icon: Icon(
                  Icons.email_outlined,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                'Reset Password',
                () {},
                textColor: Colors.white,
                fillColor: kPrimaryColor,
              ),
            ],
          ),
        ));
  }
}
