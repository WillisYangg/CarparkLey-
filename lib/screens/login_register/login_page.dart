import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../home_page.dart';
import '../home_page.dart';
import 'register_page.dart';
import 'register_page.dart';
import '../../components/rounded_input_field.dart';
import '../../components/rounded_password_field.dart';
import 'package:carparkley/control/LoginManager.dart';

class LoginPage extends StatefulWidget {
  static String id = "login_screen";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _email, _password;
  late LoginManager loginmanager = LoginManager(_auth);

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
              onPressed: () {
                loginmanager.login(_password, _email, context);
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
