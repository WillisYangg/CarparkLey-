import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'find_carparks.dart';

class GetDistance {
  Future<dynamic> getDistance(String startPoint, String endPoint) async {
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
