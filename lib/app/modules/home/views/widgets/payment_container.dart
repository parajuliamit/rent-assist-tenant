import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenant_app/app/routes/app_pages.dart';

import '../../../../utils/constants.dart';
import 'homepage_button.dart';

class PaymentContainer extends StatelessWidget {
  const PaymentContainer({Key? key}) : super(key: key);

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
        SizedBox(
          height: 205,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Container(
              width: 220,
              height: 185,
              margin: EdgeInsets.fromLTRB(
                  index == 0 ? 15 : 10, 0, index == 4 ? 15 : 10, 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'June',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const PaymentRow('Basic Rent', '10000'),
                  const PaymentRow('Paid upto', '5 June 2022'),
                  const PaymentRow('Old rent due', '1000'),
                  const SizedBox(
                    height: 5,
                  ),
                  HomePageButton(
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
