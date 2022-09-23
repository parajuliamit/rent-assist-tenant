import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/modules/complaint/add_complaint/views/widgets/add_image_container.dart';
import 'package:tenant_app/app/modules/complaint/add_complaint/views/widgets/complain_input.dart';
import 'package:tenant_app/app/utils/app_utils.dart';
import 'package:tenant_app/app/widgets/widgets.dart';

import '../../../../utils/constants.dart';
import '../controllers/add_complaint_controller.dart';

class AddComplaintView extends GetView<AddComplaintController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('New Complaint'),
            centerTitle: false,
          ),
          body: Obx(() => controller.isLoading.isTrue
              ? const Loading()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: kPrimaryColor)),
                          child: DropdownButtonHideUnderline(
                            child: Obx(() => DropdownButton(
                                value: controller.category.value,
                                hint: const Text('Select Category'),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                elevation: 3,
                                isExpanded: true,
                                items: const [
                                  DropdownMenuItem(
                                      value: 0, child: Text('Select Category')),
                                  DropdownMenuItem(
                                      value: 1, child: Text('Water problem')),
                                  DropdownMenuItem(
                                      value: 2,
                                      child: Text('Electricity problem')),
                                  DropdownMenuItem(
                                      value: 3, child: Text('Room problem')),
                                  DropdownMenuItem(
                                      value: 4, child: Text('Other problems')),
                                ],
                                onChanged: (value) {
                                  controller.category.value = value as int;
                                })),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(() => ComplainInput(
                              'Title',
                              controller: controller.titleController,
                              errorMessage: controller.titleError.value,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(() => ComplainInput(
                              "Description",
                              maxlines: 5,
                              controller: controller.descriptionController,
                              textInputAction: TextInputAction.done,
                              errorMessage: controller.descriptionError.value,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Urgency Level',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Obx(
                          () => Slider(
                            value: controller.urgencyLevel.value,
                            min: 0.0,
                            max: 3.0,
                            divisions: 3,
                            activeColor: kPrimaryColor,
                            inactiveColor: kGreyColor,
                            onChanged: (double newValue) {
                              if (newValue < 1) {
                                controller.urgencyLevel.value = 1.0;
                              } else {
                                controller.urgencyLevel.value = newValue;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Image',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const InsertImageContainer(),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton('Submit', () {
                          FocusScope.of(context).unfocus();
                          controller.postComplaint();
                        })
                      ],
                    ),
                  ),
                ))),
    );
  }
}
