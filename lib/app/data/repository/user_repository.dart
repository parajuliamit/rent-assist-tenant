import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tenant_app/app/data/models/user/create_agreement_request.dart';
import 'package:tenant_app/app/data/models/user/document_response.dart';
import 'package:tenant_app/app/data/models/user/owner_detail.dart';
import 'package:tenant_app/app/data/models/user/profile.dart';
import 'package:tenant_app/app/data/models/user/qr_response.dart';

import '../api/user/user_api.dart';
import '../models/user/add_tenant_response.dart';

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

  Future<AddTenantResponse> addTenant(String ownerId) async {
    return await UserApi(_dio).addTenant({"owner": ownerId});
  }

  Future<void> createAgreement(CreateAgreementRequest request) async {
    return await UserApi(_dio).createAgreement(request);
  }

  Future<void> uploadDocument(File image, int user) async {
    String? fileName = image.path.split('/').last;
    FormData formData = FormData.fromMap({
      "citizenship":
          await MultipartFile.fromFile(image.path, filename: fileName),
      "user": user
    });
    await _dio.post('/api/contract/documents/', data: formData);
  }

  Future<DocumentResponse> getDocument(int user) async {
    return (await UserApi(_dio).getDocuments()).firstWhere(
        (element) => element.user == user,
        orElse: () => DocumentResponse());
  }
}
