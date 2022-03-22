import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:wallpaper/pages/home/home-services.dart';
import 'home-models.dart';

class HomeManager extends Bloc<Event, States>{
  HomeManager() : super(States.Loading) {
    on<Event>((event, emit) async {
      switch (event) {
        case Event.GetImages:
          emit(States.Loading);
          materialWallpaper = await _imagesServices.getImages();
          if(materialWallpaper.materialWallpaper.length>0){
            emit(States.Loaded);
          }
          else{
            emit(States.Error);
          }
          break;
        default:
      }
    });
  }

  ImagesServices _imagesServices = new ImagesServices();
  late MaterialWallpaper materialWallpaper;

}

enum Event{
  GetImages
}

enum States{
  Loading,
  Loaded,
  Error
}