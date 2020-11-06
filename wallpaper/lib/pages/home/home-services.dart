import 'package:http/http.dart' as http;
import 'home-models.dart';

class ImagesServices{

  Future getImages() async {
    const baseUrl = 'https://jsonplaceholder.typicode.com/photos';

    var response = await http.get(baseUrl);

    return imagesFromJson(response.body);

  }

}