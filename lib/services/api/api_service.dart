import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:greeve/utils/helpers/error_handler_helper.dart';
import 'package:greeve/models/api_responses/generic_response_model.dart';
import 'package:greeve/models/api_responses/login_response_model.dart';
import 'package:greeve/utils/constants/api_constant.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<LoginResponseModel> postLogin(String email, String password) async {
    try {
      Map<String, dynamic> data = {'email': email, 'password': password};

      final response = await _dio.post(ApiConstant.login, data: data);
      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw ErrorHandlerHelper.tryPostLogin(response.statusCode);
      }
    } on DioException catch (e) {
      throw ErrorHandlerHelper.catchPostLogin(e);
    }
  }

  Future<GenericResponseModel> postRegister(
      String name, String email, String password) async {
    if (kDebugMode) {
      print('name: $name');
      print('email: $email');
      print('password: $password');
    }

    try {
      Map<String, dynamic> data = {
        'name': name,
        'email': email,
        'password': password
      };

      final response = await _dio.post(ApiConstant.register, data: data);
      if (response.statusCode == 201) {
        return GenericResponseModel.fromJson(response.data);
      } else {
        throw ErrorHandlerHelper.tryPostRegister(response.statusCode);
      }
    } on DioException catch (e) {
      throw ErrorHandlerHelper.catchPostRegister(e);
    }
  }

  Future<GenericResponseModel> postForgotPassword(
      String? email, String? token) async {
    try {
      Map<String, dynamic> data = {'email': email};
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.post(ApiConstant.forgotPassword,
          data: data, options: options);
      if (response.statusCode == 201) {
        return GenericResponseModel.fromJson(response.data);
      } else {
        throw ErrorHandlerHelper.tryPostForgotPassword(response.statusCode);
      }
    } on DioException catch (e) {
      throw ErrorHandlerHelper.catchPostForgotPassword(e);
    }
  }

  Future<GenericResponseModel> postOtp(
      String? email, String otp, String? token) async {
    try {
      Map<String, dynamic> data = {'email': email, 'otp': otp};
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response =
          await _dio.post(ApiConstant.verifyOtp, data: data, options: options);

      if (response.statusCode == 200) {
        return GenericResponseModel.fromJson(response.data);
      } else {
        throw ErrorHandlerHelper.tryPostOtp(response.statusCode);
      }
    } on DioException catch (e) {
      throw ErrorHandlerHelper.catchPostOtp(e);
    }
  }

  Future<GenericResponseModel> postResetPassword(String? email, String? otp,
      String password, String confirmationPassword, String? token) async {
    try {
      Map<String, dynamic> data = {
        'email': email,
        'otp': otp,
        'password': password,
        'confirmation_password': confirmationPassword,
      };
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.post(ApiConstant.resetPassword,
          data: data, options: options);
      if (response.statusCode == 200) {
        return GenericResponseModel.fromJson(response.data);
      } else {
        throw ErrorHandlerHelper.tryPostResetPassword(response.statusCode);
      }
    } on DioException catch (e) {
      throw ErrorHandlerHelper.catchPostResetPassword(e);
    }
  }
}
