import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: const [
          CircleAvatar(
            child: Icon(Icons.person),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Hello Amit',
            style: TextStyle(
                color: kWhiteColor, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
