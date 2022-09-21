import 'package:get/get.dart';

import '../controllers/qr_response_controller.dart';

class QrResponseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrResponseController>(
      () => QrResponseController(),
    );
  }
}
