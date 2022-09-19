import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../app_controller.dart';
import '../../../app_repository.dart';
import '../../../data/exception/server_exception.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_utils.dart';

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
        var profile = await appRepo.getUserRepository().getUerProfile();
        if (profile?.isOwner != false) {
          appRepo.getAuthRepository().logout();
          Get.offAllNamed(Routes.LOGIN);
          return;
        }
        appController.login(profile!);
        if (await getOwnerDetail()) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.offAllNamed(Routes.SCAN_OWNER);
        }
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    } catch (e) {
      if (e.toString().contains('SocketException')) {
        isError(true);
        errorMessage = "Check your internet connection";
      } else {
        showSnackbar(e.toString());
        appRepo.getAuthRepository().logout();
        Get.offAllNamed(Routes.LOGIN);
        return;
      }
    }
  }

  Future<bool> getOwnerDetail() async {
    var owner =
        await Get.find<AppRepository>().getUserRepository().getOwnerDetail();
    if (owner == null) {
      return false;
    }
    Get.find<AppController>().setOwner(owner);
    return true;
  }

  @override
  void onClose() {}
}
