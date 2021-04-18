import 'package:carparkley/control/CarparkMgr.dart';
import 'package:carparkley/screens/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'results_page.dart';
import 'dart:math';

class DestLoadingPage extends StatefulWidget {
  DestLoadingPage({this.destination, this.vehicleType});
  static String id = "dest_loading_screen";
  final destination;
  final vehicleType;
  @override
  _DestLoadingPageState createState() => _DestLoadingPageState();
}

//async causes things to happen in the background!
//

//"??" in exception handling;null aware operator

class _DestLoadingPageState extends State<DestLoadingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // timer = Timer.periodic(Duration(seconds: 5), (Timer t) => printRandomMsg());
    getCarparks(widget.destination, widget.vehicleType);
  }

  @override
  void dispose() {
    super.dispose();
  }

  dynamic getCarparks(String destination, String vehicleType) async {
    print('destination is: $destination');
    print('Vehicle type is: $vehicleType');
    Map carparklist =
        await CarparkMgr().locateCarparks(destination, vehicleType);
    if (carparklist.isEmpty) {
      Navigator.pushNamed(context, ErrorScreen.id);
    } else {
      // // return GetCarparkInfo().checkifSame(destination);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        print('carpark list before results screen: $carparklist');
        return ResultsPage(carparks: carparklist, lotType: vehicleType);
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
