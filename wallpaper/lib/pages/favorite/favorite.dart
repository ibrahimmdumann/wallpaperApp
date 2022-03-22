import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/pages/favorite/favorite-manager.dart';
import 'package:wallpaper/pages/home/home-models.dart';
import 'package:wallpaper/pages/home/widgets/thumb-image.dart';
import 'package:wallpaper/shared/custom-widgets/custom-ads.dart';

class Favorite extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteManager>().getFavorites();
    return BlocBuilder<FavoriteManager, List<Images>>(
      builder: (context, images) {
        print(images.length);
        return Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          child: ListView.separated(
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
        );
      },
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