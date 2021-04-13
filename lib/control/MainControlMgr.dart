import 'package:flutter/material.dart';
import 'package:carparkley/screens/destination_loading_screen.dart';
import 'package:carparkley/screens/results_page.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../services/coordinate_converter.dart';
import 'CarparkMgr.dart';

const uraAccessKey = '62f968e9-3534-4c1c-9250-44e04671037c';

class MainControlMgr {
  Future<dynamic> getCarpark_info(String cpName, String lotType) async {
    final response = await http.get(
      Uri.https(
        'www.ura.gov.sg',
        '/uraDataService/invokeUraDS',
        {'service': 'Car_Park_Details'},
      ),
      headers: {
        'AccessKey': uraAccessKey,
        'Token': await CarparkMgr().getDailyToken()
      },
    );

    final responseJson = jsonDecode(response.body);
    print('this is the api result: $responseJson');
    for (int i = 0; i < responseJson['Result'].length; i++) {
      print('this is the $i th loop');
      var cpNum = responseJson['Result'][i]['ppCode'].toString();
      print('cpNameList is $cpName');
      print('cpNum is $cpNum');
      if (cpName.toString().contains(cpNum)) {
        if (lotType == 'C' &&
            (responseJson['Result'][i]['vehCat'].toString() == lotType ||
                responseJson['Result'][i]['vehCat'].toString() == 'Car' ||
                responseJson['Result'][i]['vehCat'].toString() == 'car')) {
          print('Carpark found');
          String weekdayMin =
              responseJson['Result'][i]['weekdayMin'].toString();
          String weekdayRate =
              responseJson['Result'][i]['weekdayRate'].toString();
          String parkingSystem =
              responseJson['Result'][i]['parkingSystem'].toString();
          String satdayMin = responseJson['Result'][i]['satdayMin'].toString();
          String satdayRate =
              responseJson['Result'][i]['satdayRate'].toString();
          String sunPHMin = responseJson['Result'][i]['sunPHMin'].toString();
          String sunPHRate = responseJson['Result'][i]['sunPHRate'].toString();
          String startTime = responseJson['Result'][i]['startTime'].toString();
          String endTime = responseJson['Result'][i]['endTime'].toString();
          String parkCapacity =
              responseJson['Result'][i]['parkCapacity'].toString();
          List<String> cpRatesDetails = [];
          cpRatesDetails.add(weekdayMin);
          cpRatesDetails.add(weekdayRate);
          cpRatesDetails.add(parkingSystem);
          cpRatesDetails.add(satdayMin);
          cpRatesDetails.add(satdayRate);
          cpRatesDetails.add(sunPHMin);
          cpRatesDetails.add(sunPHRate);
          cpRatesDetails.add(startTime);
          cpRatesDetails.add(endTime);
          cpRatesDetails.add(parkCapacity);
          print("cpRatesDetails is: $cpRatesDetails");
          return cpRatesDetails;
        }
        if (lotType == 'M' &&
            (responseJson['Result'][i]['vehCat'].toString() == lotType ||
                responseJson['Result'][i]['vehCat'].toString() ==
                    'Motorcycle' ||
                responseJson['Result'][i]['vehCat'].toString() ==
                    'motorcycle')) {
          print('Carpark found');
          String weekdayMin =
              responseJson['Result'][i]['weekdayMin'].toString();
          String weekdayRate =
              responseJson['Result'][i]['weekdayRate'].toString();
          String parkingSystem =
              responseJson['Result'][i]['parkingSystem'].toString();
          String satdayMin = responseJson['Result'][i]['satdayMin'].toString();
          String satdayRate =
              responseJson['Result'][i]['satdayRate'].toString();
          String sunPHMin = responseJson['Result'][i]['sunPHMin'].toString();
          String sunPHRate = responseJson['Result'][i]['sunPHRate'].toString();
          String startTime = responseJson['Result'][i]['startTime'].toString();
          String endTime = responseJson['Result'][i]['endTime'].toString();
          String parkCapacity =
              responseJson['Result'][i]['parkCapacity'].toString();
          List<String> cpRatesDetails = [];
          cpRatesDetails.add(weekdayMin);
          cpRatesDetails.add(weekdayRate);
          cpRatesDetails.add(parkingSystem);
          cpRatesDetails.add(satdayMin);
          cpRatesDetails.add(satdayRate);
          cpRatesDetails.add(sunPHMin);
          cpRatesDetails.add(sunPHRate);
          cpRatesDetails.add(startTime);
          cpRatesDetails.add(endTime);
          cpRatesDetails.add(parkCapacity);
          print("cpRatesDetails is: $cpRatesDetails");
          return cpRatesDetails;
        }
        if (lotType == 'H' &&
            (responseJson['Result'][i]['vehCat'].toString() == lotType ||
                responseJson['Result'][i]['vehCat'].toString() ==
                    'Heavy Vehicle' ||
                responseJson['Result'][i]['vehCat'].toString() ==
                    'Heavy vehicle')) {
          print('Carpark found');
          String weekdayMin =
              responseJson['Result'][i]['weekdayMin'].toString();
          String weekdayRate =
              responseJson['Result'][i]['weekdayRate'].toString();
          String parkingSystem =
              responseJson['Result'][i]['parkingSystem'].toString();
          String satdayMin = responseJson['Result'][i]['satdayMin'].toString();
          String satdayRate =
              responseJson['Result'][i]['satdayRate'].toString();
          String sunPHMin = responseJson['Result'][i]['sunPHMin'].toString();
          String sunPHRate = responseJson['Result'][i]['sunPHRate'].toString();
          String startTime = responseJson['Result'][i]['startTime'].toString();
          String endTime = responseJson['Result'][i]['endTime'].toString();
          String parkCapacity =
              responseJson['Result'][i]['parkCapacity'].toString();
          List<String> cpRatesDetails = [];
          cpRatesDetails.add(weekdayMin);
          cpRatesDetails.add(weekdayRate);
          cpRatesDetails.add(parkingSystem);
          cpRatesDetails.add(satdayMin);
          cpRatesDetails.add(satdayRate);
          cpRatesDetails.add(sunPHMin);
          cpRatesDetails.add(sunPHRate);
          cpRatesDetails.add(startTime);
          cpRatesDetails.add(endTime);
          cpRatesDetails.add(parkCapacity);
          print("cpRatesDetails is: $cpRatesDetails");
          return cpRatesDetails;
        }
      }
    }
    print('Oops something went wrong somewhere');
  }
}
