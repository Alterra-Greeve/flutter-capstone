import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:greeve/models/api_responses/cart_response_model.dart';
import 'package:greeve/models/api_responses/generic_response_model.dart';
import 'package:greeve/models/api_responses/get_transaction_response_model.dart';
import 'package:greeve/models/api_responses/post_transaction_response_model.dart';
import 'package:greeve/utils/constants/api_constant.dart';
import 'package:greeve/utils/helpers/cart_error_helper.dart';

class ApiTransactionService {
  final Dio _dio = Dio();

  Future<GenericResponseModel> postCart(
      String? productId, String? token) async {
    try {
      Map<String, dynamic> data = {
        'product_id': productId,
      };
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response =
          await _dio.post(ApiConstant.cart, data: data, options: options);
      if (response.statusCode == 201) {
        return GenericResponseModel.fromJson(response.data);
      } else {
        throw CartErrorHelper.tryPostCart(response.statusCode);
      }
    } on DioException catch (e) {
      throw CartErrorHelper.catchPostCart(e);
    }
  }

  Future<GenericResponseModel> updateCart(
      String? productId, int qty, String? token,
      {String? type}) async {
    try {
      Map<String, dynamic> data = {
        'product_id': productId,
        'type': type,
        'qty': qty,
      };
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response =
          await _dio.put(ApiConstant.cart, data: data, options: options);
      if (response.statusCode == 201) {
        return GenericResponseModel.fromJson(response.data);
      } else {
        throw CartErrorHelper.tryPostCart(response.statusCode);
      }
    } on DioException catch (e) {
      throw CartErrorHelper.catchPostCart(e);
    }
  }

  Future<CartResponseModel> getCart(String? token) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.get(ApiConstant.cart, options: options);
      if (response.statusCode == 200) {
        return CartResponseModel.fromJson(response.data);
      } else {
        throw CartErrorHelper.tryGetCart(response.statusCode);
      }
    } on DioException catch (e) {
      throw CartErrorHelper.catchGetCart(e);
    }
  }

  Future<void> deleteCart(String productId, String? token) async {
    Options options = Options(headers: {'Authorization': 'Bearer $token'});
    await _dio.delete('${ApiConstant.cart}/$productId', options: options);
  }

  Future<PostTransactionResponseModel> postTransaction(String? token,
      {String? voucherCode = "", bool? useCoin = false}) async {
    try {
      Map<String, dynamic> data = {
        'voucher_code': voucherCode,
        'using_coin': useCoin
      };
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.post(ApiConstant.transactions,
          data: data, options: options);
      if (kDebugMode) {
        print(response);
      }
      if (response.statusCode == 200) {
        return PostTransactionResponseModel.fromJson(response.data);
      } else {
        throw CartErrorHelper.tryPostCart(response.statusCode);
      }
    } on DioException catch (e) {
      throw CartErrorHelper.catchPostCart(e);
    }
  }

  Future<GetTransactionResponseModel> getTransaction(String? token) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response =
          await _dio.get(ApiConstant.transactions, options: options);
      print(response);
      if (response.statusCode == 200) {
        return GetTransactionResponseModel.fromJson(response.data);
      } else {
        throw CartErrorHelper.tryGetTransaction(response.statusCode);
      }
    } on DioException catch (e) {
      throw CartErrorHelper.catchPostTransaction(e);
    }
  }
}
