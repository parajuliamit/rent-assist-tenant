import 'package:get/get.dart';

import '../../../data/models/complaints/complaints_response.dart';

class ComplaintDetailController extends GetxController {
  Complaint? complaint;
  @override
  void onInit() {
    super.onInit();
    print(Get.arguments);
    complaint = Get.arguments as Complaint;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
