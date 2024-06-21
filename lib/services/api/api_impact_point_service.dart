import 'package:dio/dio.dart';
import 'package:greeve/models/api_responses/impact_poin_response_model.dart';
import 'package:greeve/utils/constants/api_constant.dart';

class ApiMonthlyImpactService {
  final Dio _dio = Dio();

  Future<List<MonthlyImpact>> getMonthlyImpact(String token) async {
    try {
      Options options = Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      final response = await _dio.get(
        ApiConstant.impactPoint,
        options: options,
      );

      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data['data']['monthly_impact'];
        List<MonthlyImpact> monthlyImpacts = [];
        for (var item in responseData) {
          monthlyImpacts.add(MonthlyImpact.fromJson(item));
        }
        return monthlyImpacts;
      } else {
        throw Exception("Failed to load monthly impact data");
      }
    } on DioException catch (e) {
      throw Exception("Failed to load monthly impact data: $e");
    }
  }
}
