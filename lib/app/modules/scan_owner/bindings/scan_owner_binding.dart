import 'package:get/get.dart';

import '../controllers/scan_owner_controller.dart';

class ScanOwnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanOwnerController>(
      () => ScanOwnerController(),
    );
  }
}
