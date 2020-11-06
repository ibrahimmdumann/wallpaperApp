import 'package:flutter/material.dart';
import 'package:wallpaper/shared/custom-widgets/custom-text.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Container(),
          ),
          CustomText(
            text: 'Menu-1',
          )
        ],
      ),
    );
  }
}