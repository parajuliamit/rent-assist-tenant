import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../app_controller.dart';
import '../../../app_repository.dart';
import '../../../data/exception/server_exception.dart';
import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final isError = false.obs;
  final appRepo = Get.find<AppRepository>();
  String errorMessage = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getToken();
  }

  Future<void> getToken() async {
    isError(false);
    try {
      if (appRepo.getAuthRepository().checkLogin()) {
        final appController = Get.find<AppController>();
        var profile =
            await Get.find<AppRepository>().getUserRepository().getUerProfile();
        if (profile?.isOwner != false) {
          Get.offAllNamed(Routes.LOGIN);
          return;
        }
        appController.login(profile!);
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    } catch (e) {
      if (e is DioError) {
        errorMessage = ServerError.withError(error: e).getErrorMessage();
        if (errorMessage.contains('Invalid token')) {
          Get.offAllNamed(Routes.LOGIN);
          return;
        }
        isError(true);
      } else {
        isError(true);
        errorMessage = e.toString();
      }
    }
  }

  @override
  void onClose() {}
}
