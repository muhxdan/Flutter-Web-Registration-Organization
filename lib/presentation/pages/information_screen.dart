import 'package:flutter/material.dart';
import 'package:pendaftaran_organisasi_mahasiswa/presentation/pages/home_screen.dart';
import 'package:pendaftaran_organisasi_mahasiswa/utils/appConstants.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 44),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: 1152,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/img_strutkur_organisasi.png",
                  width: 465,
                  height: 443,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 546,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Struktur Organisasi HIMAFORKA",
                            style: TextStyle(
                              fontSize: 27,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          AppConstants.height(20),
                          const Text(
                            "Berdasarkan struktur organisasi HIMAFORKA terdapat beberapa divisi, didalam divisi terdapat beberapa anggota yang akan membantu setiap koor menjalankan tanggung jawab setiap divisi tersebut. Dan berikut jumlah keseluruhan PH dan anggota inti yang terdapat di HIMAFORKA",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          AppConstants.height(20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TotalMembers(
                                title: "Pengurus Harian",
                                total: "16",
                              ),
                              TotalMembers(
                                title: "Anggota Inti",
                                total: "30",
                              ),
                              TotalMembers(
                                title: "Jumlah Keseluruhan",
                                total: "49",
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          AppConstants.height(100),
          Text(
            "Jajaran Pengurus Harian (PH)",
            style: TextStyle(
              fontSize: 27,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          AppConstants.height(10),
          const Text(
            "Berikut beberapa profil pengurus dan setiap koor divisi di HIMAFORKA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          AppConstants.height(50),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 1152,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DailyExecutiveMember(
                  imagePath: "assets/images/img_ph1.png",
                  status: "Ketua",
                  name: "Maulana Latifnabil",
                ),
                DailyExecutiveMember(
                  imagePath: "assets/images/img_ph2.png",
                  status: "Wakil Ketua",
                  name: "Izz Sabdo Negoro",
                ),
                DailyExecutiveMember(
                  imagePath: "assets/images/img_ph3.png",
                  status: "Sekretaris",
                  name: "Febi Maharani",
                ),
                DailyExecutiveMember(
                  imagePath: "assets/images/img_ph4.png",
                  status: "Bendahara",
                  name: "Carmelita Cynthia Dagur",
                ),
                DailyExecutiveMember(
                  imagePath: "assets/images/img_ph5.png",
                  status: "Koor SDD",
                  name: "Ryan Wildan Edelwise",
                ),
                DailyExecutiveMember(
                  imagePath: "assets/images/img_ph6.png",
                  status: "Koor Networking",
                  name: "Ellinda",
                ),
                DailyExecutiveMember(
                  imagePath: "assets/images/img_ph7.png",
                  status: "Koor Internal",
                  name: "Aphrodyta Salsa",
                ),
              ],
            ),
          ),
          AppConstants.height(150),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 1152,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: VisionMission(
                    title: "Visi",
                    desc:
                        "Menjadikan Himpunan Mahasiswa Informatika yang lebih berkembang, berkualitas, profesional dan menjunjung tinggi nilai solidaritas dalam bersinergi serta menjadi wadah untuk mahasiswa Informatika dalam memberikan pelayanan dan informasi.",
                  ),
                ),
                AppConstants.width(50),
                const Expanded(
                  child: VisionMission(
                    title: "Misi",
                    desc: [
                      "Mengadakan kegiatan yang menunjang sisi akademis maupun non-akademis mahasiswa Informatika",
                      "Menjadi wadah dalam menampung aspirasi mahasiswa Informatika",
                      "Menciptakan anggota HIMAFORKA yang kreatif, inovatif, kritis, dan solutif",
                      "Menjalin relasi yang luas dengan mengoptimalkan kegiatan yang berhubungan dengan internal maupun eksternal Universitas"
                    ],
                  ),
                )
              ],
            ),
          ),
          AppConstants.height(150),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 1152,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Info Kegiatan HIMAFORKA",
                  style: TextStyle(
                      fontSize: 27,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const Text(
                  "Contoh beberapa kegiatan di HIMAFORKA dan masih banyak kegiatan yang lainnya yang seru dan menarik",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.start,
                ),
                AppConstants.height(50),
                const ActivityInformation(
                  imagePath: "assets/images/info1.png",
                  title: "LK (Latihan Kader)",
                  desc:
                      "Universitas Teknologi Digital Indonesia memiliki beragam organisasi mahasiswa yang menawarkan berbagai kegiatan, proyek, dan event. Bergabunglah bersama kami dan temukan peluang untuk terlibat dalam berbagai aktivitas yang memperkaya pengalaman kuliahmu.",
                ),
                AppConstants.height(50),
                const ActivityInformation(
                  imagePath: "assets/images/info2.png",
                  title: "KULUM (Kuliah Umum)",
                  desc:
                      "Universitas Teknologi Digital Indonesia memiliki beragam organisasi mahasiswa yang menawarkan berbagai kegiatan, proyek, dan event. Bergabunglah bersama kami dan temukan peluang untuk terlibat dalam berbagai aktivitas yang memperkaya pengalaman kuliahmu.",
                ),
                AppConstants.height(50),
                const ActivityInformation(
                  imagePath: "assets/images/info3.png",
                  title: "Maroon Day",
                  desc:
                      "Universitas Teknologi Digital Indonesia memiliki beragam organisasi mahasiswa yang menawarkan berbagai kegiatan, proyek, dan event. Bergabunglah bersama kami dan temukan peluang untuk terlibat dalam berbagai aktivitas yang memperkaya pengalaman kuliahmu.",
                ),
              ],
            ),
          ),
          AppConstants.height(150),
          const SectionFooter(),
        ],
      ),
    );
  }
}

class ActivityInformation extends StatelessWidget {
  final String imagePath;
  final String title;
  final String desc;
  const ActivityInformation({
    super.key,
    required this.imagePath,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: 250,
          height: 150,
          fit: BoxFit.cover,
        ),
        AppConstants.width(20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              AppConstants.height(20),
              Text(
                desc,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class VisionMission extends StatelessWidget {
  final String title;
  final dynamic desc;

  const VisionMission({Key? key, required this.title, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 430,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 27,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          AppConstants.height(30),
          if (desc is String)
            Text(
              desc,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.justify,
            ),
          if (desc is List<String>) VissionMissionList(list: desc),
        ],
      ),
    );
  }
}

class VissionMissionList extends StatelessWidget {
  final List<String> list;
  const VissionMissionList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in list) {
      widgetList.add(VissionMissionListItem(text));
      widgetList.add(const SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class VissionMissionListItem extends StatelessWidget {
  const VissionMissionListItem(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("• "),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}

class DailyExecutiveMember extends StatelessWidget {
  final String imagePath;
  final String status;
  final String name;
  const DailyExecutiveMember(
      {super.key,
      required this.imagePath,
      required this.status,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 109,
          height: 154,
        ),
        Text(
          status,
          style: const TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class TotalMembers extends StatelessWidget {
  final String title;
  final String total;

  const TotalMembers({super.key, required this.title, required this.total});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 123,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            total,
            style: const TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
