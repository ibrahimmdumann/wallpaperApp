import 'package:flutter/material.dart';
import 'package:wallpaper/pages/favorite/favorite-thumb.dart';
import 'package:wallpaper/pages/home/home.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 100,
            child: FavoriteThumb(),
          ),
          Container(
            width: MediaQuery.of(context).size.width-100,
            child: Home()
          ),
        ],
      )
    );
  }
}