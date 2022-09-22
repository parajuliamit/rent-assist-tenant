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

  QRViewController? qrController;
  final userRepo = Get.find<AppRepository>().getUserRepository();

  final isLoading = false.obs;

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      int? id = int.tryParse(scanData.code ?? '');
      if (id != null) {
        getQrResponse(id);
      }
    });
  }

  Future<void> getQrResponse(int id) async {
    qrController?.pauseCamera();
    isLoading(true);
    try {
      var response = await userRepo.getQrResponse(id.toString());
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

  void logout() {
    Get.find<AppRepository>().getAuthRepository().logout();
    Get.offAllNamed(Routes.LOGIN);
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
