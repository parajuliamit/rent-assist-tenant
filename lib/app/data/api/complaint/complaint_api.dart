import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/complaints/complaints_response.dart';

part 'complaint_api.g.dart';

@RestApi()
abstract class ComplaintApi {
  factory ComplaintApi(Dio dio) = _ComplaintApi;

  @GET("/api/complaints/")
  Future<ComplaintsResponse> getComplaints();
}
