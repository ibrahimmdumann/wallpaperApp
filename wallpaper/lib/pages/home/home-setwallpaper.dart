import 'package:flutter/services.dart';

class Setwallpaper {
  static const platformMethodChannel =
      const MethodChannel('setWallpaperProcess');

  Future<bool> setHomeScreen(String url) async {
    return await platformMethodChannel
        .invokeMethod('setHomeWallpaper', {"url": url});
  }

  Future<bool> setLockScreen(String url) async {
    return await await platformMethodChannel
        .invokeMethod('setLockWallpaper', {"url": url});
  }

  Future<bool> setBothScreen(String url) async {
    return await await platformMethodChannel
        .invokeMethod('setBothWallpaper', {"url": url});
  }
}
