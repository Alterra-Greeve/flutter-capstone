import 'package:dio/dio.dart';

class AuthErrorHelper {
  static String tryPostLogin(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Email atau kata sandi masih kosong! Silahkan isi sebelum melanjutkan.';
      case 401:
        return 'Kata sandi yang Anda masukkan salah. Silakan periksa kembali informasi login Anda dan coba lagi.';
      case 404:
        return 'Email yang Anda masukkan tidak terdaftar. Silakan periksa kembali informasi login Anda dan coba lagi.';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchPostLogin(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryPostLogin(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }

  static String tryPostRegister(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Nama, email, atau kata sandi masih kosong! Silahkan isi sebelum melanjutkan.';
      case 409:
        return 'Email sudah terdaftar! Silahkan gunakan email lain.';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchPostRegister(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryPostRegister(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }

  static String tryPostForgotPassword(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Email masih kosong! Silahkan isi sebelum melanjutkan.';
      case 404:
        return 'Email tidak terdaftar';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchPostForgotPassword(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryPostForgotPassword(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }

  static String tryPostOtp(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Kode OTP yang Anda masukkan salah. Silakan periksa kembali kode OTP Anda dan coba lagi.';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchPostOtp(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryPostOtp(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }

  static String tryPostResetPassword(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Kata sandi dan konfirmasi kata sandi harus sama!';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchPostResetPassword(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryPostResetPassword(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }
}