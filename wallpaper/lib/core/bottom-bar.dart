import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/pages/route-bloc.dart';

class BottomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final RouteBloc routeBloc = BlocProvider.of<RouteBloc>(context);
    
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home_outlined),
            onPressed: (){
              routeBloc.add(Pages.Home);
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: (){
              routeBloc.add(Pages.Favorite);
            },
          ),
          IconButton(
            icon: Icon(Icons.wallpaper),
            onPressed: (){
              routeBloc.add(Pages.Deneme);
            },
          ),
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: (){
              routeBloc.add(Pages.Profile);
            },
          ),
        ],
      ),
    );
  }
}