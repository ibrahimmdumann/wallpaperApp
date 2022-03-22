import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:wallpaper/pages/favorite/favorite.dart';
import 'package:wallpaper/pages/home/home.dart';

class RouteBloc extends Cubit<Widget>{
  RouteBloc() : super(Home());

  void home() => emit(Home());
  void favorite() => emit(Favorite());
}