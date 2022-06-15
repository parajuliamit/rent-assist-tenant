import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import 'homepage_button.dart';

class LandlordContainer extends StatelessWidget {
  const LandlordContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 5, bottom: 15),
            child: Text(
              'Landlord Information',
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 16,
              ),
            ),
          ),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: kWhiteColor,
                radius: 30,
                child: Icon(Icons.person),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Sunil Thapa',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Leknath, Pokhara',
                    style: TextStyle(color: kWhiteColor, fontSize: 14),
                  )
                ],
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
                    textColor: kDarkGreen,
                    fillColor: kWhiteColor,
                    onpress: () {}),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: HomePageButton(
                    text: 'Message',
                    textColor: kWhiteColor,
                    fillColor: kDarkGreen,
                    onpress: () {}),
              )
            ],
          ),
        ],
      ),
    );
  }
}
