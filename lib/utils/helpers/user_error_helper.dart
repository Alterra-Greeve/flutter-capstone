import 'package:dio/dio.dart';

class UserErrorHelper {
  static String tryGetUserProfile(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Unauthorized! Silahkan login kembali.';
      case 404:
        return 'User tidak ditemukan! Silahkan coba lagi.';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchGetUserProfile(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryGetUserProfile(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }

  static String tryUpdateUser(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Satu atau lebih kolom tidak boleh kosong';
      case 401:
        return 'Unauthorized';
      case 404:
        return 'Pengguna tidak ditemukan';
      case 409:
        return 'Email sudah terdaftar';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchUpdateUser(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryUpdateUser(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }

  static String tryDeleteUserProfile(int? statusCode) {
    switch (statusCode) {
      case 401:
        return 'Unauthorized';
      case 404:
        return 'Pengguna tidak ditemukan';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchDeleteUserProfile(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryDeleteUserProfile(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }

  static String tryGetLeaderBoard(int? statusCode) {
    switch (statusCode) {
      case 404:
        return 'Produk tidak ditemukan';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchGetLeaderBoard(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryGetLeaderBoard(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }
}
