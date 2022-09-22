import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:tenant_app/app/app_controller.dart';
import 'package:tenant_app/app/app_repository.dart';
import 'package:tenant_app/app/data/exception/server_exception.dart';
import 'package:tenant_app/app/data/models/user/document_response.dart';
import 'package:tenant_app/app/utils/app_utils.dart';

class MyDocumentsController extends GetxController {
  File? image;
  final userRepo = Get.find<AppRepository>().getUserRepository();

  DocumentResponse? documentResponse;

  final isError = false.obs;
  final isLoading = false.obs;
  String errorMessage = '';

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      // final imageTemporary = File(image.path);
      final imagePermanent = await savefilePermamently(image.path);

      this.image = imagePermanent;
      update();
    } on PlatformException catch (e) {
      print('failed to pick image $e');
    }
  }

  Future<File> savefilePermamently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  void deleteImage() {
    image = null;
    update();
  }

  Future<void> uploadDocument() async {
    if (image == null) return;
    try {
      await userRepo.uploadDocument(
          image!, Get.find<AppController>().profile!.id!);
      Get.back();
      showSnackbar('Document uploaded successfully');
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
  void onInit() {
    super.onInit();
    getDocument();
  }

  Future<void> getDocument() async {
    isLoading(true);
    isError(false);
    try {
      var response =
          await userRepo.getDocument(Get.find<AppController>().profile!.id!);
      if (response.id != null) {
        documentResponse = response;
      }
    } catch (e) {
      if (e is DioError) {
        errorMessage = ServerError.withError(error: e).getErrorMessage();
      } else {
        errorMessage = e.toString();
      }
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
}
