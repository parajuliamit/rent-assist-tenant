import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NotificationView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NotificationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
