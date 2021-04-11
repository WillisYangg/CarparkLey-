import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOutPage extends StatefulWidget {
  static String id = "signout_screen";
  @override
  _SignOutPageState createState() => _SignOutPageState();
}

class _SignOutPageState extends State<SignOutPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Out'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 50.0,
            width: 200.0,
            child: RaisedButton(
              color: Colors.red,
              onPressed: () {
                _auth.signOut();
              },
              child: Row(children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                Text('Sign Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    )),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
