import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../controllers/complaint_detail_controller.dart';

class ComplaintDetailView extends GetView<ComplaintDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ComplaintDetailView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Problem category',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                // ComplainInput('Title'),
                // SizedBox(
                //   height: 10,
                // ),
                // ComplainInput(
                //   "Description",
                //   maxlines: 5,
                // ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Urgency Level',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),

                const Text(
                  'Problem Images',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kGreyColor.withOpacity(0.5),
                  ),
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ));
  }
}
