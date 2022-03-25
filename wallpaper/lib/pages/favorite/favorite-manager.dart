import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:wallpaper/pages/home/home-models.dart';
import 'package:wallpaper/shared/database/database-service.dart';

class FavoriteManager extends Cubit<List<Images>>{
  FavoriteManager() : super([]);
  DatabaseService _databaseService = new DatabaseService();

  void getFavorites() async => emit(await _getFavoriteList());
  void setFavorite(Images image) async => emit(await _setFavorite(image));
  void deleteFavoriteAll() async => emit(await _deleteFavoriteAll());

  _getFavoriteList() async {
    List<Images> images = [];
    images = await _databaseService.getFavoriteList();
    return images.toList();
  }

  _isFavorite(Images image) async {
    return await _databaseService.isFavorite(image);
  }

  _setFavorite(Images image) async {
    if (await _isFavorite(image)) {
      await _databaseService.deleteFavorite(image);
    } else {
      await _databaseService.insertFavorite(image);
    }
    return _getFavoriteList();
  }

  _deleteFavoriteAll() async {
    await _databaseService.deleteAllFavorites();
    return await _getFavoriteList();
  }
}