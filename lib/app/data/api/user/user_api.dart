import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tenant_app/app/data/models/user/owner_detail.dart';

import '../../models/notifications/notification_response.dart';
import '../../models/user/profile.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  @GET("/api/users/my-details/")
  Future<ProfileResponse> getProfile();

  @GET("/api/users/my-owner/")
  Future<OwnerDetailResponse> getOwnerDetails();

  @GET("/api/notifications/")
  Future<NotificationResponse> getNotifications();
}
