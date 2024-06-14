import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:greeve/models/api_responses/product_response_model.dart';
import 'package:greeve/models/api_responses/products_response_model.dart';
import 'package:greeve/utils/helpers/product_error_helper.dart';
import 'package:greeve/utils/constants/api_constant.dart';

class ApiProductService {
  final Dio _dio = Dio();

  Future<ProductResponseModel> getProduct(
      String productId, String? token) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.get('${ApiConstant.products}/$productId',
          options: options);
      if (response.statusCode == 200) {
        return ProductResponseModel.fromJson(response.data);
      } else {
        throw ProductErrorHelper.tryGetProducts(response.statusCode);
      }
    } on DioException catch (e) {
      throw ProductErrorHelper.catchGetProducts(e);
    }
  }

  Future<ProductsResponseModel> getProducts(String? token) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.get(ApiConstant.products, options: options);
      if (response.statusCode == 200) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        throw ProductErrorHelper.tryGetProducts(response.statusCode);
      }
    } on DioException catch (e) {
      throw ProductErrorHelper.catchGetProducts(e);
    }
  }

  Future<ProductsResponseModel> getProductsbyCategory(
      String? token, String category) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio
          .get('${ApiConstant.productsCategory}/$category', options: options);
      if (response.statusCode == 200) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        throw ProductErrorHelper.tryGetProducts(response.statusCode);
      }
    } on DioException catch (e) {
      throw ProductErrorHelper.catchGetProducts(e);
    }
  }

  Future<ProductsResponseModel> getProductsbyCategoryWithPage(
      String? token, String category, String pageKey) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.get(
          '${ApiConstant.productsCategory}/$category?page=$pageKey',
          options: options);
      if (response.statusCode == 200) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        throw ProductErrorHelper.tryGetProducts(response.statusCode);
      }
    } on DioException catch (e) {
      throw ProductErrorHelper.catchGetProducts(e);
    }
  }

  Future<ProductsResponseModel> getProductsbyName(
      String? token, String name) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio
          .get('${ApiConstant.productsSearch}?name=$name', options: options);
      if (kDebugMode) {
        print(response);
      }
      if (response.statusCode == 200) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        throw ProductErrorHelper.tryGetProducts(response.statusCode);
      }
    } on DioException catch (e) {
      throw ProductErrorHelper.catchGetProducts(e);
    }
  }
}
