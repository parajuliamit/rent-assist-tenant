import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/data/models/complaints/complaints._response.dart';
import 'package:tenant_app/app/widgets/error_page.dart';
import 'package:tenant_app/app/widgets/loading.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/time_ago.dart';
import '../controllers/complaint_controller.dart';

class ComplaintView extends GetView<ComplaintController> {
  Color getColor(String urgencyLevel) {
    if (urgencyLevel == "H") return Colors.red;
    if (urgencyLevel == "I") return Colors.yellow;
    if (urgencyLevel == "L") return Colors.green;
    return Colors.blueGrey;
  }

  Icon getIcon(String urgencyLevel) {
    if (urgencyLevel == "H") return Icon(Icons.gpp_maybe_outlined);
    if (urgencyLevel == "I") return Icon(Icons.error);
    if (urgencyLevel == "L") return Icon(Icons.priority_high_outlined);
    return Icon(Icons.report_off_outlined);
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
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.COMPLAINT_DETAIL,
                            arguments: controller.complaints[index]
                            // Complaint(
                            //     id: controller.complaints[index].id,
                            //     title: controller.complaints[index].title,
                            //     description:
                            //         controller.complaints[index].description,
                            //     date: controller.complaints[index].date,
                            //     urgencyLevel:
                            //         controller.complaints[index].urgencyLevel,
                            //     tenant: controller.complaints[index].tenant,
                            //     image: controller.complaints[index].image),
                            );
                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: Icon(
                            Icons.error_outline,
                            color: getColor(controller
                                .complaints[index].urgencyLevel
                                .toString()),
                          ),
                          title: Text(controller.complaints[index].title ?? ''),
                          trailing: const Icon(Icons.chevron_right),
                          subtitle: Text(convertToAgo(DateTime.parse(
                              controller.complaints[index].date ?? ''))),
                        ),
                      ),
                    );
                  },
                )),
    );
  }
}
