import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenant_app/app/modules/home/controllers/home_controller.dart';
import 'package:tenant_app/app/routes/app_pages.dart';

import '../../../../utils/constants.dart';
import 'homepage_button.dart';

class PaymentContainer extends StatelessWidget {
  const PaymentContainer({Key? key, required this.controller})
      : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Payment',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              InkWell(
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('History',
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold)),
                ),
                onTap: () {
                  Get.toNamed(Routes.SAVED_PAYMENT);
                },
              )
            ],
          ),
        ),
        controller.rents.isEmpty
            ? Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Text('You have no due rents.'))
            : SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.rents.length,
                  itemBuilder: (context, index) => Container(
                    width: 220,
                    height: 150,
                    margin: EdgeInsets.fromLTRB(
                        index == 0 ? 15 : 10, 0, index == 4 ? 15 : 10, 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const Text(
                        //   'June',
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold, fontSize: 18),
                        // ),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        PaymentRow('Total Rent',
                            controller.rents[index].amountToBePaid!),
                        PaymentRow('Paid Amount',
                            controller.rents[index].amountPaidThisMonth!),
                        PaymentRow(
                            'Due Amount', controller.rents[index].dueAmount!),
                        const SizedBox(
                          height: 5,
                        ),
                        double.tryParse(
                                    controller.rents[index].dueAmount ?? '0') ==
                                0
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'All Cleared',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.check_circle,
                                      color: kPrimaryColor,
                                    )
                                  ],
                                ),
                              )
                            : HomePageButton(
                                text: 'Pay',
                                textColor: Colors.white,
                                fillColor: kPrimaryColor,
                                onpress: () {})
                      ],
                    ),
                  ),
                ),
              )
      ],
    );
  }
}

class PaymentRow extends StatelessWidget {
  const PaymentRow(
    this.title,
    this.data, {
    Key? key,
  }) : super(key: key);

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
              child: Text(
            title,
            maxLines: 1,
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          )),
          Expanded(
              child: Text(
            data,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ))
        ],
      ),
    );
  }
}
