import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:greeve/models/api_responses/leaderboard_response_model.dart';
import 'package:greeve/utils/constants/api_constant.dart';
import 'package:greeve/utils/helpers/error_handler_helper.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ApiLeaderboardService {
  final Dio _dio = Dio();

  Future<LeaderboardResponseModel> getLeaderboard(String? token) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response =
          await _dio.get(ApiConstant.leaderBoard, options: options);
      if (response.statusCode == 200) {
        return LeaderboardResponseModel.fromJson(response.data);
      } else {
        throw ErrorHandlerHelper.tryGetLeaderBoard(response.statusCode);
      }
    } on DioException catch (e) {
      throw ErrorHandlerHelper.catchGetLeaderBoard(e);
    }
  }

  Future<String?> getCurrentUserId(String token) async {
    try {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      return decodedToken['userId']; // Adjust based on your token structure
    } catch (e) {
      print("Error decoding token: $e");
      return null;
    }
  }
}
