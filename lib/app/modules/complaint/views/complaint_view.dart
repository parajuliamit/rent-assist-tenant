import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/complaint_controller.dart';

class ComplaintView extends GetView<ComplaintController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ComplaintView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ComplaintView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
