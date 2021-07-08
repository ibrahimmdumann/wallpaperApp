import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wallpaper/shared/custom-widgets/custom-slide-trans.dart';
import 'package:wallpaper/shared/custom-widgets/custom-text.dart';

class FullScreenImage extends StatelessWidget {
  String? url;
  String? thumb;
  FullScreenImage({this.url, this.thumb});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('$thumb'),
              fit: BoxFit.fill
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('$thumb'),
                  fit: BoxFit.contain
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Image.network(
                  '$url',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, event){
                    if(event == null){
                      return child;
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 40,
            color: Colors.white.withOpacity(0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: favoriteButton(),
                  icon: Icon(Icons.favorite, color: Colors.black),
                  label: CustomText(text: '',),
                ),
                TextButton.icon(
                  onPressed: (){
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent.withOpacity(0.5),
                      isScrollControlled: true,
                      context: context,
                      builder: (context){
                        return Container(
                          child: Column(
                            children: [
                              Expanded(
                                child: optionMenu('Main Screen', 950),
                              ),
                              Expanded(
                                child: optionMenu('Lock Screen', 1150),
                              ),
                              Expanded(
                                child: optionMenu('Both Screen', 1350),
                              ),
                            ],
                          ),
                        );
                      }
                    );
                  },
                  icon: Icon(Icons.add_to_home_screen, color: Colors.black,),
                  label: CustomText(text: '',),
                ),
                TextButton.icon(
                  onPressed: moreButton(),
                  icon: Icon(Icons.more_horiz, color: Colors.black),
                  label: CustomText(text: '',),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  optionMenu(String text, int duration){
    return Container(
      child: CustomSlideTransition(text: '$text', duration: duration,),
    );
  }

  favoriteButton(){}

  moreButton(){}

}