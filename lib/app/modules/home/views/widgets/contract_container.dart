import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tenant_app/app/utils/time_ago.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/constants.dart';
import '../../../view_agreement/controllers/view_agreement_controller.dart';
import 'homepage_button.dart';

class ContractContainer extends StatelessWidget {
  const ContractContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewAgreementController>(builder: (controller) {
      return controller.agreement == null
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contract Information',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: kPrimaryColor.withOpacity(0.25),
                              spreadRadius: 5,
                              offset: const Offset(0, 3),
                              blurRadius: 10)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        daysRemaining(DateTime.parse(controller
                                    .agreement!.deadline
                                    .toString())) ==
                                null
                            ? const Text(
                                "Contract Expired",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              )
                            : Row(
                                children: [
                                  Text(
                                    daysRemaining(DateTime.parse(controller
                                        .agreement!.deadline
                                        .toString()))!,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    'days remaining',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Contract until: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            Text(
                              DateFormat.yMMMd('en_US').format(DateTime.parse(
                                  controller.agreement!.deadline.toString())),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HomePageButton(
                            text: 'View Agreement',
                            textColor: kWhiteColor,
                            fillColor: kPrimaryColor,
                            onpress: () {
                              Get.toNamed(Routes.VIEW_AGREEMENT);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
