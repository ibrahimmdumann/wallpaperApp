import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:wallpaper/pages/home/home-services.dart';
import 'home-models.dart';

class HomeManager extends Bloc<Event, States>{
  HomeManager() : super(States.Loading);

  ImagesServices _imagesServices = new ImagesServices();
  late MaterialWallpaper materialWallpaper;

  @override
  Stream<States> mapEventToState(event) async* {
    switch(event){
      case Event.GetImages:
        yield States.Loading;
        materialWallpaper = await _imagesServices.getImages();
        if(materialWallpaper.materialWallpaper.length>0){
          yield States.Loaded;
        }
        else{
          yield States.Error;
        }
        break;
    }
  }

}

enum Event{
  GetImages
}

enum States{
  Loading,
  Loaded,
  Error
}