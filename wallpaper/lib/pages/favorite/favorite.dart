import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/pages/favorite/favorite-manager.dart';
import 'package:wallpaper/pages/home/home-models.dart';
import 'package:wallpaper/pages/home/widgets/thumb-image.dart';
import 'package:wallpaper/shared/custom-widgets/custom-ads.dart';

class Favorite extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final FavoriteManager favoriteManager = BlocProvider.of<FavoriteManager>(context);

    return BlocBuilder<FavoriteManager, List<Images>>(
      builder: (context, images) {
        return Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          child: ListView.separated(
            itemCount: images.length,
            itemBuilder: (_,i){
              if(i==0 || (i % 4 == 0 && images.length>i+4)){
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
    return images.sublist(index, index+4);
  }
  
}