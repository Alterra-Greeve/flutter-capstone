import 'package:dio/dio.dart';
import 'package:greeve/models/api_responses/get_user_profile_response_model.dart';
import 'package:greeve/models/api_responses/update_user_response_model.dart';
import 'package:greeve/utils/helpers/user_error_helper.dart';
import 'package:greeve/utils/constants/api_constant.dart';

class ApiUserService {
  final Dio _dio = Dio();

  Future<GetUserProfileResponseModel> getUserProfile(String? token) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response =
          await _dio.get(ApiConstant.userProfile, options: options);
      if (response.statusCode == 200) {
        return GetUserProfileResponseModel.fromJson(response.data);
      } else {
        throw UserErrorHelper.tryGetUserProfile(response.statusCode);
      }
    } on DioException catch (e) {
      throw UserErrorHelper.catchGetUserProfile(e);
    }
  }

  Future<UpdateUserResponseModel> updateUserProfile(
    String? token,
    String? email, {
    String? username = "",
    String? password = "",
    String? name = "",
    String? address = "",
    String? gender = "",
    String? phone = "",
    String? avatarUrl = "",
  }) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      Map<String, dynamic> data = {
        'email': email,
        'username': username,
        'password': password,
        'name': name,
        'address': address,
        'gender': gender,
        'phone': phone,
        'avatar_url': avatarUrl
      };
      final response =
          await _dio.put(ApiConstant.userProfile, data: data, options: options);
      if (response.statusCode == 200) {
        return UpdateUserResponseModel.fromJson(response.data);
      } else {
        throw UserErrorHelper.tryUpdateUser(response.statusCode);
      }
    } on DioException catch (e) {
      throw UserErrorHelper.catchUpdateUser(e);
    }
  }

  Future<GetUserProfileResponseModel> deleteUserProfile(String? token) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response =
          await _dio.delete(ApiConstant.userProfile, options: options);
      if (response.statusCode == 200) {
        return GetUserProfileResponseModel.fromJson(response.data);
      } else {
        throw UserErrorHelper.tryDeleteUserProfile(response.statusCode);
      }
    } on DioException catch (e) {
      throw UserErrorHelper.catchDeleteUserProfile(e);
    }
  }
}
