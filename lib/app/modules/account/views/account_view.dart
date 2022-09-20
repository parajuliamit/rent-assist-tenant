import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/modules/account/widgets/logout_button.dart';

import '../../../routes/app_pages.dart';
import '../controllers/account_controller.dart';
import '../saved_payment/views/saved_payment_view.dart';
import '../widgets/item_tile.dart';

class AccountView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
            child: Column(
          children: [
            ItemTile(
              icon: Icons.save_alt_rounded,
              label: 'Saved Payment',
              onPress: () {
                Get.toNamed(Routes.SAVED_PAYMENT);
              },
            ),
            ItemTile(
              icon: Icons.edit,
              label: 'Edit Profile',
              onPress: () {
                Get.toNamed(Routes.EDIT_PROFILE);
              },
            ),
            ItemTile(
              icon: Icons.change_circle_outlined,
              label: 'Change Password',
              onPress: () {
                Get.toNamed(Routes.CHANGE_PASSWORD);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            LogoutButton(),
          ],
        )),
      ),
    );
  }
}
