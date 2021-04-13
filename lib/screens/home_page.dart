import 'package:carparkley/screens/login_register/login_page.dart';
import 'package:carparkley/main.dart';
import 'package:carparkley/screens/navigation_bar_screen.dart';
import 'package:carparkley/screens/results_page.dart';
import 'package:carparkley/screens/settings_screen.dart';
import 'file:///C:/Users/glenn/AndroidStudioProjects/CarparkLeyss-/lib/control/GoogleMapsMgr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_maps_webservice/places.dart';
import '../components/constants.dart';
import 'package:carparkley/control/CarparkMgr.dart';
import 'destination_loading_screen.dart';
import 'login_register/register_page.dart';
import 'settings_screen.dart';

class HomePage extends StatefulWidget {
  static String id = "home_screen";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User loggedInUser;
  bool isloggedin = false;

  void getCurrentUser() async {
    try {
      User firebaseUser = (await _auth.currentUser)!;
      if (firebaseUser != null) {
        this.loggedInUser = firebaseUser;
        this.isloggedin = true;
        print(firebaseUser.email);
        print(isloggedin);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    this.getCurrentUser();
    print(isloggedin);
  }

  dynamic vehicleType;
  Future<void> didVehicleTypeChange() async {
    final vehicle = await checkWhatChanged();
    setState(() {
      vehicleType = vehicle;
    });
  }

  @override
  Widget build(BuildContext context) {
    didVehicleTypeChange();
    String vehicle = vehicleType;
    String destinationName = '';
    void getLocation(userLocation) async {
      await userLocation.getCurrentLocation();
      print(userLocation.latitude);
      print(userLocation.longitude);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('CarparkLey?'),
        backgroundColor: Colors.red,
      ),
      drawer: Sidenav(isloggedin),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to CarparkLey?',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                  height: 20.0,
                  width: 300.0,
                  child: Divider(
                    color: Colors.red,
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: kTextfieldInputDecoration,
                  onTap: () async {
                    print('Vehicle type is: $vehicle');
                    final Prediction? p = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: googleApiKey,
                        mode: Mode.overlay, // Mode.fullscreen
                        language: "en",
                        components: [new Component(Component.country, "sg")]);
                    if (p?.description == null) {
                      AlertDialog();
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DestLoadingPage(
                            destination: p?.description.toString(),
                            vehicleType: vehicle);
                      }));
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ElevatedButton(
                    child: Text(
                      'Search Carparks',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => {
                          if (destinationName == '')
                            {print('Nothing was entered!')}
                        }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
