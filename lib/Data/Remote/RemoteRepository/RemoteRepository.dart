import 'package:albumapp/Data/Local/DB/DB.dart';
import 'package:http/http.dart' as http;

class RemoteRepository {
  Future<bool> getAlbums() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
      await DB.instance.setAlbums(response.body);
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  Future<bool> getPhotos() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
      await DB.instance.setPhotos(response.body);
      return true;
    } on Exception catch (e) {
      return false;
    }
  }
}
