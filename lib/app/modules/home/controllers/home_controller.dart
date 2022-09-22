import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tenant_app/app/app_repository.dart';
import 'package:tenant_app/app/data/exception/server_exception.dart';
import 'package:tenant_app/app/data/models/user/rent_response.dart';

class HomeController extends GetxController {
  final userRepo = Get.find<AppRepository>().getUserRepository();
  List<RentResponse> rents = [];

  final isLoading = false.obs;
  final isError = false.obs;

  String errorMessage = '';

  @override
  void onInit() {
    super.onInit();
    getRents();
  }

  Future<void> getRents() async {
    isLoading(true);
    isError(false);

    try {
      rents = await userRepo.getRent();
    } catch (e) {
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
