import 'package:flutter/services.dart';

class Setwallpaper {
  static const platformMethodChannel =
      const MethodChannel('setWallpaperProcess');

  Future<bool> setHomeScreen(String url, String? urlVoice) async {
    print(urlVoice);
    return await platformMethodChannel
        .invokeMethod('setHomeWallpaper', {"url": url, "urlVoice": urlVoice});
  }

  Future<bool> setLockScreen(String url, String? urlVoice) async {
    return await await platformMethodChannel
        .invokeMethod('setLockWallpaper', {"url": url, "urlVoice": urlVoice});
  }

  Future<bool> setBothScreen(String url, String? urlVoice) async {
    return await await platformMethodChannel
        .invokeMethod('setBothWallpaper', {"url": url, "urlVoice": urlVoice});
  }
}
