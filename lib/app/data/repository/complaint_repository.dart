import 'dart:io';

import 'package:dio/dio.dart';

import '../api/complaint/complaint_api.dart';
import '../models/complaints/complaints_response.dart';

class ComplaintRepository {
  final Dio _dio;

  ComplaintRepository(this._dio);

  Future<List<Complaint>> getComplaints() async {
    return (await ComplaintApi(_dio).getComplaints()).complaints;
  }

  Future<void> addComplaint(Complaint complaint, File? image) async {
    if (image == null) {
      FormData formData = FormData.fromMap({
        "tenant": complaint.tenant,
        "title": complaint.title,
        "description": complaint.description,
        "urgency_level": complaint.urgencyLevel,
      });
      await _dio.post('/api/complaints/', data: formData);
      return;
    }
    String fileName = image.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image.path, filename: fileName),
      "tenant": complaint.tenant,
      "title": complaint.title,
      "description": complaint.description,
      "urgency_level": complaint.urgencyLevel,
    });
    await _dio.post('/api/complaints/', data: formData);
  }
}
