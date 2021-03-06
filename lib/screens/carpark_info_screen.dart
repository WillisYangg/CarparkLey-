import 'package:carparkley/control/MessagingMgr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carparkley/services/favourites.dart';
import 'package:share/share.dart';

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
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    List carparkInformation = widget.carparkInformation;
    print('carparkInformation: $carparkInformation');
    List cpInfo = widget.cpInfo;
    print('cpInfo: $cpInfo');
    String cpName = widget.cpName.toString();
    print('cpName: $cpName');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text("CARPARK INFO"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50,
              child: Row(
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
                        Container(
                          child: GestureDetector(
                            child: Text('return'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Container(
                    child: Center(
                      child: Text(
                        cpName.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Regular',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
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
                Expanded(
                  child: Text(
                    cpInfo[0].toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
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
                  carparkInformation[2].toString(),
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
                  carparkInformation[9].toString(),
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
                  cpInfo[1].toString(),
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
                      'Weekday rates' + ' ' + carparkInformation[1].toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    Text(
                      'Saturday rates' + ' ' + carparkInformation[4].toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    Text(
                      'Sunday&PH rates' +
                          ' ' +
                          carparkInformation[6].toString(),
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
                      'Weekday minimum: ' + carparkInformation[0].toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Text(
                      'Saturday minimum: ' + carparkInformation[3].toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Text(
                      'Sunday&PH minimum: ' + carparkInformation[5].toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
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
                      'Start time: ' + carparkInformation[7].toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    Text(
                      'End time: ' + carparkInformation[8].toString(),
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
                  FlatButton(
                    color: Colors.deepPurpleAccent,
                    onPressed: () async {
                      if (auth.currentUser != null) {
                        final String uid = auth.currentUser!.uid;
                        print(uid);
                        final db = FavouritesDatabase(uid);
                        print("go to db");
                        db.updateUserData(cpInfo, cpName, carparkInformation);
                        _showMyDialog1();
                      } else
                        _showMyDialog2();
                    },
                    child: Container(
                      height: 30,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            'Save',
                            style: TextStyle(
                                fontFamily: 'Regular',
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FlatButton(
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      MessagingMgr().shareCarpark(cpName);
                    },
                    child: Container(
                      height: 30,
                      child: Row(
                        children: [
                          Icon(
                            Icons.share,
                            color: Colors.deepOrange,
                          ),
                          Text(
                            'Share',
                            style: TextStyle(
                                fontFamily: 'Regular',
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FlatButton(
                    color: Colors.deepPurpleAccent,
                    onPressed: () => MapsLauncher.launchQuery(cpInfo[0]),
                    child: Container(
                      height: 30,
                      child: Row(
                        children: [
                          Icon(
                            Icons.navigation_outlined,
                            color: Colors.lightBlue,
                          ),
                          Text(
                            'Navigate',
                            style: TextStyle(
                                fontFamily: 'Regular',
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog1() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Saving Sucessful'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This carpark as been saved to favourites!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog2() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Saving not successful'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please log in to be able to save carpark as favourites!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        );
      },
    );
  }
}
