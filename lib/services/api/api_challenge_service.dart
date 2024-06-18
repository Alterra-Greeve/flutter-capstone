import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:greeve/models/api_responses/challenge_response_model.dart';
import 'package:greeve/models/api_responses/challenges_response_model.dart';
import 'package:greeve/models/api_responses/generic_response_model.dart';
import 'package:greeve/models/api_responses/get_user_challenge_response_model.dart';
import 'package:greeve/utils/constants/api_constant.dart';
import 'package:greeve/utils/helpers/challenge_error_helper.dart';

class ApiChallengeService {
  final Dio _dio = Dio();

  Future<GetUserChallengeResponseModel> getUserChallenge(
      String token, String status) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final String urlChallenge = '${ApiConstant.userChallenge}=$status';
      final response = await _dio.get(
        urlChallenge,
        options: options,
      );
      if (response.statusCode == 200) {
        return GetUserChallengeResponseModel.fromJson(response.data);
      } else {
        throw ChallengeErrorHelper.tryGetUserChallenge(response.statusCode);
      }
    } on DioException catch (e) {
      throw ChallengeErrorHelper.catchGetUserChallenge(e);
    }
  }

  Future<ChallengesResponseModel> getChallenges(String? token) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.get(
        ApiConstant.challenges,
        options: options,
      );
      if (response.statusCode == 200) {
        return ChallengesResponseModel.fromJson(response.data);
      } else {
        throw ChallengeErrorHelper.tryGetChallenges(response.statusCode);
      }
    } on DioException catch (e) {
      throw ChallengeErrorHelper.catchGetChallenges(e);
    }
  }

  Future<GenericResponseModel> postChallengesParticipate(
      String? token, String? type, String? challengeId) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      Map<String, dynamic> data = {'challenge_id': challengeId, 'type': type};

      final response = await _dio.post(
        ApiConstant.challengesParticipate,
        data: data,
        options: options,
      );
      if (response.statusCode == 200) {
        return GenericResponseModel.fromJson(response.data);
      } else {
        throw ChallengeErrorHelper.tryPostChallengeParticipate(
            response.statusCode);
      }
    } on DioException catch (e) {
      throw ChallengeErrorHelper.catchPostChallengeParticipate(e);
    }
  }

  Future<ChallengeResponseModel> getChallenge(
      String? token, String? challengeId) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      final response = await _dio.get(
        '${ApiConstant.challengesParticipate}/$challengeId',
        options: options,
      );
      if (kDebugMode) {
        print(response);
      }
      if (response.statusCode == 200) {
        return ChallengeResponseModel.fromJson(response.data);
      } else {
        throw ChallengeErrorHelper.tryGetChallenge(response.statusCode);
      }
    } on DioException catch (e) {
      throw ChallengeErrorHelper.catchGetChallenge(e);
    }
  }
}
