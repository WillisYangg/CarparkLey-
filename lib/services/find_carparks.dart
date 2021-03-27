import 'networking.dart';
import 'dart:convert';
import 'location.dart';
import 'package:dio/dio.dart';

const apiKey = 'AIzaSyCx8dZkszicSqdq1w2JyFIRYImX-5Pob9A';

class FindCarpark {
  Future<dynamic> carparkInformation() async {
    var dio = Dio();
    var url =
        'https://www.ura.gov.sg/uraDataService/invokeUraDS?service=Car_Park_Availability';
    var parameters = {
      'AccessKey': '62f968e9-3534-4c1c-9250-44e04671037c',
      'Token':
          'WMc-yhdmcBKk0wuSH6R4zsK61YP0K3GnW-B@7af732Zf3xa7F8 9 zXD+29GNec785k4PAnJf6H1cg29s84r9H48e898pgQFYeCc',
    };
    var response = await dio.get(url, data: parameters);
    return response.data;
  }

  Future<List<String>> searchNearby(String keyword) async {
    String constant = 'car park near';
    var dio = Dio();
    var url = 'https://maps.googleapis.com/maps/api/place/textsearch/json';
    var parameters = {
      'key': apiKey,
      'query': constant + keyword,
      'radius': '4000',
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
