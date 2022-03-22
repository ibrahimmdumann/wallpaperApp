import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/pages/home/home-manager.dart';
import 'package:wallpaper/pages/route-manager.dart';
import 'package:wallpaper/pages/splash-screen/splash-screen.dart';

class BeforeStarting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<HomeManager>().add(Event.GetImages);

    return BlocBuilder<HomeManager, States>(
      builder: (context, states){
        switch(states){
          case States.Loading:
            return SplashScreen();
          case States.Loaded:
            return RouteManager();
          default:
            return Center(child: Text('Birşeyler Ters Gitti'));
        }
      }
    );
  }
}