import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:wallpaper/pages/home/home-models.dart';
import 'package:wallpaper/shared/database/database-service.dart';

class FavoriteManager extends Bloc<FavoriteEvent, List<Images>>{
  FavoriteManager() : super([]);

  DatabaseService _databaseService = new DatabaseService();

  @override
  Stream<List<Images>> mapEventToState(event) async* {
    switch(event){
      case FavoriteEvent.GetFavorites:
        List<Images> images = await _databaseService.getFavoriteList();
        yield images.toList();
        break;
      default:
        break;
    }
  }

}

enum FavoriteEvent{
  SetFavorite,
  DeleteFavorite,
  GetFavorites,
  DeleteAll,
  IsFavorite
}