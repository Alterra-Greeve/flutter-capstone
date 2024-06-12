import 'package:dio/dio.dart';
import 'package:greeve/models/api_responses/cart_response_model.dart';
import 'package:greeve/models/api_responses/generic_response_model.dart';
import 'package:greeve/utils/constants/api_constant.dart';
import 'package:greeve/utils/helpers/cart_error_helper.dart';

class ApiCartService {
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
      String? productId, String type, int qty, String token) async {
    try {
      Map<String, dynamic> data = {
        'product_id': productId,
        'type': type,
        'qty': qty,
      };
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response =
          await _dio.put(ApiConstant.cart, data: data, options: options);
      if (response.statusCode == 200) {
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
      print(response);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return CartResponseModel.fromJson(response.data);
      } else {
        throw CartErrorHelper.tryGetCart(response.statusCode);
      }
    } on DioException catch (e) {
      throw CartErrorHelper.catchGetCart(e);
    }
  }

  Future<CartResponseModel> deleteCart(String productId, String token) async {
    try {
      Map<String, dynamic> data = {
        'product_id': productId,
      };
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
    
      final response = await _dio.delete(ApiConstant.cart, data: data, options: options);
      if (response.statusCode == 201) {
        return CartResponseModel.fromJson(response.data);
      } else {
        throw CartErrorHelper.tryDeleteCart(response.statusCode);
      }
    } on DioException catch (e) {
      throw CartErrorHelper.catchDeleteCart(e);
    }
  }
}
