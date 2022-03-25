import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/pages/favorite/favorite-manager.dart';
import 'package:wallpaper/pages/home/home-models.dart';
import 'package:wallpaper/shared/custom-widgets/custom-ads.dart';
import 'package:wallpaper/shared/custom-widgets/custom-image.dart';

class FavoriteThumb extends StatelessWidget {
  const FavoriteThumb({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteManager>().getFavorites();
    return BlocBuilder<FavoriteManager, List<Images>>(
      builder: (context, images) {
        return Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          child: ListView.separated(
            itemCount: images.length,
            itemBuilder: (_,i){
              return Container(
                margin: EdgeInsets.only(bottom: 10, top: 5),
                child: CustomImage(url: images[i].thumb)
              );
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

}