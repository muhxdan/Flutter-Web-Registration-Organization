import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'My App';

  // Home Section 1
  static const String homeText1 = 'Apakah Kamu Sedang Mencari Organisasi?';
  static const String homeText2 =
      'Temukan peluang untuk terhubung, belajar, dan berkontribusi di kampus melalui organisasi mahasiswa.';
  static const String homeText3 = 'DAFTAR SEKARANG';

  // Home Section 2
  static const String homeText4 =
      'Jelajahi Peluang Di Berbagai Organisasi Mahasiswa';
  static const String homeText5 =
      'Universitas Teknologi Digital Indonesia memiliki beragam organisasi mahasiswa yang menawarkan berbagai kegiatan, proyek, dan event. Bergabunglah bersama kami dan temukan peluang untuk terlibat dalam berbagai aktivitas yang memperkaya pengalaman kuliahmu."';

  // Home Section 3

  static SizedBox width({double? width}) {
    return SizedBox(
      width: width,
    );
  }

  static SizedBox height(double value) {
    return SizedBox(height: value);
  }
}
