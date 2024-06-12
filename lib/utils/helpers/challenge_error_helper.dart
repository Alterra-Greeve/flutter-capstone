import 'package:dio/dio.dart';

class ChallengeErrorHelper {
  static String tryGetUserChallenge(int? statusCode) {
    switch (statusCode) {
      case 401:
        return 'Anda belum melakukan login. Silakan login terlebih dahulu.';
      case 404:
        return 'Data challenge tidak ditemukan. Silahkan ikuti challenge terlebih dahulu.';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchGetUserChallenge(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryGetUserChallenge(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }

  static String tryGetChallenges(int? statusCode) {
    switch (statusCode) {
      case 404:
        return 'Tantangan tidak ditemukan';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchGetChallenges(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryGetChallenges(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }

  static String tryPostChallengeParticipate(int? statusCode) {
    switch (statusCode) {
      case 401:
        return 'Unauthorized';
      case 404:
        return 'Tidak bisa mendapatkan data, user id tidak ditemukan.';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchPostChallengeParticipate(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryPostChallengeParticipate(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }
}