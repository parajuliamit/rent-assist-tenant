import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/chat/message_request.dart';
import '../../models/chat/message_response.dart';

part 'chat_api.g.dart';

@RestApi()
abstract class ChatApi {
  factory ChatApi(Dio dio) = _ChatApi;

  @GET("/chat/inbox?friend={id}")
  Future<MessageResponse> getMessage(@Path("id") String id);

  @POST("/chat/send-message/")
  Future<void> sendMessage(@Body() MessageRequest message);
}
