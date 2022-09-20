import 'package:get/get.dart';

import '../controllers/saved_payment_controller.dart';

class SavedPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedPaymentController>(
      () => SavedPaymentController(),
    );
  }
}
