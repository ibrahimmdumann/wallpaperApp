import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/pages/home/home-manager.dart';
import 'package:wallpaper/shared/custom-widgets/custom-ads.dart';
import 'package:wallpaper/shared/custom-widgets/custom-image.dart';

class Deneme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final HomeManager homeManager = BlocProvider.of<HomeManager>(context);

    var a = homeManager.materialWallpaper.materialWallpaper.length/2;

    return SingleChildScrollView(
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemCount: a.floor(),
              itemBuilder: (_,i){
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CustomImage(
                    url: homeManager.materialWallpaper.materialWallpaper[i].thumb,
                  ),
                );
              },
              separatorBuilder: (_,i){
                if(i != 0 && i % 4 == 0){
                  return CustomAds();
                }
                return Container();
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemCount: a.floor(),
              itemBuilder: (_,i){
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CustomImage(
                    url: homeManager.materialWallpaper.materialWallpaper[a.floor()+i].thumb,
                  ),
                );
              },
              separatorBuilder: (_,i){
                if(i != 0 && i % 9 == 0){
                  return CustomAds();
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}