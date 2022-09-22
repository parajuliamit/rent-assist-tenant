import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/transaction/payment_request.dart';
import '../../models/transaction/transaction_list.dart';

part 'transaction_api.g.dart';

@RestApi()
abstract class TransactionApi {
  factory TransactionApi(Dio dio) = _TransactionApi;

  @POST("/api/payment/")
  Future<void> makeTransaction(@Body() PaymentRequest request);

  @GET("/api/payment/my-transactions")
  Future<TransactionList> getTransactions();
}
