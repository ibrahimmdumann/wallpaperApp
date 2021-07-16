import 'package:sembast/sembast.dart';
import 'package:wallpaper/pages/home/home-models.dart';
import 'package:wallpaper/shared/database/app_database.dart';

class AppCruds {
  static const String FAVORITE_STORE_NAME = 'favorites';

  final _favoriteStore = intMapStoreFactory.store(FAVORITE_STORE_NAME);

  Future get _db async => await AppDatabase.instance.openDatabase;

  Future insert(Images image) async {
    print('insert');
    await _favoriteStore.add(await _db, image.toJson());
  }

  Future isFavorite(Images image) async{
    var finder = Finder(filter: Filter.matches('id', image.id));
    return await _favoriteStore.findFirst(await _db, finder: finder);
  }

  Future delete(Images image) async {
    print('delete');
    final finder = Finder(filter: Filter.byKey(image.id));
    await _favoriteStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future getAllSortedByName() async {
    final finder = Finder(sortOrders: [
      SortOrder('id'),
    ]);

    final recordSnapshots = await _favoriteStore.find(
      await _db,
      finder: finder,
    );

    return recordSnapshots.map((snapshot) {
      print(snapshot);
      final favorites = Images.fromJson(snapshot.value);
      favorites.id = snapshot.key.toString();
      return favorites;
    }).toList();
  }

  Future deleteAll()async{
    await _favoriteStore.delete(await _db);
  }

}
