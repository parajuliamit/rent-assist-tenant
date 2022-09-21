import 'package:dio/dio.dart';

import '../api/chat/chat_api.dart';
import '../models/chat/message_request.dart';
import '../models/chat/message_response.dart';

class ChatRepository {
  final Dio _dio;

  ChatRepository(this._dio);

  Future<void> sendMessage(MessageRequest message) async {
    return await ChatApi(_dio).sendMessage(message);
  }

  Future<List<Message>> getMessages(String id) async {
    return (await ChatApi(_dio).getMessage(id)).data;
  }
}
