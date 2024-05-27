import 'package:dio/dio.dart';
import 'package:greeve/models/api_responses/login_response.dart';
import 'package:greeve/utils/constants/api_constant.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<LoginResponse> login(String email, String password) async {
    try {
      Map<String, dynamic> data = {'email': email, 'password': password};

      final response = await _dio.post(ApiConstant.login, data: data);
      if (response.statusCode == 200) {
        print(response);
        return LoginResponse.fromJson(response.data);
      } else {
        throw Exception('Login gagal');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: ${e.toString()}');
    }
  }
}
