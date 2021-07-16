import 'package:flutter/material.dart';
import 'package:wallpaper/pages/home/home-models.dart';
import 'package:wallpaper/pages/home/widgets/fullscreen-image.dart';
import 'package:wallpaper/shared/custom-widgets/custom-image.dart';

class ThumbImage extends StatelessWidget {
  List<Images> image;
  ThumbImage({
    required this.image,
  });

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
                  child: GestureDetector(
                    onTap: () => fullscreenNavigator(context, image[0]),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(5),
                      child: CustomImage(url: image[0].thumb)
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => fullscreenNavigator(context, image[2]),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(5),
                      child: CustomImage(url: image[2].thumb),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => fullscreenNavigator(context, image[1]),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(5),
                      child: CustomImage(url: image[1].thumb)
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () => fullscreenNavigator(context, image[3]),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(5),
                      child: CustomImage(url: image[3].thumb)
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void fullscreenNavigator(BuildContext context, Images image){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => FullScreenImage(image: image,))
    );
  }
}