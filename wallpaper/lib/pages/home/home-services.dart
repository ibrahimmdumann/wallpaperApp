import 'package:http/http.dart' as http;
import 'package:wallpaper/shared/database/database-service.dart';
import 'home-models.dart';

class ImagesServices{

  DatabaseService _databaseService = new DatabaseService();

  Future getImages() async {
    var baseUrl = Uri.parse('http://idriscelebi.com/eviller_scorpion/api.php?home');

    var response = await http.get(baseUrl);

    var a = materialWallpaperFromJson(response.body);

    a.materialWallpaper.forEach((element) async {
      element.isFav = await _databaseService.isFavorite(element);
    });

    return a;

  }

}