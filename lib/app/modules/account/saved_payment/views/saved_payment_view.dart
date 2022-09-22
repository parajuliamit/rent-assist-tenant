import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/utils/constants.dart';

import '../controllers/saved_payment_controller.dart';

class SavedPaymentView extends GetView<SavedPaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment History'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return const Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(
                Icons.paid_outlined,
                color: kPrimaryColor,
              ),
              title: Text('Paid upto the month of Ashad.'),
              trailing: Icon(Icons.chevron_right),
              subtitle: Text('2079/02/30'),
            ),
          );
        },
      ),
    );
  }
}
