import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/pages/home/home-models.dart';
import 'package:wallpaper/pages/home/widgets/fullscreen-image.dart';
import 'package:wallpaper/pages/home/widgets/only-full-image.dart';
import 'package:wallpaper/pages/home/widgets/set-process-bloc.dart';
import 'package:wallpaper/shared/custom-widgets/custom-ads.dart';
import 'package:wallpaper/shared/custom-widgets/custom-alert.dart';
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

  PageController controller=PageController(initialPage: 0, viewportFraction: 0.5);
  double value = 1;

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

    var h = MediaQuery.of(context).size.height-90;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller,
                    itemCount: 5,
                    itemBuilder: (context,i){
                      return AnimatedBuilder(
                        animation: controller,
                        builder:(context, widget) {
                          value = 1;
                          if(controller.position.haveDimensions){
                            value=controller.page!-i;
                            value=(1-(value.abs() * 0.3)).clamp(0.0, 1.0);
                          }
                          return Center(
                            child: SizedBox(
                              height: value*((h/2)),
                              child: widget,
                            ),
                          );
                        },
                        child: GestureDetector(
                          child: Hero(
                            tag: '${widget.image.id}$i',
                            child: Image.network(widget.image.orjImg)
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (_) => OnlyFullImage(image: widget.image, tag: '${widget.image.id}$i')
                            ));
                          },
                        ),
                      );
                    },
                  ),
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5, right: 1),
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(15)
                        )
                      ),
                      child: Icon(Icons.wallpaper, color: Colors.white,),
                    )
                  ),
                  onTap: () {
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
                                  _setProcessBloc.add(
                                      MainScreen(url: widget.image.orjImg));
                                },
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                child: optionMenu('Lock Screen', 850,
                                    widget.image.orjImg, _setProcessBloc),
                                onTap: () {
                                  _setProcessBloc.add(
                                      LockScreen(url: widget.image.orjImg));
                                },
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                child: optionMenu('Both Screen', 1050,
                                    widget.image.orjImg, _setProcessBloc),
                                onTap: () {
                                  _setProcessBloc.add(
                                      BothScreen(url: widget.image.orjImg));
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
                )
              ],
            ),
          ),
          Container(
            child: CustomAds()
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 12,
              itemBuilder: (_,i){
                return Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(widget.image.thumb),
                  )
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
            ),
          )
        ],
      ),
    );
  }

  favoriteButton() async {
    if (isFavorite) {
      await _appCruds.delete(widget.image);
      customAlert('Favorilerden çıkarıldı', 'Favori');
    } else {
      await _appCruds.insert(widget.image);
      customAlert('Favorilere Eklendi', 'Favori');
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
