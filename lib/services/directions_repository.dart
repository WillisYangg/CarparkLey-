import 'package:carparkley/models/directions_model.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';
  final apiKey = 'AIzaSyDsVuw5OWdre9kzI7iJ5k5nj_hXvsOp2GQ';
  final Dio _dio;
  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<dynamic> getDirections(
      {required LatLng origin, required LatLng destination}) async {
    final response = await _dio.get(
      _baseUrl,
      data: {
        'origin': '${origin.latitude}, ${origin.longitude}',
        'destination': '${destination.latitude}, ${destination.longitude}',
        'key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
  }
}
