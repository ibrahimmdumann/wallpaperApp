import 'package:flutter/services.dart';

class Setwallpaper {
  static const platformMethodChannel = const MethodChannel('setWallpaperProcess');

  Future<bool> sethomescreen(String url) async {
    return await platformMethodChannel.invokeMethod('sethomeWallpaper', {"url": url});
  }

  Future<bool> setlockscreen(String url) async {
    return await await platformMethodChannel.invokeMethod('setlockWallpaper', {"url": url});
  }
}
