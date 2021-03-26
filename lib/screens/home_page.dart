import 'package:carparkley/screens/login_register/login_page.dart';
import 'package:carparkley/screens/login_register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../services/location.dart';
import '../constants.dart';
import '../services/find_carparks.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  static String id = "home_screen";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String destinationName = '';

    void getLocation(userLocation) async {
      await userLocation.getCurrentLocation();
      print(userLocation.latitude);
      print(userLocation.longitude);
    }

    Location userLocation = Location();
    getLocation(userLocation);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('CarparkLey?'),
        backgroundColor: Colors.red,
      ),
      body: Center(
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
                onChanged: (value) {
                  destinationName = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: ElevatedButton(
                  onPressed: () async => print(await FindCarpark().searchNearby(
                      destinationName,
                      userLocation.latitude,
                      userLocation.longitude)),
                  child: Text(
                    'Search Carparks',
                    style: TextStyle(color: Colors.black),
                  )),
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
    );
  }
}
