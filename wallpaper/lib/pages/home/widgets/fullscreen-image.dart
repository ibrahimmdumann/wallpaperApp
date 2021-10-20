import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wallpaper/pages/home/home-models.dart';

class FullScreenImage extends StatelessWidget {
  Images image;
  FullScreenImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('${image.thumb}'),
          fit: BoxFit.fill
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('${image.thumb}'),
              fit: BoxFit.contain
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                '${image.orjImg}',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, event) {
                  if (event == null) {
                    return child;
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

}
