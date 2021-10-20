import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/main.dart';
import 'package:wallpaper/pages/home/home-setwallpaper.dart';
import 'package:wallpaper/shared/custom-widgets/custom-alert.dart';

class SetProcessBloc extends Bloc<SetProcess, Widget> {
  SetProcessBloc() : super(Container());

  Setwallpaper _setwallpaper = Setwallpaper();

  @override
  Stream<Widget> mapEventToState(event) async* {
    Navigator.pop(navigatorKey.currentContext!);
    if (event is MainScreen) {
      yield CircularProgressIndicator();
      var isOut = await _setwallpaper.setHomeScreen(event.url);
      openAlert(isOut, 'Anasayfa');
      yield Container();
    } else if (event is LockScreen) {
      yield CircularProgressIndicator();
      var isOut = await _setwallpaper.setLockScreen(event.url);
      openAlert(isOut, 'Kilit Ekranı');
      yield Container();
    } else if (event is BothScreen) {
      yield CircularProgressIndicator();
      var isOut = await _setwallpaper.setBothScreen(event.url);
      openAlert(isOut, 'İki ekran');
      yield Container();
    }
  }

  openAlert(bool isOut, String page){
    if(isOut){
        customAlert('$page Ayarlandı', 'Wallpaper');
      }
      else{
        customAlert('Ayarlanırken hata !!!', 'Wallpaper');
      }
  }
}

abstract class SetProcess {}

class MainScreen extends SetProcess {
  String url;
  MainScreen({required this.url});
}

class LockScreen extends SetProcess {
  String url;
  LockScreen({required this.url});
}

class BothScreen extends SetProcess {
  String url;
  BothScreen({required this.url});
}
