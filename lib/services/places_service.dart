import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carparkley/models/place_search.dart';

class PlacesService {
  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    final apiKey = 'AIzaSyAsB0nIzUB1-1bZJ6uYmSlcjElJWC4BNtg';
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=geocode&key=$apiKey';
    var response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }
}
