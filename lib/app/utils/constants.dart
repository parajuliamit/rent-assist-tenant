import 'package:flutter/material.dart';
import 'package:get/get.dart';

const baseUrl = "https://";

const kPrimaryColor = Colors.blue;
const kSecondaryColor = Colors.orange;
const kGreyColor = Color(0xFFC8CACD);
const kDarkGreyColor = Color(0xFF696969);

void showSnackbar(String message,
    {bool isError = false, bool isBottom = true, Duration? time}) async {
  await Get.closeCurrentSnackbar();
  Get.snackbar(
    isError ? 'Error' : 'Success',
    message,
    duration: time ?? const Duration(seconds: 3),
    snackPosition: isBottom ? SnackPosition.BOTTOM : SnackPosition.TOP,
    colorText: Colors.white,
    isDismissible: true,
    margin: const EdgeInsets.all(10),
    backgroundColor: isError
        ? Colors.red.shade700.withOpacity(0.75)
        : kPrimaryColor.withOpacity(0.6),
  );
}

void showModalLoading(context) {
  showGeneralDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.4), // Background color
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: const Center(child: CircularProgressIndicator()),
      );
    },
  );
}

void hideModalLoading(context) {
  Navigator.pop(context);
}

BoxDecoration kDefaultBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
          color: kGreyColor.withOpacity(0.6),
          offset: const Offset(0, 2),
          blurRadius: 5)
    ]);
