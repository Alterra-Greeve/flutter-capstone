import 'package:dio/dio.dart';
import 'package:greeve/models/api_responses/impact_response_model.dart';
import 'package:greeve/utils/constants/api_constant.dart';

class ApiDetailImpactService {
  final Dio _dio = Dio();

  Future<List<Datum>> getImpactData(String token) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.get(ApiConstant.impact, options: options);
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data['data'];

        List<Datum> impactList = [];
        for (var innerList in responseData) {
          for (var item in innerList) {
            impactList.add(Datum.fromJson(item));
          }
        }
        return impactList;
      } else {
        throw Exception("Failed to load impact data");
      }
    } on DioError catch (e) {
      throw Exception("Failed to load impact data: $e");
    }
  }

  Future<Datum> getImpactDetail(int impactId) async {
    try {
      final response = await _dio.get('${ApiConstant.impact}/$impactId');
      if (response.statusCode == 200) {
        return Datum.fromJson(response.data);
      } else {
        throw Exception("Failed to load impact detail");
      }
    } on DioError catch (e) {
      throw Exception("Failed to load impact detail: $e");
    }
  }
}
