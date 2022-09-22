import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tenant_app/app/widgets/error_page.dart';

import '../../../utils/constants.dart';
import '../../../widgets/loading.dart';
import '../controllers/view_agreement_controller.dart';

class ViewAgreementView extends GetView<ViewAgreementController> {
  Widget getRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              flex: 6,
              child: Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              )),
          Expanded(
              flex: 2,
              child: Text(
                'Rs ${value}',
                style: const TextStyle(fontSize: 16),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Agreement'),
          centerTitle: true,
        ),
        body: Obx(() => controller.isLoading.isTrue
            ? const Loading()
            : controller.isError.isTrue
                ? ErrorPage(controller.errorMessage, controller.getAgreement)
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.1),
                              border: Border.all(color: kPrimaryColor),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: [
                              getRow("Monthly Rent :",
                                  controller.agreement!.price.toString()),
                              getRow(
                                  "Electricy Charges (per unit) :",
                                  controller.agreement!.electricityRate
                                      .toString()),
                              getRow(
                                  "Water Charge (per month) :",
                                  controller.agreement!.waterUsagePrice
                                      .toString()),
                              getRow(
                                  "Internet Charge :",
                                  controller.agreement!.internetPrice
                                      .toString()),
                              getRow(
                                  "Others(eg. Waste) :",
                                  controller.agreement!.nagarpalikaFohrPrice
                                      .toString()),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Contract Until :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      DateFormat.yMMMd('en_US').format(
                                          DateTime.parse(controller
                                              .agreement!.deadline
                                              .toString())),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        if (controller.agreement!.picture != null)
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child:
                                Image.network(controller.agreement!.picture!),
                          ),
                      ]),
                    ),
                  )));
  }
}
