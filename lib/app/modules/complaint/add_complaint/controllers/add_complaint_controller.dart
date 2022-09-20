import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenant_app/app/app_controller.dart';
import 'package:tenant_app/app/app_repository.dart';
import 'package:tenant_app/app/data/exception/server_exception.dart';
import 'package:tenant_app/app/data/models/complaints/complaints_response.dart';
import 'package:tenant_app/app/utils/app_utils.dart';

class AddComplaintController extends GetxController {
  final complaintRepo = Get.find<AppRepository>().getComplaintsRepository();
  final category = 0.obs;
  final urgencyLevel = 1.0.obs;

  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  final titleError = ''.obs;
  final descriptionError = ''.obs;

  File? image;

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    descriptionController = TextEditingController();

    titleController.addListener(() {
      titleError.value = '';
    });
    descriptionController.addListener(() {
      descriptionError.value = '';
    });
  }

  Future<void> postComplaint() async {
    String title = titleController.text.trim();
    String description = descriptionController.text.trim();
    if (!validateInput(title, description)) {
      return;
    }
    try {
      await complaintRepo.addComplaint(
          Complaint(
              title: title,
              tenant: Get.find<AppController>().profile?.id,
              description: description,
              urgencyLevel: urgencyLevel.value == 1.0
                  ? 'L'
                  : urgencyLevel.value == 2.0
                      ? 'I'
                      : 'H'),
          image);
      Get.back();
      showSnackbar('Complaint added successfully');
    } catch (e) {
      if (e is DioError) {
        showSnackbar(ServerError.withError(error: e).getErrorMessage(),
            isError: true);
      } else {
        showSnackbar(e.toString(), isError: true);
      }
    }
  }

  bool validateInput(String title, String description) {
    bool isValid = true;
    if (title.isEmpty) {
      titleError.value = 'Title is required';
      isValid = false;
    }
    if (description.isEmpty) {
      descriptionError.value = 'Description is required';
      isValid = false;
    }
    return isValid;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
  }
}
