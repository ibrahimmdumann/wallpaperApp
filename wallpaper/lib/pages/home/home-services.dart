import 'package:http/http.dart' as http;
import 'home-models.dart';

class ImagesServices{

  Future getImages() async {
    var baseUrl = Uri.parse('http://idriscelebi.com/eviller_scorpion/api.php?home');

    var response = await http.get(baseUrl);

    return materialWallpaperFromJson(response.body);

  }

}