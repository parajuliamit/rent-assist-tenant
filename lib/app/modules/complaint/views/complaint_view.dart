import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/widgets/error_page.dart';
import 'package:tenant_app/app/widgets/loading.dart';

import '../../../utils/time_ago.dart';
import '../controllers/complaint_controller.dart';

class ComplaintView extends GetView<ComplaintController> {
  Color getColor(String urgencyLevel) {
    if (urgencyLevel == "I") return Colors.red;
    return Colors.blueGrey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Complaints'),
      ),
      body: Obx(() => controller.isLoading.isTrue
          ? const Loading()
          : controller.isError.isTrue
              ? ErrorPage(controller.errorMessage, controller.loadComplaints)
              : ListView.builder(
                  itemCount: controller.complaints.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: Icon(
                          Icons.error_outline,
                          color: getColor("I"),
                        ),
                        title: Text(controller.complaints[index].title ?? ''),
                        trailing: const Icon(Icons.chevron_right),
                        subtitle: Text(convertToAgo(DateTime.parse(
                            controller.complaints[index].date ?? ''))),
                      ),
                    );
                  },
                )),
    );
  }
}
