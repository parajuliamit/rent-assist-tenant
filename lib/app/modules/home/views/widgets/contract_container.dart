import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import 'homepage_button.dart';

class ContractContainer extends StatelessWidget {
  const ContractContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                Row(
                  children: const [
                    Text(
                      '1250',
                      style: TextStyle(
                          // color: kWhiteColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'days',
                      style: TextStyle(
                          // color: kWhiteColor,
                          fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Contract until: 20th June 2025',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                HomePageButton(
                    text: 'View Contract',
                    textColor: kWhiteColor,
                    fillColor: kPrimaryColor,
                    onpress: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
