import 'package:get/get.dart';

import '../controllers/pdf_screen_controller.dart';

class PdfScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfScreenController>(
      () => PdfScreenController(),
    );
  }
}
