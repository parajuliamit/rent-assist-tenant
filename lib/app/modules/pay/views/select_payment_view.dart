import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/app_utils.dart';

class SelectPaymentView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kPrimaryColor,
      body: Center(
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.HOME);
            // Get.to(() => NavigationView());
            showSnackbar('Payment Successful');
          },
          child: SizedBox(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => Container(
                width: 320,
                height: 320,
                margin: EdgeInsets.fromLTRB(
                    index == 0 ? 15 : 10, 0, index == 4 ? 15 : 10, 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(18)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Text(
                    //   'Payment Method',
                    //   maxLines: 1,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    // ),
                    Image.asset('assets/images/esewa.png'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
