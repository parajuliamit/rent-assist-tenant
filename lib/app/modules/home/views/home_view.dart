import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/widgets/error_page.dart';

import '../../../widgets/loading.dart';
import '../controllers/home_controller.dart';
import 'widgets/complain_row.dart';
import 'widgets/contract_container.dart';
import 'widgets/landlord_container.dart';
import 'widgets/payment_container.dart';
import 'widgets/user_info.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Obx(
      () => controller.isLoading.isTrue
          ? const Loading()
          : controller.isError.isTrue
              ? ErrorPage(controller.errorMessage, controller.getRents)
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const UserInfo(),
                      const LandlordContainer(),
                      const SizedBox(
                        height: 10,
                      ),
                      const ComplainRow(),
                      const SizedBox(
                        height: 10,
                      ),
                      PaymentContainer(
                        controller: controller,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ContractContainer(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
    )));
  }
}
