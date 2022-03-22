import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/core/app-bar.dart';
import 'package:wallpaper/pages/favorite/favorite.dart';
import 'package:wallpaper/pages/home/home.dart';
import 'package:wallpaper/pages/route-bloc.dart';

class RouteManager extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: MyAppBar(scaffoldKey: _scaffoldKey,),
      // drawer: MyDrawer(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: BlocBuilder<RouteBloc, PageEnum>(
            builder: (context, page){
              return Container(
                color: Colors.grey[300],
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: selectionWidget(page)
              );
            },
          ),
        ),
      ),
    );
  }

  Widget selectionWidget(PageEnum page){
    switch (page) {
      case PageEnum.Home:
        return Home();
      case PageEnum.Favorite:
        return Favorite();
      default:
        return Home();
    }
  }
}