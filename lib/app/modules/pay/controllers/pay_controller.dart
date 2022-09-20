import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class PayController extends GetxController {
  final config = PaymentConfig(
    amount: 10000, // Amount should be in paisa
    productIdentity: 'dell-g5-g5510-2021',
    productName: 'Dell G5 G5510 2021',
    productUrl: 'https://www.khalti.com/#/bazaar',
    additionalData: {
      // Not mandatory; can be used for reporting purpose
      'vendor': 'Khalti Bazaar',
    },
    // Not mandatory; makes the mobile field not editable
  );

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
