import 'package:carparkley/services/find_carparks.dart';
import 'package:carparkley/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'results_page.dart';
import 'package:carparkley/main.dart';
import 'results_page.dart';

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
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getCarparks(widget.destination);
  }

  void getCarparks(String destination) async {
    var carparklist = await FindCarpark().searchNearby(destination);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ResultsPage(carparks: carparklist);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black,
          size: 100,
        ),
      ),
    );
  }
}
