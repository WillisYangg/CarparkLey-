import 'package:carparkley/screens/login_register/verify_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationManager {
  FirebaseAuth auth = FirebaseAuth.instance;

  RegistrationManager(this.auth);

  void register(String password, String email, String reEnterPassword,
      BuildContext context) async {
    if (password != reEnterPassword) {
      showError('The Passwords do not match', 'Invalid Password', context);
    } else {
      try {
        UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print('Registered');
        if (user != null) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => VerifyPage('register')));
        }
      } on FirebaseAuthException catch (e) {
        print(e.code);
        print(e.message);
        switch (e.code) {
          case "email-already-in-use":
            {
              showError('This email is already registered.', 'Invalid Email',
                  context);
              break;
            }
          case "invalid-email":
            {
              showError('Please write the email in the proper format.',
                  'Invalid Email', context);
              break;
            }
          case "weak-password":
            {
              showError('Please use a password with more than 6 characters.',
                  'Weak Password', context);
              break;
            }
        }
      }
    }
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
