import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../utils/constants.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/loading.dart';
import '../controllers/chat_controller.dart';
import 'widgets/chat_bubble.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
        ),
        body: Obx(() => controller.isMessageLoading.isTrue
            ? const Loading()
            : controller.isError.isTrue
                ? ErrorPage(controller.errorMessage, controller.loadMessage)
                : Column(
                    children: [
                      Expanded(
                        child: GetBuilder<ChatController>(
                          builder: (controller) {
                            return ListView.builder(
                                itemCount: controller.formattedMessage.length,
                                reverse: true,
                                itemBuilder: (context, index) {
                                  return ChatBubble(
                                    message: controller.formattedMessage[index],
                                  );
                                });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 5, 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: controller.messageController,
                                cursorColor: kPrimaryColor,
                                style: const TextStyle(fontSize: 17),
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 15),
                                    filled: true,
                                    isDense: true,
                                    fillColor: kPrimaryColor.withOpacity(0.1),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 2,
                                          color: kPrimaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: kPrimaryColor.withOpacity(0.7),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: kPrimaryColor.withOpacity(0.7),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                            ),
                            Obx(() => controller.isLoading.isTrue
                                ? Container(
                                    padding: const EdgeInsets.all(5),
                                    width: 30,
                                    height: 30,
                                    child: const CircularProgressIndicator(
                                      color: kPrimaryColor,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      controller.sendMessage();
                                    },
                                    icon: const Icon(
                                      Icons.send,
                                      color: kPrimaryColor,
                                    )))
                          ],
                        ),
                      )
                    ],
                  )));
  }
}
