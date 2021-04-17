//import 'dart:js';
import 'package:carparkley/screens/home_page.dart';
import 'package:carparkley/screens/login_register/verify_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginManager {
  FirebaseAuth auth = FirebaseAuth.instance;
  LoginManager(this.auth);
  void login(String password, String email, BuildContext context) async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print('Login successful!');

      if (user != null) {
        User u = auth.currentUser!;
        if (!u.emailVerified) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => VerifyPage('login')));
        } else if (u.emailVerified) {
          _showMyDialog(context);
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      switch (e.code) {
        case "invalid-email":
          {
            showError('Please write the email in the proper format.',
                'Invalid Email', context);
            break;
          }
        case "user-not-found":
          {
            showError(
                'This email is not registered.', 'Not Registered', context);
            break;
          }
        case "wrong-password":
          {
            showError('Password is wrong.', 'Invalid Password', context);
            break;
          }
      }
    }
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sucessful'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Login successful!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
          ],
        );
      },
    );
  }

  showError(String errormessage, String title, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(errormessage),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.grey;
                      return Colors.red; // Use the component's default.
                    },
                  ),
                ),
                child: Text("Try Again"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
