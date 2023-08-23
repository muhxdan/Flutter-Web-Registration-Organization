import 'package:flutter/material.dart';

Widget header(BuildContext context, Function showSubMenu, Function selectMenu,
    GlobalKey submenuKey, String selectedMenu, String selectedSubMenu) {
  return Row(
    children: [
      const Text(
        'Logo',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(),
      for (String item in ['Home', 'Information', 'Contact', 'About'])
        GestureDetector(
          onTap: () {
            if (item == 'Information') {
              showSubMenu(context);
            } else {
              selectMenu(item);
            }
          },
          child: Container(
            key: item == 'Information' ? submenuKey : null,
            color: selectedMenu == item ||
                    (selectedSubMenu.isNotEmpty && item == 'Information')
                ? Colors.blue
                : Colors.transparent,
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
    ],
  );
}
