import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/modules/account/widgets/logout_button.dart';

import '../../../routes/app_pages.dart';
import '../controllers/account_controller.dart';
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
              icon: Icons.menu,
              label: 'View Agreement',
              onPress: () {
                Get.toNamed(Routes.VIEW_AGREEMENT);
              },
            ),
            ItemTile(
              icon: Icons.document_scanner,
              label: 'My Documents',
              onPress: () {
                Get.toNamed(Routes.MY_DOCUMENTS);
              },
            ),
            ItemTile(
              icon: Icons.credit_card,
              label: 'Payment History',
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
              icon: Icons.password,
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
