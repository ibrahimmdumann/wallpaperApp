import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:wallpaper/pages/home/home.dart';

class RouteBloc extends Bloc<Pages, Widget>{
  RouteBloc() : super(Home());

  @override
  Stream<Widget> mapEventToState(event) async* {
    switch(event){
      case Pages.Home:
        yield Home();
        break;
      default:
        yield Home();
    }
  }

}

enum Pages {
  Home
}