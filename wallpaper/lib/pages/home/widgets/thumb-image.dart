import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/pages/favorite/favorite-manager.dart';
import 'package:wallpaper/pages/home/home-models.dart';
import 'package:wallpaper/pages/home/widgets/fullscreen-page.dart';
import 'package:wallpaper/shared/custom-widgets/custom-image.dart';
import 'package:wallpaper/shared/custom-widgets/custom-text.dart';

class ThumbImage extends StatefulWidget {
  List<Images> image;
  ThumbImage({
    required this.image,
  });

  @override
  State<ThumbImage> createState() => _ThumbImageState();
}

class _ThumbImageState extends State<ThumbImage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: _image(context, 0)
                ),
                Expanded(
                  flex: 2,
                  child: _image(context, 2)
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: _image(context, 1)
                ),
                Expanded(
                  flex: 3,
                  child: _image(context, 3)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _image(BuildContext context, int i){
    return !widget.image.asMap().containsKey(i) ? Container():
    GestureDetector(
      onTap: () =>  Navigator.push(context, MaterialPageRoute(
        builder: (context) => FullscreenPage(image: widget.image[i]))
      ),
      onHorizontalDragUpdate: (value) {
         setState(() {
           if(value.delta.dx > 0) return null;
           widget.image[i].primaryDelta += value.delta.dx.ceil()/50;
         });
       },
       onHorizontalDragEnd: (value) {
        setState(() {
          widget.image[i].primaryDelta = 0;
        });
        context.read<FavoriteManager>().setFavorite(widget.image[i]);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Hızlı İşlem Favoriler !! ${widget.image[i].isFav ? "Çıkarıldı":"Eklendi"}'),
              Container(
                width: 25,
                height: 25,
                child: CustomImage(url: widget.image[i].thumb,),
              )
            ],
          ),
        ));
        widget.image[i].isFav = !widget.image[i].isFav;
       },
       child: Align(
         alignment: Alignment(widget.image[i].primaryDelta, 0),
         child: Container(
           width: ((MediaQuery.of(context).size.width-100) / 2) - 20,
           height: double.infinity,
           padding: EdgeInsets.only(bottom: 10, top: 5),
           child: CustomImage(url: widget.image[i].thumb)
          )
       )
    );
  }
}