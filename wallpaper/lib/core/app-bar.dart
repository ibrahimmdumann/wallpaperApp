import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget{
  GlobalKey<ScaffoldState>? scaffoldKey;
  MyAppBar({this.scaffoldKey});
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.blueGrey
      ),
      centerTitle: true,
      leading: Container(),
      title: IconButton(
        icon: Icon(Icons.spa_outlined),
        onPressed: (){
          scaffoldKey?.currentState?.openDrawer();
        },
      )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}