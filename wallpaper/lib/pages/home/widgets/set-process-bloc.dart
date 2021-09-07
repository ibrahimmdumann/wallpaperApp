import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/pages/home/home-setwallpaper.dart';

class SetProcessBloc extends Bloc<SetProcess, Widget> {
  SetProcessBloc() : super(Container());

  Setwallpaper _setwallpaper = Setwallpaper();

  @override
  Stream<Widget> mapEventToState(event) async* {
    if (event is MainScreen) {
      print('ciculas dön');
      yield CircularProgressIndicator();
      print('işlem yap');
      var isOut = await _setwallpaper.setHomeScreen(event.url);
      print('işlem status: $isOut');
      yield Container();
    } else if (event is LockScreen) {
      yield CircularProgressIndicator();
      var isOut = await _setwallpaper.setLockScreen(event.url);
      print('işlem status: $isOut');
      yield Container();
    } else if (event is BothScreen) {
      yield CircularProgressIndicator();
      var isOut = await _setwallpaper.setBothScreen(event.url);
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
