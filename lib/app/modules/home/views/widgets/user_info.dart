import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_controller.dart';
import '../../../../utils/constants.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                child: Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Hello, ${Get.find<AppController>().profile?.firstName}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_on_outlined),
            color: kDarkGreen,
            iconSize: 25,
          )
        ],
      ),
    );
  }
}
