import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ChatView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
