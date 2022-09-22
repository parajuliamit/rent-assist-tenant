import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tenant_app/app/utils/constants.dart';

import '../../../widgets/loading.dart';
import '../controllers/scan_owner_controller.dart';

class ScanOwnerView extends GetView<ScanOwnerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Obx(
          () => controller.isLoading.isTrue
              ? const Loading()
              : SafeArea(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: const [
                                  Expanded(
                                    child: Icon(Icons.roofing_outlined,
                                        size: 50, color: Colors.white),
                                  ),
                                  Text(
                                    'Scan Owner QR Code',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                icon: const Icon(Icons.logout),
                                color: Colors.white,
                                onPressed: controller.logout,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: QRView(
                          key: controller.qrKey,
                          onQRViewCreated: controller.onQRViewCreated,
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }
}
