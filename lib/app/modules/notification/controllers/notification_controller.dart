import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tenant_app/app/app_repository.dart';

import '../../../data/exception/server_exception.dart';
import '../../../data/models/notifications/notification_response.dart';

class NotificationController extends GetxController {
  final appRepo = Get.find<AppRepository>();
  final isError = false.obs;
  final isLoading = false.obs;

  String errorMessage = '';

  List<Notification> notifications = [];

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  Future<void> loadNotifications() async {
    isError(false);
    isLoading(true);

    try {
      notifications =
          await appRepo.getNotificationRepository().getNotifications();
    } catch (e) {
      print(e);
      isError(true);
      if (e is DioError) {
        errorMessage = ServerError.withError(error: e).getErrorMessage();
      } else {
        errorMessage = e.toString();
      }
    }

    isLoading(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
