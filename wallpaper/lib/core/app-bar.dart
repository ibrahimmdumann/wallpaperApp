import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/pages/route-bloc.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget{
  GlobalKey<ScaffoldState>? scaffoldKey;
  MyAppBar({this.scaffoldKey});

  static double _height = 40;

  Color? activeColorIcon = Colors.grey[900];
  Color? deActiveColorIcon = Colors.grey[300];
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.blueGrey
      ),
      title: Container(
        margin: EdgeInsets.only(top: 10),
        height: _height,
        alignment: Alignment.bottomCenter,
        child: BlocBuilder<RouteBloc, PageEnum>(
          builder: (context, page) {
            return Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      context.read<RouteBloc>().home();
                    },
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: page == PageEnum.Home ? Colors.grey[300] : Colors.grey[100],
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12))
                      ),
                      child: Icon(Icons.home, color: page == PageEnum.Home ? activeColorIcon:deActiveColorIcon,),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      context.read<RouteBloc>().favorite();
                    },
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: page == PageEnum.Favorite ? Colors.grey[300] : Colors.grey[100],
                        borderRadius: BorderRadius.only(topRight: Radius.circular(12))
                      ),
                      child: Icon(Icons.favorite, color: page == PageEnum.Favorite ? activeColorIcon:deActiveColorIcon,),
                    ),
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_height);
}