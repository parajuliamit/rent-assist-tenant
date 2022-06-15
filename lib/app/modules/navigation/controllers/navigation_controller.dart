import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenant_app/app/modules/account/views/account_view.dart';
import 'package:tenant_app/app/modules/chat/views/chat_view.dart';
import 'package:tenant_app/app/modules/home/views/home_view.dart';
import 'package:tenant_app/app/modules/notification/views/notification_view.dart';
import 'package:tenant_app/app/modules/pay/views/pay_view.dart';

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;

  List<Widget> pages = [
    HomeView(),
    ChatView(),
    PayView(),
    NotificationView(),
    AccountView()
  ];

  Widget get currentPage => IndexedStack(
        index: selectedIndex.value,
        children: pages,
      );

  void changeIndex(int index) {
    selectedIndex(index);
  }

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
}
