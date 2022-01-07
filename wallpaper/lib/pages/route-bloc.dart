import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:wallpaper/pages/deneme.dart';
import 'package:wallpaper/pages/favorite/favorite.dart';
import 'package:wallpaper/pages/home/home.dart';
import 'package:wallpaper/pages/profile/profile.dart';

class RouteBloc extends Bloc<Pages, Widget>{
  RouteBloc() : super(Home());

  @override
  Stream<Widget> mapEventToState(event) async* {
    switch(event){
      case Pages.Home:
        yield Home();
        break;
      case Pages.Favorite:
        yield Favorite();
        break;
      case Pages.Profile:
        yield Profile();
        break;
      case Pages.Deneme:
        yield Deneme();
        break;
      default:
        yield Home();
    }
  }

}

enum Pages {
  Home,
  Favorite,
  Profile,
  Deneme
}