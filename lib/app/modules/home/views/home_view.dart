import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/modules/home/views/widgets/contract_container.dart';

import 'widgets/complain_row.dart';
import 'widgets/landlord_container.dart';
import 'widgets/payment_container.dart';
import 'widgets/user_info.dart';

class HomeView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            UserInfo(),
            LandlordContainer(),
            SizedBox(
              height: 10,
            ),
            ComplainRow(),
            SizedBox(
              height: 10,
            ),
            PaymentContainer(),
            SizedBox(
              height: 10,
            ),
            ContractContainer(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
