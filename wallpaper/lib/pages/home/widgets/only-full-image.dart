import 'package:flutter/material.dart';
import 'package:wallpaper/pages/home/home-models.dart';

class OnlyFullImage extends StatelessWidget {
  Images image;
  String tag;
  OnlyFullImage({required this.image, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Hero(
          tag: tag,
          child: Image.network(
            '${image.orjImg}',
            fit: BoxFit.contain,
            loadingBuilder: (context, child, event) {
              if (event == null) {
                return child;
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
        onTap: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}