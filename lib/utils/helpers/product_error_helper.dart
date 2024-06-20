import 'package:dio/dio.dart';

class ProductErrorHelper {
  static String tryGetProducts(int? statusCode) {
    switch (statusCode) {
      case 404:
        return 'Produk tidak ditemukan';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchGetProducts(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryGetProducts(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }
}