import 'package:dio/dio.dart';
import 'CarparkMgr.dart';

class GoogleMapsMgr {
  //Uses Google Distance Matrix API to calculate the distance from carpark to the destination of the user

  Future<dynamic> calculateDistance(String startPoint, String endPoint) async {
    var dio = Dio();
    var url = 'https://maps.googleapis.com/maps/api/distancematrix/json?';
    var parameters = {
      'key': googleApiKey,
      'origins': startPoint,
      'destinations': endPoint,
    };
    print('finding destination from: $startPoint to ' + endPoint);
    var response = await dio.get(url, data: parameters);
    print(response.data['rows'][0]['elements'][0]['distance']['text']);
    return response.data['rows'][0]['elements'][0]['distance']['text'];
  }
}
