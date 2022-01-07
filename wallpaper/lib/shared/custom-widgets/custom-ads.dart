import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CustomAds extends StatefulWidget {
  const CustomAds({ Key? key }) : super(key: key);

  @override
  _CustomAdsState createState() => _CustomAdsState();
}

class _CustomAdsState extends State<CustomAds> {

  late BannerAd myBanner;

  @override
  void initState() {
    super.initState();
    myBanner = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.fullBanner,
      request: AdRequest(),
      listener: BannerAdListener()
    );
    myBanner.load();
  }

  @override
  void dispose() {
    super.dispose();
    myBanner.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left:5, right: 5),
      alignment: Alignment.center,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: AdWidget(ad: myBanner),
      )
    );
  }
}