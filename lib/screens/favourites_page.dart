import 'package:carparkley/services/favourites.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'carpark_info_screen.dart';
import 'package:flutter/cupertino.dart';

class FavouritesPage extends StatefulWidget {
  static String id = "favourites_screen";
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<dynamic> list = [];
  List<dynamic> list2 = [];
  List<dynamic> list3 = [];

  @override
  void initState() {
    // TODO: implement initState
    if (auth.currentUser == null) {
      _showMyDialog();
    } else {
      final String uid = auth.currentUser!.uid;
      print('uid is $uid');
      final favouritesDatabase = FavouritesDatabase(uid);
      favouritesDatabase.getUserList();
      list = favouritesDatabase.carparkInfoList;
      list2 = favouritesDatabase.carparkInformationList;
      list3 = favouritesDatabase.carparkNameList;
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    print(list3);
    print(list3.length);
    print(list);
    print(list.length);
    print(list2);
    print(list2.length);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Favourites"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        height: height,
        child: ListView.builder(
            itemCount: list3.length,
            itemBuilder: (context, index) {
              // print(list);
              // print(list.length);
              print(list3[index]);
              print(list[index].runtimeType);
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CarparkInfo(
                          carparkInformation: list2[index],
                          cpName: list3[index],
                          cpInfo: list[index])));
                },
                child: Card(
                    child: Text(
                  'Carpark ' + (index + 1).toString() + ": " + list3[index],
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )),
              );
            }),
      ),
    );
  }

  Future<void> _showMyDialog() async {
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
