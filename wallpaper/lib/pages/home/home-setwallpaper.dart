import 'package:flutter/services.dart';

class Setwallpaper {
  static const platformMethodChannel =
      const MethodChannel('heartbeat.fritz.ai/native');
  String nativeMessage = '';
  static Future<Null> sethomescreen(String imageUrl) async {
    print("girdin aslında");
    String _message;

    try {
      final String result =
          await platformMethodChannel.invokeMethod('sethomeWallpaper', {
        "url": imageUrl,
      });
      _message = result;
    } on PlatformException catch (e) {
      _message = "Can't do native stuff ${e.message}.";
    }
  }

  Future<Null> setlockscreen(String url) async {
    String _message;
    try {
      final String result =
          await platformMethodChannel.invokeMethod('setlockWallpaper');
      _message = result;
    } on PlatformException catch (e) {
      _message = "Can't do native stuff ${e.message}.";
    }

    nativeMessage = _message;
  }
}
