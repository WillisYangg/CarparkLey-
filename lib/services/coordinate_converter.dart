import 'dart:convert';
import 'package:http/http.dart' as http;

class CoordinateConverter {
  //this method is needed because the carpark coordinates(latitude and longitude) in URA dataset is in svy21
  //format, while google uses wgs84 coordinate system

  Future<dynamic> convert(double lat, double long) async {
    http.Response response = await http.get(Uri.parse(
        'https://developers.onemap.sg/commonapi/convert/3414to4326?X=$lat&Y=$long'));
    String data = response.body;
    return jsonDecode(data);
  }
}
