import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4906974194293016/1750061521';
    } else if (Platform.isIOS) {
      return '';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-4906974194293016/3648756113";
    } else if (Platform.isIOS) {
      return "";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "";
    } else if (Platform.isIOS) {
      return "";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}

class GetApi {
  static String get url {
    return "https://idriscelebi.com/eviller_scorpion/";
  }

  static List<String> get urlVoice {
    return [
      "https://www.idriscelebi.com/eviller_scorpion/getoverhere.mp3",
      "https://www.idriscelebi.com/eviller_scorpion/come2.mp3"
    ];
  }
}
