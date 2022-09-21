import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/utils/app_utils.dart';
import 'package:tenant_app/app/utils/constants.dart';
import 'package:tenant_app/app/widgets/custom_button.dart';

import '../controllers/qr_response_controller.dart';

class QrResponseView extends GetView<QrResponseController> {
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please confirm the following details and tap on the 'Accept Agreement' button to accept the agreement and join as a tenant.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Agreement Details",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor)),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.1),
                    border: Border.all(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    getRow("Monthly Rent :",
                        controller.qrResponse.price.toString()),
                    getRow("Electricy Charges (per unit) :",
                        controller.qrResponse.electricityRate.toString()),
                    getRow("Water Charge (per month) :",
                        controller.qrResponse.waterUsagePrice.toString()),
                    getRow("Internet Charge :",
                        controller.qrResponse.internetPrice.toString()),
                    getRow("Others(eg. Waste) :",
                        controller.qrResponse.nagarpalikaFohrPrice.toString()),
                  ],
                ),
              ),
              if (controller.qrResponse.image != null)
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.network(controller.qrResponse.image!),
                ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: CustomButton('Accept Agreement', () {
                    overlayLoading(controller.acceptAgreement);
                  }))
            ]),
          ),
        ));
  }
}
