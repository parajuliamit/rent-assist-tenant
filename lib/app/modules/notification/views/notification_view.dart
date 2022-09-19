import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/utils/time_ago.dart';

import '../../../widgets/error_page.dart';
import '../../../widgets/loading.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notifications'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Loading()
            : controller.isError.isTrue
                ? ErrorPage(
                    controller.errorMessage, controller.loadNotifications)
                : ListView.builder(
                    itemCount: controller.notifications.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          leading: Icon(Icons.notifications),
                          title:
                              Text(controller.notifications[index].title ?? ''),
                          trailing: Icon(Icons.chevron_right),
                          subtitle: Text(convertToAgo(DateTime.parse(
                              controller.notifications[index].created ?? ''))),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
