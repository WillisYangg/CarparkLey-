import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class CoordinateConverter {
  Future<dynamic> convert(double lat, double long) async {
    http.Response response = await http.get(Uri.parse(
        'https://developers.onemap.sg/commonapi/convert/3414to4326?X=$lat&Y=$long'));
    String data = response.body;
    return jsonDecode(data);
  }
}
