import 'package:carparkley/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'carpark_info_screen.dart';
import 'home_page.dart';

class SettingsScreen extends StatefulWidget {
  static String id = "settings_screen";

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

String vehicleValue = 'Car';
String fontValue = '25';
String language = 'English';

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SETTINGS"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 50, 0, 30),
            child: Container(
              child: Row(
                children: [
                  Text(
                    'Vehicle Type',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: 25),
                  ),
                  SizedBox(
                    width: 15,
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.lime,
                      value: vehicleValue,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        size: 50,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        width: 20,
                        height: 5,
                        color: Colors.deepPurple,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          vehicleValue = newValue!;
                        });
                      },
                      items: <String>['Car', 'MotorBike', 'Heavy']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 30),
            child: Container(
              child: Row(children: [
                Text(
                  'Font Size',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: DropdownButton<String>(
                    dropdownColor: Colors.lime,
                    value: fontValue,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      size: 50,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      width: 20,
                      height: 5,
                      color: Colors.deepPurple,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        fontValue = newValue!;
                      });
                    },
                    items: <String>['15', '20', '22', '25']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            value,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 50),
            child: Container(
              child: Row(children: [
                Text(
                  'Language',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  child: DropdownButton<String>(
                    dropdownColor: Colors.lime,
                    value: language,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      size: 50,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      width: 20,
                      height: 5,
                      color: Colors.deepPurple,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        language = newValue!;
                      });
                    },
                    items: <String>['English', 'Mandarin', 'Malay', 'Tamil']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            value,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ElevatedButton(
                    onPressed: () async {
                      _showMyDialog();
                    },
                    child: Text(
                      'Apply changes',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
          Expanded(child: Column()),
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Updated'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your changes have been saved'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

Future<String> checkWhatChanged() async {
  if (vehicleValue == 'MotorBike') {
    return 'M';
  } else if (vehicleValue == 'Heavy') {
    return 'H';
  } else {
    return 'C';
  }
}
