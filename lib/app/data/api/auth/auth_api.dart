import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tenant_app/app/data/models/auth/register_device_request.dart';

import '../../models/auth/login_request.dart';
import '../../models/auth/register_request.dart';
import '../../models/auth/login_response.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST("/auth/login/")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST("/auth/register/")
  Future<LoginResponse> register(@Body() RegisterRequest registerRequest);

  @POST("/api/notifications/devices/")
  Future<void> registerDevice(@Body() RegisterDeviceRequest registerDeviceRequest);

  // @POST("users/verify/")
  // Future<void> verify(@Body() VerifyOtp verifyOtp);

  // @GET("users/verify/resend/{id}/")
  // Future<void> resendOtp(@Path("id") String id);
}
