import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pay_controller.dart';

class PayView extends GetView<PayController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PayView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PayView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
