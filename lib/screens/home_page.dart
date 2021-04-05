import 'package:carparkley/screens/login_register/login_page.dart';
import 'package:carparkley/main.dart';
import 'package:carparkley/screens/results_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_maps_webservice/places.dart';
import '../services/location.dart';
import '../constants.dart';
import '../services/find_carparks.dart';
import 'destination_loading_screen.dart';
import 'login_register/register_page.dart';

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
  //
  // getCurrentUser() async {
  //   User firebaseUser = _auth.currentUser!;
  //   await firebaseUser?.reload();
  //   firebaseUser = _auth.currentUser!;
  //   if (firebaseUser != null) {
  //     setState(() {
  //       this.loggedInUser = firebaseUser;
  //       this.isloggedin = true;
  //       print(firebaseUser.email);
  //       print(isloggedin);
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    this.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    String destinationName = '';

    void getLocation(userLocation) async {
      await userLocation.getCurrentLocation();
      print(userLocation.latitude);
      print(userLocation.longitude);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('CarparkLey?'),
        backgroundColor: Colors.red,
      ),
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
                    final Prediction? p = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: googleApiKey,
                        mode: Mode.overlay, // Mode.fullscreen
                        language: "en",
                        components: [new Component(Component.country, "sg")]);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DestLoadingPage(
                          destination: p?.description.toString());
                    }));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ElevatedButton(
                    child: Text(
                      'Search Carparks',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () => {
                          if (destinationName == '')
                            {print('Nothing was entered!')}
                        }),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 107.0),
                child: RaisedButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterPage.id);
                  },
                  child: Row(children: [
                    Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                    Text('Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ]),
                ),
              ),
              Card(
                //default card color is white
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 107.0),
                child: RaisedButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                  child: Row(children: [
                    Icon(
                      Icons.login,
                      color: Colors.white,
                    ),
                    Text('Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
