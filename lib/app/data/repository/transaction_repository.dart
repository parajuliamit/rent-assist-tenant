import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tenant_app/app/data/api/transaction/transaction_api.dart';
import 'package:tenant_app/app/data/models/transaction/transaction_list.dart';

import '../models/transaction/payment_request.dart';

class TransactionRepository {
  final Dio _dio;

  TransactionRepository(this._dio);

  Future<List<Transaction>> getTransactions() async {
    return (await TransactionApi(_dio).getTransactions()).transaction;
  }

  Future<void> makeTransaction(PaymentRequest request) async {
    return await TransactionApi(_dio).makeTransaction(request);
  }
}
