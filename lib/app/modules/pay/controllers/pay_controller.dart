import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:tenant_app/app/app_repository.dart';
import 'package:tenant_app/app/data/exception/server_exception.dart';
import 'package:tenant_app/app/data/models/transaction/payment_request.dart';
import 'package:tenant_app/app/modules/home/controllers/home_controller.dart';
import 'package:tenant_app/app/utils/app_utils.dart';

import '../../../utils/constants.dart';

class PayController extends GetxController {
  late final TextEditingController amountController;
  final transactionRepo = Get.find<AppRepository>().getTransactionRepository();
  // final config = PaymentConfig(
  //   amount: int.parse(amountController.text.trim()), // Amount should be in paisa
  //   productIdentity: 'dell-g5-g5510-2021',
  //   productName: 'Dell G5 G5510 2021',
  //   productUrl: 'https://www.khalti.com/#/bazaar',
  //   additionalData: {
  //     // Not mandatory; can be used for reporting purpose
  //     'vendor': 'Khalti Bazaar',
  //   },
  //   // Not mandatory; makes the mobile field not editable
  // );

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    amountController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void makePayment(context) {
    if (amountController.text.trim().isEmpty) {
      showSnackbar('Please enter amount', isError: true);
      return;
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm Payment'),
            content: KhaltiButton(
              label: 'Pay: रू ${amountController.text.trim()}',
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                foregroundColor: MaterialStateProperty.all(kWhiteColor),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                  const Size(200, 50),
                ),
              ),
              config: PaymentConfig(
                amount: int.parse(amountController.text.trim()) *
                    100, // Amount should be in paisa
                productIdentity: 'rent',
                productName: 'Rent Payment',
                productUrl: 'https://www.khalti.com/#/bazaar',
              ),
              // preferences: [
              //   // Not providing this will enable all the payment methods.
              //   PaymentPreference.khalti,
              //   PaymentPreference.eBanking,
              // ],
              onSuccess: (successModel) {
                print(successModel.idx);
                print(successModel.amount);
                amountController.clear();
                Navigator.pop(context);
                overlayLoading(serverValidate);
              },
              onFailure: (failureModel) {
                Navigator.pop(context);
                showSnackbar(failureModel.message, isError: true);
              },
              onCancel: () {
                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Future<void> serverValidate() async {
    try {
      await transactionRepo.makeTransaction(PaymentRequest(
          paidAmount: int.parse(amountController.text.trim()) * 100));
      showSnackbar('Payment Successful');
      Get.find<HomeController>().getRents();
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
  void onClose() {
    amountController.dispose();
  }
}
