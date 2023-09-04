import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  TextEditingController textController = TextEditingController();

  int position = 0;
  List<String> navList = ['Home', 'Informasi', 'Pendaftaran', 'Galeri'];

  void _showSubMenu(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + renderBox.size.height,
        position.dx + renderBox.size.width,
        position.dy + renderBox.size.height + 1.0,
      ),
      items: <PopupMenuItem<String>>[
        const PopupMenuItem<String>(
          value: 'Information 1',
          child: Text('Information 1'),
        ),
        const PopupMenuItem<String>(
          value: 'Information 2',
          child: Text('Information 2'),
        ),
      ],
    ).then((selectedSubMenu) {
      if (selectedSubMenu != null) {
        _selectSubMenu(selectedSubMenu);
      }
    });
  }

  void _selectSubMenu(String selectedSubMenu) {
    setState(() {
      // Implementasikan tindakan yang sesuai berdasarkan pilihan submenu yang dipilih di sini
      // Misalnya, Anda bisa mengganti nilai position ke indeks 'Informasi' jika submenu dipilih
      position = navList.indexOf('Informasi');
      print(selectedSubMenu);
    });
  }

  Widget navBody = const HomeScreen();

  String searchIndex = '';

  final TextEditingController _searchController = TextEditingController();
  List<String> organizations = [
    "Organisasi Informatika",
    "Organisasi Mahasiswa",
    "Organization",
    "Organisasi Bebek",
  ];
  List<String> searchResults = [];

  void _searchOrganizations(String query) {
    setState(() {
      if (query.isEmpty) {
        searchResults.clear();
      } else {
        searchResults = organizations.where((org) {
          final orgWords = org.toLowerCase().split(" ");
          final queryWords = query.toLowerCase().split(" ");
          return queryWords.every((queryWord) =>
              orgWords.any((orgWord) => orgWord.startsWith(queryWord)));
        }).toList();
      }
    });
  }

  bool isExpanded = false;

  @override
  void dispose() {
    _searchController.dispose();
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
          // here the desired height
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
      body: GestureDetector(
        onTap: () {
          if (isExpanded) {
            // Tutup SearchBar jika sedang terbuka
            setState(() {
              isExpanded = false;
            });
          }
        },
        child: Center(
          child: Column(
            children: <Widget>[
              Visibility(
                visible: ResponsiveLayout.isSmallScreen(context) ? false : true,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  constraints: const BoxConstraints(
                    maxWidth: 1115,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Image.asset(
                          "assets/images/logo.png",
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Universitas\nTeknologi Digital\nIndonesia',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ]),
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
                                              color: Theme.of(context)
                                                  .primaryColor,
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
                                              color: Theme.of(context)
                                                  .primaryColor,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: isExpanded
                                ? 200.0
                                : 47.0, // Ubah lebar sesuai kondisi
                            height: 43.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => setState(() {
                                    isExpanded =
                                        !isExpanded; // Mengubah kondisi saat ikon pencarian diklik
                                  }),
                                  child: Container(
                                    width: 47,
                                    height: 43,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/images/ic_search.svg",
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                      right: 10,
                                    ),
                                    child: TextField(
                                      onChanged: (text) {
                                        print('Search query: $text');
                                      },
                                      decoration: const InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(bottom: 5),
                                        hintText: 'Search...',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: searchIndex.isNotEmpty ? true : false,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(searchResults[index]),
                        // Handle item selection here
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Scrollbar(
                    thickness: 10,
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      child: navPage(position),
                    ),
                  ),
                ),
              ),
            ],
          ),
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






// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String selectedMenu = 'Home';
//   String selectedSubMenu = '';
//   GlobalKey submenuKey = GlobalKey();

//   void _selectMenu(String menu) {
//     setState(() {
//       selectedMenu = menu;
//       selectedSubMenu = '';
//     });
//   }

//   void _selectSubMenu(String subMenu) {
//     setState(() {
//       selectedSubMenu = subMenu;
//       selectedMenu = 'Informasi';
//     });
//   }

//   void _showSubMenu(BuildContext context) {
//     final RenderBox renderBox =
//         submenuKey.currentContext!.findRenderObject() as RenderBox;
//     final position = renderBox.localToGlobal(Offset.zero);

//     showMenu(
//       context: context,
//       position: RelativeRect.fromLTRB(
//         position.dx,
//         position.dy + renderBox.size.height,
//         position.dx + renderBox.size.width,
//         position.dy + renderBox.size.height + 1.0,
//       ),
//       items: <PopupMenuItem<String>>[
//         const PopupMenuItem<String>(
//           value: 'Information 1',
//           child: Text('Information 1'),
//         ),
//         const PopupMenuItem<String>(
//           value: 'Information 2',
//           child: Text('Information 2'),
//         ),
//       ],
//     ).then((selectedSubMenu) {
//       if (selectedSubMenu != null) {
//         _selectSubMenu(selectedSubMenu);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16.0),
//             child: header(context, _showSubMenu, _selectMenu, submenuKey,
//                 selectedMenu, selectedSubMenu),
//           ),
//           if (selectedSubMenu.isNotEmpty)
//             Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Konten $selectedSubMenu',
//                 style: const TextStyle(
//                   fontSize: 18.0,
//                 ),
//               ),
//             ),
//           if (selectedMenu != 'Informasi' && selectedSubMenu.isEmpty)
//             Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Konten $selectedMenu',
//                 style: const TextStyle(
//                   fontSize: 18.0,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }





