import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/shared/dynamicValues.dart';
import 'package:wallpaper/shared/javaController/setWallpaper.dart';

class SetProcessBloc extends Bloc<SetProcess, Widget> {
  SetProcessBloc() : super(Container());

  Setwallpaper _setwallpaper = Setwallpaper();
  var rand = Random();

  @override
  Stream<Widget> mapEventToState(event) async* {
    if (event is MainScreen) {
      yield CircularProgressIndicator();
      var isOut = await _setwallpaper.setHomeScreen(
          event.url,
          GetApi.urlVoice.length != 0
              ? GetApi.urlVoice[rand.nextInt(GetApi.urlVoice.length)]
              : null);
      print('işlem status: $isOut');
      yield Container();
    } else if (event is LockScreen) {
      yield CircularProgressIndicator();
      var isOut = await _setwallpaper.setLockScreen(
          event.url,
          GetApi.urlVoice.length != 0
              ? GetApi.urlVoice[rand.nextInt(GetApi.urlVoice.length)]
              : null);
      print('işlem status: $isOut');
      yield Container();
    } else if (event is BothScreen) {
      yield CircularProgressIndicator();
      var isOut = await _setwallpaper.setBothScreen(
          event.url,
          GetApi.urlVoice.length != 0
              ? GetApi.urlVoice[rand.nextInt(GetApi.urlVoice.length)]
              : null);
      print('işlem status: $isOut');
      yield Container();
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
