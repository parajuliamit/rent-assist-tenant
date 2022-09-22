import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pdf_screen_controller.dart';

class PdfScreenView extends GetView<PdfScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PdfScreenView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("the pdf is:"),
          ],
        ));
  }
}
