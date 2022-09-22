import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tenant_app/app/app_repository.dart';
import 'package:tenant_app/app/data/exception/server_exception.dart';
import 'package:tenant_app/app/data/models/user/get_agreement_response.dart';

class ViewAgreementController extends GetxController {
  final userRepo = Get.find<AppRepository>().getUserRepository();

  GetAgreementResponse? agreement;
  final isLoading = false.obs;
  final isError = false.obs;

  String errorMessage = '';

  @override
  void onInit() {
    super.onInit();
    getAgreement();
  }

  Future<void> getAgreement() async {
    isLoading.value = true;
    isError.value = false;
    try {
      agreement = await userRepo.getAgreement();
      update();
    } catch (e) {
      isError.value = true;
      if (e is DioError) {
        errorMessage = ServerError.withError(error: e).getErrorMessage();
      } else {
        errorMessage = e.toString();
      }
    }
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
