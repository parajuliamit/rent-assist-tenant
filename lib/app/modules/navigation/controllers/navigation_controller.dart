import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenant_app/app/modules/home/views/home_view.dart';

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;

  List<Widget> pages = [
    HomeView(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
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
