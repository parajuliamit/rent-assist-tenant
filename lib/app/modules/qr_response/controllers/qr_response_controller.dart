import 'package:get/get.dart';
import 'package:tenant_app/app/data/models/user/qr_response.dart';

class QrResponseController extends GetxController {
  late final QrResponse qrResponse;
  @override
  void onInit() {
    super.onInit();
    qrResponse = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
