import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/view_agreement_controller.dart';

class ViewAgreementView extends GetView<ViewAgreementController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agreement'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ViewAgreementView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
