import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/saved_payment_controller.dart';

class SavedPaymentView extends GetView<SavedPaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SavedPaymentView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SavedPaymentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
