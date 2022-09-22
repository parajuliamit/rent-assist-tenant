import 'package:get/get.dart';
import 'package:tenant_app/app/modules/view_agreement/controllers/view_agreement_controller.dart';

import '../../account/controllers/account_controller.dart';
import '../../chat/controllers/chat_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../notification/controllers/notification_controller.dart';
import '../../pay/controllers/pay_controller.dart';
import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
    Get.lazyPut<PayController>(
      () => PayController(),
    );
    Get.lazyPut<NotificationController>(
      () => NotificationController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.put(
      ViewAgreementController(),
    );
  }
}
