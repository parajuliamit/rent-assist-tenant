import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../app_controller.dart';
import '../../../app_repository.dart';
import '../../../data/exception/server_exception.dart';
import '../../../data/models/chat/message_request.dart';
import '../../../data/models/chat/message_response.dart';
import '../../../utils/app_utils.dart';

class FormattedMessage {
  String message;
  bool isMe;

  FormattedMessage(this.message, this.isMe);
}

class ChatController extends GetxController {
  final chatRepo = Get.find<AppRepository>().getChatRepository();

  final isLoading = false.obs;
  final isMessageLoading = false.obs;
  final isError = false.obs;
  String errorMessage = '';
  late Timer timer;
  bool isLoaded = false;

  late final TextEditingController messageController;

  List<Message> messages = [];
  List<FormattedMessage> formattedMessage = [];

  @override
  void onInit() {
    super.onInit();
    messageController = TextEditingController();
    loadMessage();
    timer = Timer.periodic(const Duration(seconds: 10), (_) {
      // loadMessage();
    });
  }

  Future<void> sendMessage() async {
    var message = messageController.text.trim();
    if (message.isEmpty) return;
    isLoading(true);

    try {
      await chatRepo.sendMessage(MessageRequest(
          receiver: int.parse(Get.find<AppController>().ownerDetail?.id ?? '0'),
          message: message));
      formattedMessage.insert(0, FormattedMessage(message, true));
      update();
      messageController.clear();
    } catch (e) {
      if (e is DioError) {
        showSnackbar(ServerError.withError(error: e).getErrorMessage(),
            isError: true);
      } else {
        showSnackbar(e.toString(), isError: true);
      }
    }

    isLoading(false);
  }

  Future<void> loadMessage() async {
    if (!isLoaded) isMessageLoading(true);
    isError(false);

    try {
      messages = await chatRepo
          .getMessages(Get.find<AppController>().ownerDetail?.id ?? '');
      formattedMessage.clear();
      for (var message in messages) {
        formattedMessage.add(FormattedMessage(message.message ?? '',
            Get.find<AppController>().profile?.id == message.sender));
      }
      formattedMessage = formattedMessage.reversed.toList();
      isLoaded = true;
      if (isLoaded) update();
    } catch (e) {
      isError(true);
      if (e is DioError) {
        errorMessage = ServerError.withError(error: e).getErrorMessage();
      } else {
        errorMessage = e.toString();
      }
    }

    isMessageLoading(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    messageController.dispose();
    timer.cancel();
  }
}
