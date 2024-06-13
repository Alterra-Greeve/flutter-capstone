import 'package:dio/dio.dart';

class CartErrorHelper {
  static String tryPostCart(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Produk tidak boleh kosong';
      case 401:
        return 'Unauthorized';
      case 404:
        return 'Produk tidak ditemukan';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchPostCart(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryPostCart(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }

  static String tryPutCart(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Produk tidak boleh kosong';
      case 401:
        return 'Unauthorized';
      case 404:
        return 'Keranjang tidak ditemukan';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchPutCart(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryPutCart(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }

  static String tryGetCart(int? statusCode) {
    switch (statusCode) {
      case 404:
        return 'Produk tidak ditemukan';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchGetCart(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryGetCart(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }

  static String tryDeleteCart(int? statusCode) {
    switch (statusCode) {
      case 401:
        return 'Berhasil menghapus produk di keranjang';
      case 404:
        return 'Gagal menghapus produk, produk tidak ditemukan';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchDeleteCart(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryDeleteCart(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }
}
