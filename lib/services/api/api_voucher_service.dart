import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:greeve/models/api_responses/voucher_response_model.dart';
import 'package:greeve/utils/constants/api_constant.dart';
import 'package:greeve/utils/helpers/voucher_error_helper.dart';

class ApiVoucherService {
  final Dio _dio = Dio();

  Future<VoucherResponseModel> getVoucher(String? token) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.get(ApiConstant.voucher, options: options);

      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 200) {
        return VoucherResponseModel.fromJson(response.data);
      } else {
        throw VoucherErrorHelper.tryGetVoucher(response.statusCode);
      }
    } on DioException catch (e) {
      throw VoucherErrorHelper.catchGetVoucher(e);
    }
  }

  Future<CoinResponseModel> getCoin(String? token) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.get(ApiConstant.coin, options: options);

      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 200) {
        return CoinResponseModel.fromJson(response.data);
      } else {
        throw CoinErrorHelper.tryGetCoin(response.statusCode);
      }
    } on DioException catch (e) {
      throw CoinErrorHelper.catchGetCoin(e);
    }
  }

   Future<CoinResponseSpendingModel> getCoinSpending(String? token) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.get(ApiConstant.coinSpending, options: options);

      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 200) {
        return CoinResponseSpendingModel.fromJson(response.data);
      } else {
        throw CoinErrorHelper.tryGetCoin(response.statusCode);
      }
    } on DioException catch (e) {
      throw CoinErrorHelper.catchGetCoin(e);
    }
  }
}
