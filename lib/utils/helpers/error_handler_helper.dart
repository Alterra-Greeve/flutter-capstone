import 'package:dio/dio.dart';

class ErrorHandlerHelper {
  static String tryRegister(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Kolom masih ada yang kosong! Silahkan isi semua kolom.';
      case 409:
        return 'Email sudah terdaftar! Silahkan gunakan email lain.';
      default:
        return 'Unexpected Error - An unexpected error occurred (Status Code: $statusCode).';
    }
  }

  static String catchError(error) => (error is DioException)
      ? tryRegister(error.response?.statusCode)
      : 'Maaf, terjadi masalah saat terhubung ke server. Mohon periksa koneksi internet Anda dan coba lagi.';
}
