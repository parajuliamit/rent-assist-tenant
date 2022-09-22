import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/modules/home/views/widgets/homepage_button.dart';
import 'package:tenant_app/app/utils/constants.dart';
import 'package:tenant_app/app/widgets/custom_button.dart';

import '../controllers/my_documents_controller.dart';

class MyDocumentsView extends GetView<MyDocumentsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Documents'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have not uploaded any documents yet.',
            style: TextStyle(color: Colors.grey.shade700),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: CustomButton('Add Document', () {}),
          )
        ],
      )),
    );
  }
}
