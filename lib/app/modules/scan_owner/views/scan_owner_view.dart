import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/scan_owner_controller.dart';

class ScanOwnerView extends GetView<ScanOwnerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: controller.qrKey,
              onQRViewCreated: controller.onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: GetBuilder<ScanOwnerController>(
              builder: (controller) {
                return Center(
                  child: (controller.result != null)
                      ? Text(
                          'Barcode Type: ${describeEnum(controller.result!.format)}   Data: ${controller.result!.code}')
                      : Text('Scan a code'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
