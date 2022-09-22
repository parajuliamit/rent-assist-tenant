import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app_controller.dart';
import '../../../../utils/constants.dart';
import '../../../navigation/controllers/navigation_controller.dart';
import 'homepage_button.dart';

class LandlordContainer extends StatelessWidget {
  const LandlordContainer({
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
            'Landlord Information',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
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
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: kGreyColor,
                      radius: 25,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${Get.find<AppController>().ownerDetail?.firstName} ${Get.find<AppController>().ownerDetail?.lastName}',
                      style: const TextStyle(
                          // color: kWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: HomePageButton(
                          text: 'Call',
                          textColor: kWhiteColor,
                          fillColor: kPrimaryColor,
                          onpress: () {
                            final Uri launchUri = Uri(
                              scheme: 'tel',
                              path: Get.find<AppController>()
                                  .ownerDetail
                                  ?.ownerPhoneNumber,
                            );
                            launchUrl(launchUri);
                          }),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: HomePageButton(
                          text: 'Message',
                          textColor: kWhiteColor,
                          fillColor: kPrimaryColor,
                          onpress: () {
                            Get.find<NavigationController>().changeIndex(1);
                            // Get.to(OtpVerificationView());
                          }),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
