import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/modules/complaint/add_complaint/views/widgets/add_image_container.dart';
import 'package:tenant_app/app/modules/complaint/add_complaint/views/widgets/complain_input.dart';
import 'package:tenant_app/app/widgets/widgets.dart';

import '../../../../utils/constants.dart';
import '../controllers/add_complaint_controller.dart';

class AddComplaintView extends GetView<AddComplaintController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Complaint'),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select a category',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: kPrimaryColor)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        icon: const Icon(Icons.keyboard_arrow_down),
                        elevation: 3,
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                              value: 1, child: Text('Water problem')),
                          DropdownMenuItem(
                              value: 2, child: Text('Electricity problem')),
                          DropdownMenuItem(
                              value: 3, child: Text('Room problem')),
                          DropdownMenuItem(
                              value: 4, child: Text('What problem')),
                          DropdownMenuItem(
                              value: 5, child: Text('Other problems')),
                        ],
                        onChanged: (value) {}),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const ComplainInput(
                  'Title',
                ),
                const SizedBox(
                  height: 10,
                ),
                const ComplainInput(
                  "Description",
                  maxlines: 5,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Urgency Level',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Slider(
                  value: 3,
                  min: 1.0,
                  max: 3.0,
                  divisions: 3,
                  activeColor: kPrimaryColor,
                  inactiveColor: kGreyColor,
                  label: 'Urgent',
                  onChanged: (double newValue) {},
                ),
                const InsertImageContainer(),
                const SizedBox(
                  height: 10,
                ),
                CustomButton('Submit', () {})
              ],
            ),
          ),
        ));
  }
}
