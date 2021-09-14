import 'package:http/http.dart' as http;
import 'package:wallpaper/shared/dynamicValues.dart';
import 'home-models.dart';

class ImagesServices {
  Future getImages() async {
    var baseUrl = Uri.parse(GetApi.url + 'api.php?home');

    var response = await http.get(baseUrl);

    return materialWallpaperFromJson(response.body);
  }
}
