import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pendaftaran_organisasi_mahasiswa/utils/themes/themes.dart';

import 'presentation/pages/galery_screen.dart';
import 'presentation/pages/home_screen.dart';
import 'presentation/pages/information_screen.dart';
import 'presentation/pages/registration_screen.dart';
import 'utils/themes/responsive.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      title: 'Pendaftaran Organisasi Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController scrollController = ScrollController();
  TextEditingController textController = TextEditingController();

  int position = 0;
  List<String> navList = ['Home', 'Informasi', 'Dokumentasi', 'Pendaftaran'];

  void _selectSubMenu(String selectedSubMenu) {
    setState(() {
      position = navList.indexOf('Informasi');
      print(selectedSubMenu);
    });
  }

  Widget navBody = const HomeScreen();

  @override
  void dispose() {
    super.dispose();
  }

  String selectedSubMenu = '';
  GlobalKey submenuKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: ResponsiveLayout.isSmallScreen(context)
              ? const Size.fromHeight(50.0)
              : const Size.fromHeight(0.0),
          child: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
          )),
      drawer: ResponsiveLayout.isSmallScreen(context)
          ? Drawer(
              child: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 30),
                        child: const Text("Halo"),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: navList.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              splashColor: Colors.yellow,
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Text(
                                  navList[index],
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  position = index;
                                  Navigator.of(context).pop();
                                });
                              },
                            );
                          }),
                    ],
                  )),
            )
          : null,
      body: Center(
        child: Column(
          children: <Widget>[
            Visibility(
              visible: ResponsiveLayout.isSmallScreen(context) ? false : true,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                constraints: const BoxConstraints(
                  maxWidth: 1152,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/logo_hima.png",
                      width: 70,
                      height: 70,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: navList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return index == 1
                                  ? Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7),
                                child: Material(
                                  color: Colors.transparent,
                                  child: PopupMenuButton<String>(
                                    offset: const Offset(80, 50),
                                    onSelected: (selectedSubMenu) {
                                      _selectSubMenu(selectedSubMenu);
                                    },
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(
                                        value: 'Information 1',
                                        child: Text('Information 1'),
                                      ),
                                      const PopupMenuItem(
                                        value: 'Information 2',
                                        child: Text('Information 2'),
                                      ),
                                    ],
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        navList[index],
                                        style: TextStyle(
                                          color: position == index
                                              ? Theme.of(context)
                                              .primaryColor
                                              : Colors.black,
                                          fontSize: 17,
                                          fontWeight: position == index
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                                  : Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.2),
                                    borderRadius:
                                    BorderRadius.circular(10.0),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        navList[index],
                                        style: TextStyle(
                                          color: position == index
                                              ? Theme.of(context)
                                              .primaryColor
                                              : Colors.black,
                                          fontSize: 17,
                                          fontWeight: position == index
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        position = index;
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 20,),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Theme.of(context).primaryColor,
                            minimumSize: const Size(100, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: navPage(position),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget navPage(int clickPosition) {
    setState(() {
      if (clickPosition == 0) {
        navBody = const HomeScreen();
      } else if (clickPosition == 1) {
        navBody = const InformationScreen();
      } else if (clickPosition == 2) {
        navBody = const RegistrationScreen();
      } else if (clickPosition == 3) {
        navBody = const GaleryScreen();
      }
    });
    return navBody;
  }
}
