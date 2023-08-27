import 'package:flutter/material.dart';
import 'package:pendaftaran_organisasi_mahasiswa/utils/themes/themes.dart';

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
  List<String> navList = ['Home', 'Informasi', 'pendaftaran', 'Galeri'];
  int position = 0;
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
      body: Column(
        children: <Widget>[
          Visibility(
            visible: ResponsiveLayout.isSmallScreen(context) ? false : true,
            child: Container(
              padding: const EdgeInsets.all(10),
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
                    const Text(
                      'Universitas\nTeknologi Digital\nIndonesia',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
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
                        return InkWell(
                          splashColor: Colors.yellow,
                          hoverColor: Colors.green,
                          borderRadius: BorderRadius.circular(10.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 10), // Tambahkan padding di sini
                            child: Text(
                              navList[index],
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              position = index;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Search",
                        suffixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onChanged: (value) {
                        searchIndex = value;
                        _searchOrganizations(
                            value); // Panggil fungsi pencarian saat perubahan input
                      },
                    ),
                  ),
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
              child: SingleChildScrollView(
                child: navPage(position),
              ),
            ),
          ),
        ],
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.black,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.white,
            height: 100,
            width: 100,
          ),
        ],
      ),
    );
  }
}

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Information Screen"),
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Registration Screen"),
    );
  }
}

class GaleryScreen extends StatelessWidget {
  const GaleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Galery Screen"),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveLayout({
    required Key key,
    required this.largeScreen,
    required this.mediumScreen,
    required this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return largeScreen;
        } else if (constraints.maxWidth >= 800) {
          return mediumScreen;
        } else {
          return smallScreen;
        }
      },
    );
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





