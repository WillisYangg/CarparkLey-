import 'package:carparkley/screens/carpark_info_screen.dart';
import 'package:carparkley/screens/settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../home_page.dart';
import '../home_page.dart';
import 'register_page.dart';
import 'register_page.dart';
import 'rounded_input_field.dart';
import 'rounded_password_field.dart';

class LoginPage extends StatefulWidget {
  static String id = "login_screen";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _email, _password;

  showError(String errormessage, String title) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedInputField(
              hintText: 'Email',
              onChanged: (value) {
                _email = value;
              },
            ),
            RoundedPasswordField(
              hintText: 'Password',
              onChanged: (value) {
                _password = value;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential user = await _auth.signInWithEmailAndPassword(
                      email: _email, password: _password);
                  print('Login successful!');
                  if (user != null) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                } on FirebaseAuthException catch (e) {
                  print(e.code);
                  switch (e.code) {
                    case "invalid-email":
                      {
                        showError(
                            'Please write the email in the proper format.',
                            'Invalid Email');
                        break;
                      }
                    case "user-not-found":
                      {
                        showError('This email is not registered., ',
                            'Not Registered');
                        break;
                      }
                    case "wrong-password":
                      {
                        showError('Password is wrong.', 'Invalid Password');
                        break;
                      }
                  }
                }
              },
              child: Text('LOGIN'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Don\'t have an Account? ',
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterPage.id);
                  },
                  child: Text(
                    'Sign Up Now!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
