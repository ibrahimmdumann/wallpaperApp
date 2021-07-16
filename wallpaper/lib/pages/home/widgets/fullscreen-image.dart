import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wallpaper/pages/home/home-models.dart';
import 'package:wallpaper/shared/custom-widgets/custom-slide-trans.dart';
import 'package:wallpaper/shared/custom-widgets/custom-text.dart';
import 'package:wallpaper/shared/database/app-cruds.dart';

class FullScreenImage extends StatefulWidget {
  Images image;
  FullScreenImage({required this.image});

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  AppCruds _appCruds = AppCruds();

  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFav();
  }

  Future isFav() async {
    var a = await _appCruds.isFavorite(widget.image);
    setState(() {
        isFavorite = a != null;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('${widget.image.thumb}'),
              fit: BoxFit.fill
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('${widget.image.thumb}'),
                  fit: BoxFit.contain
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Image.network(
                  '${widget.image.orjImg}',
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
                  onPressed: () => favoriteButton(),
                  icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_outline, color: Colors.black),
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

  favoriteButton() async{
    print('isfavorite: $isFavorite');
    if(isFavorite){
      await _appCruds.delete(widget.image);
    }
    else{
      await _appCruds.insert(widget.image);
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  moreButton(){}
}