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
                  if (user != null) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                } catch (e) {
                  print(e);
                }
                print('Login successful!');
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
