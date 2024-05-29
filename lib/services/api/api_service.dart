import 'package:dio/dio.dart';
import 'package:greeve/helpers/error_handler_helper.dart';
import 'package:greeve/models/api_responses/generic_response_model.dart';
import 'package:greeve/models/api_responses/login_response_model.dart';
import 'package:greeve/utils/constants/api_constant.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<LoginResponseModel> login(String email, String password) async {
    try {
      Map<String, dynamic> data = {'email': email, 'password': password};

      final response = await _dio.post(ApiConstant.login, data: data);
      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw Exception('Login gagal');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: ${e.toString()}');
    }
  }

  Future<GenericResponseModel> register(
      String name, String email, String password) async {
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
        throw ErrorHandlerHelper.tryRegister(response.statusCode);
      }
    } on DioException catch (e) {
      throw ErrorHandlerHelper.catchError(e.response?.statusCode);
    }
  }
}
