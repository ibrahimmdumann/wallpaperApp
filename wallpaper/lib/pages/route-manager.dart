import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/pages/route-bloc.dart';

class RouteManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: BlocBuilder<RouteBloc, Widget>(
        builder: (context, widget){
          print(widget);
          return widget;
        },
      ),
    );
  }
}