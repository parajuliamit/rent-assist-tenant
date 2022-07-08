import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/utils/constants.dart';
import 'package:tenant_app/app/widgets/widgets.dart';

import '../controllers/pay_controller.dart';

class PayView extends GetView<PayController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        // appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: kDarkGreen, borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Due Amount',
                    style: TextStyle(fontSize: 16, color: kWhiteColor),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rs 50000',
                    // textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kWhiteColor),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                children: [
                  const InputField('Pay Amount', icon: Icon(Icons.money)),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    'Pay Now',
                    () {},
                    fillColor: kWhiteColor,
                    textColor: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
