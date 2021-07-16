import 'package:flutter/material.dart';
import 'package:wallpaper/pages/home/home-models.dart';
import 'package:wallpaper/pages/home/widgets/animation-fab/action-button.dart';
import 'package:wallpaper/pages/home/widgets/animation-fab/fab-widget.dart';
import 'package:wallpaper/pages/home/widgets/animation-fab/options.dart';
import 'package:wallpaper/shared/custom-widgets/custom-slide-trans.dart';
import 'package:wallpaper/shared/database/app-cruds.dart';

class ExpandableFab extends StatefulWidget {
  bool isFavorite;
  Images image;
  ExpandableFab ({required this.isFavorite, required this.image});

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> {

  AppCruds _appCruds = AppCruds();

  @override
  Widget build(BuildContext context) {
    return FabWidget(
      distance: FabOptions().fabDistance,
      children: [
        ActionButton(
          onPressed: () => favoriteButton(),
          icon: Icon(widget.isFavorite ? Icons.favorite : Icons.favorite_border_outlined, size: FabOptions().fabIconSize),
        ),
        ActionButton(
          onPressed: () {
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
          icon: Icon(Icons.insert_photo, size: FabOptions().fabIconSize),
        ),
        ActionButton(
          onPressed: moreButton(),
          icon: Icon(Icons.more_horiz, size: FabOptions().fabIconSize),
        ),
      ],
    );
  }

  optionMenu(String text, int duration){
    return Container(
      child: CustomSlideTransition(text: '$text', duration: duration,),
    );
  }

  favoriteButton() async{
    print('isfavorite: ${widget.isFavorite}');
    if(widget.isFavorite){
      await _appCruds.delete(widget.image);
    }
    else{
      await _appCruds.insert(widget.image);
    }
    setState(() {
      widget.isFavorite = !widget.isFavorite;
    });
  }

  moreButton(){}
}
