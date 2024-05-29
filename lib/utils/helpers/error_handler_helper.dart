import 'package:dio/dio.dart';

class ErrorHandlerHelper {
  static String tryRegister(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Kolom masih ada yang kosong! Silahkan isi semua kolom.';
      case 409:
        return 'Email sudah terdaftar! Silahkan gunakan email lain.';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchRegister(
    DioException e,
  ) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryRegister(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }
}
