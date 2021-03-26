import 'networking.dart';
import 'dart:convert';
import 'location.dart';
import 'package:dio/dio.dart';

const apiKey = 'AIzaSyCx8dZkszicSqdq1w2JyFIRYImX-5Pob9A';

class FindCarpark {
  Future<List<String>> searchNearby(
      String keyword, double latitude, double longitude) async {
    var dio = Dio();
    var url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json';
    var parameters = {
      'key': apiKey,
      'location': '$latitude, $longitude',
      'radius': '5000',
      'keyword': keyword,
    };
    var response = await dio.get(url, data: parameters);

    return response.data['results']
        .map<String>((result) => result['name'].toString())
        .toList();
  }

  // Future<dynamic> getCarparks(
  //     String destination, double latitude, double longitude) async {
  //   {
  //     var url =
  //         'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=5000&type=restaurant&keyword=$destination&key=$apiKey';
  //     NetworkHelper networkHelper = NetworkHelper(url);
  //     var carparks = await networkHelper.getData();
  //     return carparks;
  //   }
  // }
}
