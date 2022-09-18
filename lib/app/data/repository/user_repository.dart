import 'package:dio/dio.dart';
import 'package:tenant_app/app/data/models/user/profile.dart';

import '../api/user/user_api.dart';

class UserRepository {
  final Dio _dio;

  UserRepository(this._dio);

  Future<Profile?> getUerProfile() async {
    return (await UserApi(_dio).getProfile()).data;
  }
}
