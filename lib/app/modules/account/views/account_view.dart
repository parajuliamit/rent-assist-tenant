import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AccountView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AccountView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AccountView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
