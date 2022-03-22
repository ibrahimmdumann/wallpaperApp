import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/main.dart';
import 'package:wallpaper/pages/home/home-setwallpaper.dart';
import 'package:wallpaper/shared/custom-widgets/custom-alert.dart';

class SetProcessBloc extends Bloc<SetProcess, Widget> {
  SetProcessBloc() : super(Container()) {
    on<SetProcess>((event, emit) async {
      Navigator.pop(navigatorKey.currentContext!);
      switch (event.event) {
        case ProcessEnum.MainScreen:
          emit(CircularProgressIndicator());
          var isOut = await _setwallpaper.setHomeScreen(event.value);
          openAlert(isOut, 'Anasayfa');
          emit(Container());
          break;
        case ProcessEnum.LockScreen:
          emit(CircularProgressIndicator());
          var isOut = await _setwallpaper.setLockScreen(event.value);
          openAlert(isOut, 'Kilit Ekranı');
          emit(Container());
          break;
        case ProcessEnum.BothScreen:
          emit(CircularProgressIndicator());
          var isOut = await _setwallpaper.setBothScreen(event.value);
          openAlert(isOut, 'İki ekran');
          emit(Container());
          break;
        default:
      }
    });
  }

  Setwallpaper _setwallpaper = Setwallpaper();

  openAlert(bool isOut, String page){
    if(isOut){
        customAlert('$page Ayarlandı', 'Wallpaper');
      }
      else{
        customAlert('Ayarlanırken hata !!!', 'Wallpaper');
      }
  }
}

class SetProcess {
  ProcessEnum event;
  dynamic value;
  SetProcess._internal({required this.event, this.value});

  static setEvent(ProcessEnum event, dynamic value) => SetProcess._internal(event: event, value: value);
}

enum ProcessEnum { MainScreen, LockScreen, BothScreen }