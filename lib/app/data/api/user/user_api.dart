import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tenant_app/app/data/models/user/add_tenant_response.dart';
import 'package:tenant_app/app/data/models/user/create_agreement_request.dart';
import 'package:tenant_app/app/data/models/user/document_response.dart';
import 'package:tenant_app/app/data/models/user/get_agreement_response.dart';
import 'package:tenant_app/app/data/models/user/owner_detail.dart';
import 'package:tenant_app/app/data/models/user/qr_response.dart';

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

  @GET("/api/notifications/notification/")
  Future<NotificationResponse> getNotifications();

  @GET("/api/rooms/{id}/")
  Future<QrResponse> getQrResponse(@Path("id") String id);

  @POST("/api/users/add-tenant/")
  Future<AddTenantResponse> addTenant(@Body() Map<String, dynamic> body);

  @POST("/api/contract/agreement/")
  Future<void> createAgreement(@Body() CreateAgreementRequest request);

  @GET("/api/contract/documents/")
  Future<List<DocumentResponse>> getDocuments();

  @GET("/api/contract/agreement/")
  Future<GetAgreementResponse> getAgreement();
}
