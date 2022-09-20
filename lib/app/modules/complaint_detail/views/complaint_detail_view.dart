import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../controllers/complaint_detail_controller.dart';

class ComplaintDetailView extends GetView<ComplaintDetailController> {
  Color getColor(String urgencyLevel) {
    if (urgencyLevel == "H") return Colors.red;
    if (urgencyLevel == "I") return Colors.yellow;
    if (urgencyLevel == "L") return Colors.green;
    return Colors.blueGrey;
  }

  Text getText(String urgencyLevel) {
    if (urgencyLevel == "H") return Text('High');
    if (urgencyLevel == "I") return Text('Intermediate');
    if (urgencyLevel == "L") return Text('Low');
    return Text('Level');
  }

  // var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.complaint?.title ?? ''),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Urgency level:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      controller.complaint?.urgencyLevel ?? ''.toString(),
                      style: TextStyle(
                        fontSize: 20,
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
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kGreyColor.withOpacity(0.5),
                  ),
                  child: Text(
                    controller.complaint?.description ?? '',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Problem Images',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kGreyColor.withOpacity(0.5),
                  ),
                  child: Image.network(
                      baseUrl + '${controller.complaint?.image ?? ''}'),
                ),
              ],
            ),
          ),
        ));
  }
}
