import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/core/app-bar.dart';
import 'package:wallpaper/pages/favorite/favorite.dart';
import 'package:wallpaper/pages/home/home.dart';
import 'package:wallpaper/pages/main-page.dart';
import 'package:wallpaper/pages/route-bloc.dart';

class RouteManager extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0XFF48426D),
      // appBar: MyAppBar(scaffoldKey: _scaffoldKey,),
      // drawer: MyDrawer(),
      body: SafeArea(
        child: BlocBuilder<RouteBloc, PageEnum>(
          builder: (context, page){
            return selectionWidget(page);
          },
        ),
      ),
    );
  }

  Widget selectionWidget(PageEnum page){
    switch (page) {
      case PageEnum.Home:
        return MainPage();
      case PageEnum.Favorite:
        return Favorite();
      default:
        return Home();
    }
  }
}