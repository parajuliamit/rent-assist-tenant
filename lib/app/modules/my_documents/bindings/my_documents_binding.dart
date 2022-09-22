import 'package:get/get.dart';

import '../controllers/my_documents_controller.dart';

class MyDocumentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyDocumentsController>(
      () => MyDocumentsController(),
    );
  }
}
