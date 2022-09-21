import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../controllers/complaint_detail_controller.dart';

class ComplaintDetailView extends GetView<ComplaintDetailController> {
  Color getColor(String urgencyLevel) {
    if (urgencyLevel == "H") return Colors.red;
    if (urgencyLevel == "I") return Colors.deepOrange;
    if (urgencyLevel == "L") return Colors.deepPurple;
    return Colors.blueGrey;
  }

  String getText(String urgencyLevel) {
    if (urgencyLevel == "H") return 'High';
    if (urgencyLevel == "I") return 'Intermediate';
    if (urgencyLevel == "L") return 'Low';
    return urgencyLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Complaint Detail"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Status:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      controller.complaint?.isSolved == true
                          ? 'SOLVED'
                          : 'Pending',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: controller.complaint?.isSolved == true
                              ? Colors.green
                              : Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Urgency Level:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      getText(
                          controller.complaint?.urgencyLevel ?? ''.toString()),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: getColor(controller.complaint?.urgencyLevel ??
                            ''.toString()),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kGreyColor.withOpacity(0.3),
                      border: Border.all(color: kGreyColor)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.complaint?.title ?? '',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        controller.complaint?.description ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.network(
                    baseUrl + (controller.complaint?.image ?? ''),
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kGreyColor.withOpacity(0.3),
                      border: Border.all(color: kGreyColor)),
                  child: Text(
                    'Remarks: ${controller.complaint?.status}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
