import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tenant_app/app/app_repository.dart';
import 'package:tenant_app/app/data/exception/server_exception.dart';
import 'package:tenant_app/app/routes/app_pages.dart';
import 'package:tenant_app/app/utils/app_utils.dart';

class ScanOwnerController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qrController;
  final userRepo = Get.find<AppRepository>().getUserRepository();

  final isLoading = false.obs;

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      print(scanData);
      result = scanData;
      update();
      if (result?.code != null) {
        getQrResponse(result!.code!);
      }
    });
  }

  Future<void> getQrResponse(String code) async {
    qrController?.pauseCamera();
    isLoading(true);
    try {
      var response = await userRepo.getQrResponse(code);
      await Get.toNamed(Routes.QR_RESPONSE, arguments: response);
    } catch (e) {
      if (e is DioError) {
        showSnackbar(ServerError.withError(error: e).getErrorMessage(),
            isError: true);
      } else {
        showSnackbar(e.toString(), isError: true);
      }
    }
    isLoading(false);
    qrController?.resumeCamera();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    qrController?.dispose();
  }
}
