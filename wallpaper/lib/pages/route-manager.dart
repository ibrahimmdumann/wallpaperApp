import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/core/app-bar.dart';
import 'package:wallpaper/core/bottom-bar.dart';
import 'package:wallpaper/core/drawer.dart';
import 'package:wallpaper/pages/route-bloc.dart';

class RouteManager extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      //appBar: MyAppBar(scaffoldKey: _scaffoldKey,),
      //drawer: MyDrawer(),
      body: SafeArea(
        child: BlocBuilder<RouteBloc, Widget>(
          builder: (context, widget){
            return widget;
          },
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}