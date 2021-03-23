import 'settings_screen.dart';
import 'package:flutter/cupertino.dart';

import 'main.dart';
import 'package:flutter/material.dart';

class CarparkInfo extends StatefulWidget {
  static String id = "caparkInfo_screen";
  @override
  _CarparkInfoState createState() => _CarparkInfoState();
}

class _CarparkInfoState extends State<CarparkInfo> {
  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.only(right: 120.0),
                  child: Container(
                    child: Center(
                      child: Text(
                        'CARPARK A',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Regular',
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
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
                )
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
                )
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
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Container(
                    child: Text(
                      'Empty Lots',
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    child: Text(
                      'Rates: ',
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    child: Text(
                      'Weekdays: ',
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    child: Text(
                      'Saturday: ',
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    child: Text(
                      'Sunday: ',
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    child: Text(
                      'Public Holidays: ',
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
            Container(
              height: 150,
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
        Navigator.pushNamed(context, SettingsScreen.id);
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
