import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/pages/home/home-models.dart';
import 'package:wallpaper/pages/home/home-setwallpaper.dart';
import 'package:wallpaper/pages/home/widgets/fullscreen-image.dart';
import 'package:wallpaper/pages/home/widgets/set-process-bloc.dart';
import 'package:wallpaper/shared/custom-widgets/custom-slide-trans.dart';
import 'package:wallpaper/shared/custom-widgets/custom-text.dart';
import 'package:wallpaper/shared/database/app-cruds.dart';

class FullscreenPage extends StatefulWidget {
  Images image;
  FullscreenPage({required this.image});

  @override
  _FullscreenPageState createState() => _FullscreenPageState();
}

class _FullscreenPageState extends State<FullscreenPage> {
  AppCruds _appCruds = AppCruds();
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFav();
  }

  Future isFav() async {
    print(widget.image.image);
    var a = await _appCruds.isFavorite(widget.image);
    setState(() {
      isFavorite = a != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final SetProcessBloc _setProcessBloc =
        BlocProvider.of<SetProcessBloc>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_outline,
              color: Colors.white,
            ),
            onPressed: () => favoriteButton(),
          ),
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () => moreMenu(context, widget.image),
          )
        ],
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: FullScreenImage(
              image: widget.image,
            ),
          ),
          BlocBuilder<SetProcessBloc, Widget>(
            builder: (context, widget) {
              return Center(child: widget);
            },
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 90,
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                Icons.insert_photo,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent.withOpacity(0.5),
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Container(
                        child: Column(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                child: optionMenu('Main Screen', 650,
                                    widget.image.orjImg, _setProcessBloc),
                                onTap: () {
                                  print('girdi');
                                  Navigator.pop(context);
                                  print('kapandı');
                                  _setProcessBloc.add(
                                      MainScreen(url: widget.image.orjImg));
                                  print('yapıldı');
                                },
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                child: optionMenu('Lock Screen', 850,
                                    widget.image.orjImg, _setProcessBloc),
                                onTap: () {
                                  print('girdi');
                                  Navigator.pop(context);
                                  print('kapandı');
                                  _setProcessBloc.add(
                                      LockScreen(url: widget.image.orjImg));
                                  print('yapıldı');
                                },
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                child: optionMenu('Both Screen', 1050,
                                    widget.image.orjImg, _setProcessBloc),
                                onTap: () {
                                  print('girdi');
                                  Navigator.pop(context);
                                  print('kapandı');
                                  _setProcessBloc.add(
                                      BothScreen(url: widget.image.orjImg));
                                  print('yapıldı');
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
            SizedBox(width: 20),
            IconButton(
              icon: Icon(Icons.download, color: Colors.white, size: 35),
              onPressed: null,
            )
          ],
        ),
      ),
    );
  }

  favoriteButton() async {
    if (isFavorite) {
      await _appCruds.delete(widget.image);
    } else {
      await _appCruds.insert(widget.image);
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  Widget optionMenu(
      String text, int duration, String url, SetProcessBloc process) {
    return CustomSlideTransition(
      text: '$text',
      duration: duration,
    );
  }

  moreMenu(BuildContext context, Images image) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent.withOpacity(0.5),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 3,
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: CustomText(
                text: image.id,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        });
  }
}
