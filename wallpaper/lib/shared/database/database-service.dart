import 'package:wallpaper/pages/home/home-models.dart';
import 'package:wallpaper/shared/database/app-cruds.dart';

class DatabaseService{

  AppCruds _appCruds = AppCruds();

  Future getFavoriteList() async {
    return await _appCruds.getAllSortedByName();
  }

  Future insertFavorite(Images image) async {
    await _appCruds.insert(image);
    return getFavoriteList();
  }

  Future deleteFavorite(Images image) async {
    await _appCruds.delete(image);
    return getFavoriteList();
  }

  Future deleteAllFavorites() async {
    await _appCruds.deleteAll();
  }

  Future isFavorite(Images image) async {
    return await _appCruds.isFavorite(image);
  }


}