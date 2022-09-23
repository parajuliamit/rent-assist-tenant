import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tenant_app/app/app_repository.dart';
import 'package:tenant_app/app/data/exception/server_exception.dart';
import 'package:tenant_app/app/data/models/complaints/complaints_response.dart';

class ComplaintController extends GetxController {
  final appRepo = Get.find<AppRepository>();
  final isError = false.obs;
  final isLoading = false.obs;

  String errorMessage = '';

  List<Complaint> complaints = [];

  @override
  void onInit() {
    super.onInit();
    loadComplaints();
  }

  void loadComplaints() async {
    isError(false);
    isLoading(true);

    try {
      var response = await appRepo.getComplaintsRepository().getComplaints();
      response.sort((a, b) => b.id!.compareTo(a.id!));
      complaints = response;
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
