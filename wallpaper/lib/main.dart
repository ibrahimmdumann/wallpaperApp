import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wallpaper/pages/before-starting.dart';
import 'package:wallpaper/pages/favorite/favorite-manager.dart';
import 'package:wallpaper/pages/home/home-manager.dart';
import 'package:wallpaper/pages/home/widgets/set-process-bloc.dart';
import 'package:wallpaper/pages/route-bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeManager()),
        BlocProvider(create: (context) => RouteBloc()),
        BlocProvider(create: (context) => FavoriteManager()),
         BlocProvider(create: (context) => SetProcessBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WallpaperApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BeforeStarting(),
        navigatorKey: navigatorKey,
      ),
    );
  }
}
