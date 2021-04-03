import 'package:carparkley/screens/login_register/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../home_page.dart';
import 'rounded_input_field.dart';
import 'rounded_password_field.dart';

class RegisterPage extends StatefulWidget {
  static String id = "register_screen";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
            RoundedPasswordField(
              // to do
              // not done
              hintText: 'Re-Enter Password',
              onChanged: (value) {},
            ),
            RaisedButton(
              onPressed: () async {
                try {
                  UserCredential user =
                      await _auth.createUserWithEmailAndPassword(
                          email: _email, password: _password);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                } catch (e) {
                  print(e);
                }
                print('Register');
              },
              child: Text('REGISTER'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already have and account? ',
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Sign In',
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
