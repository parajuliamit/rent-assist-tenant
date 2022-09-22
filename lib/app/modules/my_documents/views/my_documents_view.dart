import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tenant_app/app/utils/app_utils.dart';
import 'package:tenant_app/app/widgets/error_page.dart';
import 'package:tenant_app/app/widgets/widgets.dart';

import '../../complaint/add_complaint/views/widgets/icon_container.dart';
import '../controllers/my_documents_controller.dart';

class MyDocumentsView extends GetView<MyDocumentsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Documents'),
        ),
        body: Obx(
          () => controller.isLoading.isTrue
              ? Loading()
              : controller.isError.isTrue
                  ? ErrorPage(controller.errorMessage, controller.getDocument)
                  : controller.documentResponse != null
                      ? Image.network(
                          controller.documentResponse!.citizenship ?? '',
                        )
                      : GetBuilder<MyDocumentsController>(
                          builder: (controller) {
                            return controller.image != null
                                ? Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.file(
                                                controller.image!,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              children: [
                                                FloatingActionButton(
                                                  onPressed: () async {
                                                    await selectImage(context);
                                                  },
                                                  child: const Icon(
                                                    Icons.refresh,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                FloatingActionButton(
                                                  onPressed: () {
                                                    controller.deleteImage();
                                                  },
                                                  child: const Icon(
                                                      Icons.delete_outline,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CustomButton(
                                          'Upload',
                                          () {
                                            overlayLoading(
                                                controller.uploadDocument);
                                          },
                                        )
                                      ],
                                    ),
                                  )
                                : Center(
                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'You have not uploaded any documents yet.',
                                        style: TextStyle(
                                            color: Colors.grey.shade700),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        child: CustomButton('Add Document', () {
                                          selectImage(context);
                                        }),
                                      )
                                    ],
                                  ));
                          },
                        ),
        ));
  }

  Future<void> selectImage(context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Select Image Source'),
            content: Row(
              children: [
                Expanded(
                  child: IconContainer(
                      icon: Icons.camera_alt_outlined,
                      title: 'Camera',
                      onTap: () async {
                        Navigator.pop(context);
                        await controller.getImage(ImageSource.camera);
                      }),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: IconContainer(
                      icon: Icons.image_outlined,
                      title: 'Gallery',
                      onTap: () async {
                        Navigator.pop(context);
                        await controller.getImage(ImageSource.gallery);
                      }),
                ),
              ],
            ),
          );
        });
  }
}
