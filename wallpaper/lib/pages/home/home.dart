import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/pages/home/home-manager.dart';
import 'package:wallpaper/pages/home/home-models.dart';
import 'package:wallpaper/pages/home/widgets/home-bar.dart';
import 'package:wallpaper/pages/home/widgets/thumb-image.dart';
import 'package:wallpaper/shared/custom-widgets/custom-ads.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeManager homeManager = BlocProvider.of<HomeManager>(context);

    var images = homeManager.materialWallpaper.materialWallpaper;

    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: [
          Container(
            height: 150,
            color: Colors.red,
          ),
          HomeBar(),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: images.length,
              itemBuilder: (_,i){
                if(i==0 || i % 4 == 0){
                  return ThumbImage(image: setImages(i, images));
                }
                return Container();
              },
              separatorBuilder: (_,i){
                if(i != 0 && i % 8 == 0){
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

  List<Images> setImages(int index, List<Images> images){
    if(images.length >= index+4){
      return images.sublist(index, index+4);
    }
    else{
      return images.sublist(index, images.length);
    }
  }

}