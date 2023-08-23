import 'package:flutter/material.dart';
import 'package:pendaftaran_organisasi_mahasiswa/presentation/widgets/header.dart';
import 'package:pendaftaran_organisasi_mahasiswa/utils/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pendaftaran Organisasi Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedMenu = 'Home';
  String selectedSubMenu = '';
  GlobalKey submenuKey = GlobalKey();

  void _selectMenu(String menu) {
    setState(() {
      selectedMenu = menu;
      selectedSubMenu = '';
    });
  }

  void _selectSubMenu(String subMenu) {
    setState(() {
      selectedSubMenu = subMenu;
      selectedMenu = 'Information';
    });
  }

  void _showSubMenu(BuildContext context) {
    final RenderBox renderBox =
        submenuKey.currentContext!.findRenderObject() as RenderBox;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: header(context, _showSubMenu, _selectMenu, submenuKey,
                selectedMenu, selectedSubMenu),
          ),
          if (selectedSubMenu.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Konten $selectedSubMenu',
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          if (selectedMenu != 'Information' && selectedSubMenu.isEmpty)
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Konten $selectedMenu',
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
