import 'package:carparkley/screens/google_maps_directions_screen.dart';
import 'settings_screen.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';
import 'package:flutter/material.dart';

class CarparkInfo extends StatefulWidget {
  CarparkInfo({this.carparkInformation, this.cpName, this.cpInfo});

  final carparkInformation;
  final cpName;
  final cpInfo;
  static String id = "caparkInfo_screen";
  @override
  _CarparkInfoState createState() => _CarparkInfoState();
}

class _CarparkInfoState extends State<CarparkInfo> {
  @override
  Widget build(BuildContext context) {
    List carparkInformation = widget.carparkInformation;
    List cpInfo = widget.cpInfo;
    String cpName = widget.cpName.toString();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("CARPARK INFO"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 30.0),
                        child: Container(
                          width: 5,
                          child: Icon(Icons.keyboard_return),
                        ),
                      ),
                      GestureDetector(
                        child: Text('return'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 30, 0),
                        child: Text(
                          cpName.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Regular',
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Container(
                    child: Text(
                      'Address: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ),
                Text(
                  cpInfo[0],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Regular',
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Container(
                    child: Text(
                      'Parking System: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ),
                Text(
                  carparkInformation[2],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Regular',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Container(
                    child: Text(
                      'Total Lots: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ),
                Text(
                  carparkInformation[9],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Regular',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Container(
                    child: Text(
                      'Empty Lots: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ),
                Text(
                  cpInfo[1],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Regular',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    child: Text(
                      'Rates/hr: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Weekday rates' + ' ' + carparkInformation[1],
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    Text(
                      'Saturday rates' + ' ' + carparkInformation[4],
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    Text(
                      'Sunday&PH rates' + ' ' + carparkInformation[6],
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    child: Text(
                      'Duration: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Weekday minimum: ' + carparkInformation[0],
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    Text(
                      'Saturday minimum: ' + carparkInformation[3],
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    Text(
                      'Sunday&PH minimum: ' + carparkInformation[5],
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(
                        child: Text(
                          'Timings: ',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Regular',
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Start time: ' + carparkInformation[7],
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    Text(
                      'End time: ' + carparkInformation[8],
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _userOptions(
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      'Save'),
                  _userOptions(
                      Icon(
                        Icons.share,
                        color: Colors.deepOrange,
                      ),
                      'Share'),
                  _userOptions(
                      Icon(
                        Icons.navigation_outlined,
                        color: Colors.lightBlue,
                      ),
                      'Navigate'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _userOptions(Icon icon, String option) {
    return FlatButton(
      color: Colors.deepPurpleAccent,
      onPressed: () {
        Navigator.pushNamed(context, GoogleMapsPage.id);
      },
      child: Container(
        height: 30,
        child: Row(
          children: [
            icon,
            Text(
              option,
              style: TextStyle(
                  fontFamily: 'Regular', color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
