import 'package:dio/dio.dart';

class VoucherErrorHelper {
  static String tryGetVoucher(int? statusCode) {
    switch (statusCode) {
      case 404:
        return 'Voucher tidak ditemukan';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchGetVoucher(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryGetVoucher(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }
}

class CoinErrorHelper {
  static String tryGetCoin(int? statusCode) {
    switch (statusCode) {
      case 404:
        return 'History Coin tidak ditemukan';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchGetCoin(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryGetCoin(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }
}