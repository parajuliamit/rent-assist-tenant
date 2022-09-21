import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tenant_app/app/app_repository.dart';
import 'package:tenant_app/app/data/exception/server_exception.dart';
import 'package:tenant_app/app/data/models/user/create_agreement_request.dart';
import 'package:tenant_app/app/data/models/user/qr_response.dart';
import 'package:tenant_app/app/routes/app_pages.dart';
import 'package:tenant_app/app/utils/app_utils.dart';

class QrResponseController extends GetxController {
  late final QrResponse qrResponse;
  final userRepo = Get.find<AppRepository>().getUserRepository();

  @override
  void onInit() {
    super.onInit();
    qrResponse = Get.arguments;
  }

  Future<void> acceptAgreement() async {
    try {
      var response =
          await userRepo.addTenant((qrResponse.owner ?? 1).toString());
      await userRepo.createAgreement(CreateAgreementRequest(
          tenant: response.meta?.tenantId ?? 3,
          price: qrResponse.price ?? 0,
          internetPrice: qrResponse.internetPrice ?? 0,
          waterUsagePrice: qrResponse.waterUsagePrice ?? 0,
          nagarpalikaFohrPrice: qrResponse.nagarpalikaFohrPrice ?? 0,
          electricityRate: qrResponse.nagarpalikaFohrPrice ?? 0));
      Get.offAllNamed(Routes.SPLASH_SCREEN);
      showSnackbar('Successfully Joined As Tenant');
    } catch (e) {
      if (e is DioError) {
        showSnackbar(ServerError.withError(error: e).getErrorMessage(),
            isError: true);
      } else {
        showSnackbar(e.toString(), isError: true);
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
