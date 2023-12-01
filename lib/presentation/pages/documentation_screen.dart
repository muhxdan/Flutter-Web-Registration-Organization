import 'package:flutter/material.dart';
import 'package:pendaftaran_organisasi_mahasiswa/presentation/pages/home_screen.dart';
import 'package:pendaftaran_organisasi_mahasiswa/utils/appConstants.dart';

class DocumentationScreen extends StatelessWidget {
  const DocumentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 1152,
          ),
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dokumentasi HIMAFORKA",
                style: TextStyle(
                  fontSize: 27,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Beberapa dokumentasi kegiatan yang di selenggarakan, dokumentasi ini mencangkup semua pelaksanaan kegiatan di HIMAFORKA, seperti Latihan Kader, Kuliah Umum, dan Maroon Day",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 990,
                ),
                padding: const EdgeInsets.only(top: 30, left: 80),
                height: 800,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: 18,
                  itemBuilder: (context, index) {
                    // Replace the placeholder with your actual images
                    return Container(
                        color: Theme.of(context).primaryColor,
                        width: 190,
                        height: 136,
                        child: const Text("Halo"));
                  },
                ),
              ),
            ],
          ),
        ),
        AppConstants.height(100),
        const SectionFooter()
      ],
    );
  }
}
