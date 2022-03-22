import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class RouteBloc extends Cubit<PageEnum>{
  RouteBloc() : super(PageEnum.Home);

  void home() => emit(PageEnum.Home);
  void favorite() => emit(PageEnum.Favorite);
}

enum PageEnum{
  Home,
  Favorite
}