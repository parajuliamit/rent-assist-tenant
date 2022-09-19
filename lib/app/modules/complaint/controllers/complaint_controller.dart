import 'package:get/get.dart';
import 'package:tenant_app/app/app_repository.dart';

class ComplaintController extends GetxController {
  final appRepo = Get.find<AppRepository>();
  final isError = false.obs;
  final isLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadComplaints();
  }

  void loadComplaints() async {
    isError(false);
    isLoading(true);

    try {} catch (e) {
      print(e);
      isError(true);
    }
    isLoading(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
