import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:wallpaper/pages/home/home-models.dart';
import 'package:wallpaper/shared/database/database-service.dart';

class FavoriteManager extends Cubit<List<Images>>{
  FavoriteManager() : super([]);
  DatabaseService _databaseService = new DatabaseService();

  void getFavorites() async => emit(await _getFavoriteList());

  _getFavoriteList() async {
    List<Images> images = [];
    images = await _databaseService.getFavoriteList();
    return images.toList();
  }
}