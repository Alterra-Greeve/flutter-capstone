import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  final String termsAndConditions = """
Selamat datang di Greeve!

Harap perhatikan bahwa dengan menggunakan aplikasi Greeve, Anda setuju untuk terikat dengan syarat dan ketentuan di bawah ini. Jika Anda tidak setuju dengan syarat dan ketentuan ini, kami sarankan untuk tidak menggunakan aplikasi ini.

Pendaftaran Akun:
Anda bertanggung jawab atas keamanan akun Anda dan informasi yang terkait dengannya.
Anda harus memberikan informasi yang akurat dan lengkap selama proses pendaftaran.
Kami berhak untuk menangguhkan atau menonaktifkan akun yang dianggap melanggar syarat dan ketentuan kami.

Penggunaan Aplikasi:
Anda setuju untuk menggunakan aplikasi Greeve hanya untuk tujuan yang sah dan sesuai dengan hukum yang berlaku.
Anda tidak diperbolehkan menggunakan aplikasi untuk tujuan yang melanggar hak privasi, hak kekayaan intelektual, atau hak lainnya.

Penjualan dan Belanja:
Kami tidak bertanggung jawab atas transaksi antara pengguna yang terjadi melalui aplikasi Greeve. Semua transaksi dilakukan atas risiko sendiri.
Kami berhak untuk meninjau, menolak, atau menghapus konten yang dianggap melanggar kebijakan kami terkait dengan penjualan dan belanja.

Challenge:
Anda setuju untuk berpartisipasi dalam tantangan yang ditawarkan oleh aplikasi Greeve dengan mematuhi aturan dan ketentuan yang telah ditetapkan.
Kami tidak bertanggung jawab atas cedera atau kerusakan yang mungkin terjadi selama atau sebagai hasil dari berpartisipasi dalam tantangan.

Pembatalan dan Pengembalian:
Kebijakan pembatalan dan pengembalian untuk pembelian produk atau layanan akan diatur oleh pedagang terkait dan dapat bervariasi.

Perubahan Syarat dan Ketentuan:
Kami berhak untuk memperbarui, mengubah, atau mengubah syarat dan ketentuan ini dari waktu ke waktu tanpa pemberitahuan sebelumnya.
Anda diharapkan untuk memeriksa halaman syarat dan ketentuan secara berkala untuk mengetahui perubahan atau pembaruan.

Dengan menggunakan aplikasi Greeve, Anda setuju untuk terikat dengan semua syarat dan ketentuan yang tercantum di atas. Jika Anda memiliki pertanyaan atau kekhawatiran, jangan ragu untuk menghubungi tim dukungan kami.

Terima kasih telah menggunakan Greeve!
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 64,
        title: Text(
          'Syarat dan Ketentuan',
          style: TextStylesConstant.nunitoButtonSemibold,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(IconsConstant.arrow),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Text(
                termsAndConditions,
                style: TextStylesConstant.nunitoSubtitle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
