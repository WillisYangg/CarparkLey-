import 'package:carparkley/screens/error_screen.dart';
import 'package:carparkley/services/find_carparks.dart';
import 'package:carparkley/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'results_page.dart';
import 'package:carparkley/main.dart';
import 'results_page.dart';
import 'package:carparkley/services/get_carpark_info.dart';
import 'dart:math';
import 'dart:async';

class DestLoadingPage extends StatefulWidget {
  DestLoadingPage({this.destination});
  static String id = "dest_loading_screen";
  final destination;
  @override
  _DestLoadingPageState createState() => _DestLoadingPageState();
}

//async causes things to happen in the background!
//

//"??" in exception handling;null aware operator

class _DestLoadingPageState extends State<DestLoadingPage> {
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // timer = Timer.periodic(Duration(seconds: 5), (Timer t) => printRandomMsg());
    getCarparks(widget.destination);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  dynamic getCarparks(String destination) async {
    print('destination is $destination');
    Map carparklist = await GetCarparkInfo().carparkInformation(destination);
    if (carparklist.isEmpty) {
      Navigator.pushNamed(context, ErrorScreen.id);
    } else {
      // // return GetCarparkInfo().checkifSame(destination);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        print('carpark list before results screen: $carparklist');
        return ResultsPage(carparks: carparklist);
      }));
    }
  }

  Text printRandomMsg() {
    List<String> msg = [
      'Loading... Please wait',
      'Hey.. this is tough work you know!',
      'Just 1 min more... really!',
      '3...2...1'
    ];
    Random random = new Random();
    return Text(msg[random.nextInt(3)]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
              color: Colors.black,
              size: 100,
            ),
            printRandomMsg()
          ],
        ),
      ),
    );
  }
}
