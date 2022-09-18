import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/modules/complaint/add_complaint/views/widgets/complain_input.dart';
import 'package:tenant_app/app/widgets/input_field.dart';
import 'package:tenant_app/app/widgets/widgets.dart';

import '../../../../utils/constants.dart';
import '../controllers/add_complaint_controller.dart';

class AddComplaintView extends GetView<AddComplaintController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Complaint'),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select a category',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: kPrimaryColor)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        icon: Icon(Icons.keyboard_arrow_down),
                        elevation: 3,
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                              value: 1, child: Text('Water problem')),
                          DropdownMenuItem(
                              value: 2, child: Text('Electricity problem')),
                          DropdownMenuItem(
                              value: 3, child: Text('Room problem')),
                          DropdownMenuItem(
                              value: 4, child: Text('What problem')),
                          DropdownMenuItem(
                              value: 5, child: Text('This problem')),
                        ],
                        onChanged: (value) {}),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ComplainInput('Title'),
                SizedBox(
                  height: 10,
                ),
                ComplainInput(
                  "Description",
                  maxlines: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Urgency Level',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Slider(
                  value: 3,
                  min: 1.0,
                  max: 5.0,
                  divisions: 5,
                  activeColor: kPrimaryColor,
                  inactiveColor: kGreyColor,
                  label: 'Urgent',
                  onChanged: (double newValue) {},
                ),
                const Text(
                  'Add image',
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
                SizedBox(
                  height: 10,
                ),
                CustomButton('Submit', () {})
              ],
            ),
          ),
        ));
  }
}