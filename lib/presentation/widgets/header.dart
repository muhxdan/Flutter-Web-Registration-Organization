import 'package:flutter/material.dart';

Widget header(BuildContext context, Function showSubMenu, Function selectMenu,
    GlobalKey submenuKey, String selectedMenu, String selectedSubMenu) {
  return Row(
    children: [
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
                          .keyboard_arrow_down,
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
