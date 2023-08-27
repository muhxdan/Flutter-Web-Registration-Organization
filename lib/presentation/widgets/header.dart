import 'package:flutter/material.dart';

Widget header(BuildContext context, Function showSubMenu, Function selectMenu,
    GlobalKey submenuKey, String selectedMenu, String selectedSubMenu) {
  return Row(
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
      const Spacer(),
      for (String item in ['Home', 'Informasi', 'pendaftaran', 'Galeri'])
        GestureDetector(
          onTap: () {
            if (item == 'Informasi') {
              showSubMenu(context);
            } else {
              selectMenu(item);
            }
          },
          child: Container(
              key: item == 'Informasi' ? submenuKey : null,
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Row(
                children: [
                  Text(
                    item,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: selectedMenu == item ||
                              (selectedSubMenu.isNotEmpty &&
                                  item == 'Informasi')
                          ? Colors.blue
                          : Colors.black,
                    ),
                  ),
                  if (item == 'Informasi')
                    Icon(
                      Icons
                          .keyboard_arrow_down, // Menggunakan ikon anak panah ke bawah
                      color: selectedMenu == item ||
                              (selectedSubMenu.isNotEmpty &&
                                  item == 'Informasi')
                          ? Colors.blue
                          : Colors.black,
                    ),
                ],
              )),
        ),
    ],
  );
}
