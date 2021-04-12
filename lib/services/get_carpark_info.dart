import 'package:flutter/material.dart';
import 'package:carparkley/screens/destination_loading_screen.dart';
import 'package:carparkley/services/find_carparks.dart';
import 'package:carparkley/screens/results_page.dart';
import 'networking.dart';
import 'dart:convert';
import 'location.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'coordinate_converter.dart';
import 'package:carparkley/services/get_carpark_rates_details.dart';
import 'get_distance.dart';

const uraAccessKey = '62f968e9-3534-4c1c-9250-44e04671037c';

class GetCarparkInfo {
  Future<String> getDailyToken() async {
    final response = await http.get(
        Uri.https('www.ura.gov.sg', '/uraDataService/insertNewToken.action'),
        headers: {'AccessKey': uraAccessKey});

    final responseJson = jsonDecode(response.body);
    final token = responseJson['Result'];

    return token;
  }

  Future<dynamic> carparkInformation(
      String destination, String vehicleType) async {
    // var dio = Dio();
    // var url = 'www.ura.gov.sg/uraDataService/invokeUraDS';
    // var parameters = {
    //   'AccessKey': uraAccessKey,
    //   'Token': await getDailyToken(),
    // };
    // var response = await dio.get(url, data: parameters);
    // return response.data['Result']
    //     .map<String>((result) => result['geometries'].toString())
    //     .toList();

    final response = await http.get(
      Uri.https(
        'www.ura.gov.sg',
        '/uraDataService/invokeUraDS',
        {'service': 'Car_Park_Availability'},
      ),
      headers: {
        'AccessKey': uraAccessKey,
        'Token': await getDailyToken(),
      },
    );

    final responseJson = jsonDecode(response.body);

    // return responseJson(response.body)['Result']
    //     .map<String>((result) => result['geometries']['coordinates'].toString())
    //     .toList();

    // var dio = Dio();
    // var url = 'www.ura.gov.sg/uraDataService/invokeUraDS';
    // var parameters = {
    //   'AccessKey': uraAccessKey,
    //   'Token': await getDailyToken(),
    // };
    // var response = await dio.get(url, data: parameters);
    // For testing the accessing of API
    print(responseJson);
    Map<String, List<String>> map = Map();
    map = {};
    for (var i = 0; i < responseJson['Result'].length; i++) {
      var coordinates =
          responseJson['Result'][i]['geometries'][0]['coordinates'];
      print('this is $i th loop');
      print('coordinates = $coordinates');
      var latitude = coordinates.substring(0, 8);
      var longitude = coordinates.substring(11, 19);
      latitude = double.parse(latitude);
      longitude = double.parse(longitude);
      print('old latitude is $latitude');
      print('old longitude is $longitude');
      try {
        final newCoordinates =
            await CoordinateConverter().convert(latitude, longitude);
        print('newCoordinates is $newCoordinates');
        print('new coord = $newCoordinates');
        var convertedLat = newCoordinates['latitude'];
        var convertedLong = newCoordinates['longitude'];
        print('converted Lat = $convertedLat');
        print('converted Long = $convertedLong');
        convertedLat = convertedLat.toString();
        convertedLong = convertedLong.toString();
        var roundedLat = convertedLat.substring(0, 5);
        var roundedLong = convertedLong.substring(0, 7);
        print('rounded Lat = $roundedLat');
        print('rounded Long = $roundedLong');
        print('destination is $destination');
        var carparks = await FindCarpark().searchNearby(destination);
        print(carparks);
        for (int x = 0; x < carparks.length; x++) {
          print('this is $x th loop');
          var googleLat = carparks[x]['geometry']['location']['lat'];
          var googleLong = carparks[x]['geometry']['location']['lng'];
          googleLat = googleLat.toString();
          googleLong = googleLong.toString();
          print('google lat is $googleLat');
          print('google long is $googleLong');
          var roundedgoogleLat = googleLat.substring(0, 5);
          var roundedgoogleLong = googleLong.substring(0, 7);
          print('rounded google lat is $roundedgoogleLat');
          print('rounded google long is $roundedgoogleLong');
          if (roundedgoogleLat == roundedLat &&
              roundedgoogleLong == roundedLong) {
            print('match found!');
            // String cpAddress = carparks[x]['formatted_address'];
            // print(cpAddress);
            String cpNumber = responseJson['Result'][i]['carparkNo'];
            print("CP number is $cpNumber");
            String cpName = carparks[x]['name'];
            String cpAddress = carparks[x]['formatted_address'];
            print(cpName);
            cpName = cpName + ' ' + cpNumber;
            String lotsAvail = responseJson['Result'][i]['lotsAvailable'];
            print('Lots Available: $lotsAvail');
            if (vehicleType == 'C' &&
                (responseJson['Result'][i]['lotType'] == vehicleType ||
                    responseJson['Result'][i]['lotType'] == 'Car' ||
                    responseJson['Result'][i]['lotType'] == 'car')) {
              String lotType = vehicleType;
              print('Lot type: $lotType');
              var distance =
                  await GetDistance().getDistance(cpAddress, destination);
              distance = distance.toString();
              print('distance is: $distance');
              List<String> lotInfo = [cpAddress, lotsAvail, lotType, distance];
              print('lotInfo list currently: $lotInfo');
              map[cpName] = lotInfo;
              print('map is currently: $map');
            }
            if (vehicleType == 'M' &&
                (responseJson['Result'][i]['lotType'] == vehicleType ||
                    responseJson['Result'][i]['lotType'] == 'Motorcycle' ||
                    responseJson['Result'][i]['lotType'] == 'motorcycle')) {
              String lotType = vehicleType;
              print('Lot type: $lotType');
              var distance =
                  await GetDistance().getDistance(cpAddress, destination);
              distance = distance.toString();
              print('distance is: $distance');
              List<String> lotInfo = [cpAddress, lotsAvail, lotType, distance];
              print('lotInfo list currently: $lotInfo');
              map[cpName] = lotInfo;
              print('map is currently: $map');
            }
            if (vehicleType == 'H' &&
                (responseJson['Result'][i]['lotType'] == vehicleType ||
                    responseJson['Result'][i]['lotType'] == 'Heavy Vehicle' ||
                    responseJson['Result'][i]['lotType'] == 'Heavy vehicle')) {
              String lotType = vehicleType;
              print('Lot type: $lotType');
              var distance =
                  await GetDistance().getDistance(cpAddress, destination);
              distance = distance.toString();
              print('distance is: $distance');
              List<String> lotInfo = [cpAddress, lotsAvail, lotType, distance];
              print('lotInfo list currently: $lotInfo');
              map[cpName] = lotInfo;
              print('map is currently: $map');
            }
          } else {
            print('LotType is not $vehicleType, rejected; not added to map');
          }
          // var googlelat = carparks[x].toString().substring(6, 14);
          // print('google lat is $googlelat');
          // var googlelong = carparks[x].toString().substring(22, 31);
          // print('google long is $googlelong');
          // if (googlelat.compareTo(newLat) == 0 &&
          //     googlelong.compareTo(newLong) == 0) {
          //   print('match found!');
          //   print('lat is $googlelat');
          //   print('long is $googlelong');
          // }
        }
      } catch (e) {
        print(e);
        continue;
      }
    }
    print('final map is $map');
    return map;
    // Currently returns probably the entire Sg's carpark or some shit
    // return response.data;
  }

// void checkifSame(String destination) async {
//   var uraLatlong = await carparkInformation();
//   var carparklist = await FindCarpark().searchNearby(destination);
//   var coord = uraLatlong;
//   print('this is ura: $coord');
//   for (String sName in carparklist) {
//     print(sName);
//   }
// }
}
