import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:tenant_app/app/utils/constants.dart';
import 'package:tenant_app/app/widgets/widgets.dart';

import '../controllers/pay_controller.dart';

class PayView extends GetView<PayController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Icon(
                Icons.roofing_outlined,
                size: 200,
                color: kWhiteColor,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Due Amount',
                      style: TextStyle(fontSize: 16, color: kDarkGreen),
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
                          color: kDarkGreen),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                // color: ,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const InputField('Pay Amount',
                        icon: Icon(
                          Icons.currency_rupee_sharp,
                          color: kPrimaryColor,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    // CustomButton(
                    //   'Pay Now',
                    //   () {
                    //     Get.to(() => SelectPaymentView());
                    //   },
                    //   fillColor: kWhiteColor,
                    //   textColor: kPrimaryColor,
                    // ),
                    KhaltiButton(
                      config: controller.config,
                      // preferences: [
                      //   // Not providing this will enable all the payment methods.
                      //   PaymentPreference.khalti,
                      //   PaymentPreference.eBanking,
                      // ],
                      onSuccess: (successModel) {
                        print(successModel.idx);
                        print(successModel.amount);
                        // Perform Server Verification
                      },
                      onFailure: (failureModel) {
                        // What to do on failure?
                      },
                      onCancel: () {
                        // User manually cancelled the transaction
                      },
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
