import 'package:dio/dio.dart';
import 'package:tenant_app/app/data/models/user/owner_detail.dart';
import 'package:tenant_app/app/data/models/user/profile.dart';
import 'package:tenant_app/app/data/models/user/qr_response.dart';

import '../api/user/user_api.dart';

class UserRepository {
  final Dio _dio;

  UserRepository(this._dio);

  Future<Profile?> getUserProfile() async {
    return (await UserApi(_dio).getProfile()).data;
  }

  Future<OwnerDetail?> getOwnerDetail() async {
    return (await UserApi(_dio).getOwnerDetails()).details;
  }

  Future<QrResponse> getQrResponse(String id) async {
    return await UserApi(_dio).getQrResponse(id);
  }
}
