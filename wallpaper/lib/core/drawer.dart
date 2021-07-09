import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/pages/route-bloc.dart';
import 'package:wallpaper/shared/custom-widgets/custom-text.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RouteBloc routeBloc = BlocProvider.of<RouteBloc>(context);

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Container(),
          ),
          ListTile(
            title: CustomText(text: 'Home'),
            onTap: (){
              Navigator.pop(context);
              routeBloc.add(Pages.Home);
            },
          ),
          Divider(height: 10, thickness: 2,),
          ListTile(
            title: CustomText(text: 'Favorite'),
            onTap: (){
              Navigator.pop(context);
              routeBloc.add(Pages.Favorite);
            },
          ),
          Divider(height: 10, thickness: 2,),
        ],
      ),
    );
  }
}