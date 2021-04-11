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
  late String _email, _password, _reEnterPassword;

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
              onChanged: (value) {
                _reEnterPassword = value;
              },
            ),
            RaisedButton(
              onPressed: () async {
                if (_password != _reEnterPassword) {
                  showError('The Passwords do not match', 'Invalid Password');
                } else {
                  try {
                    UserCredential user =
                        await _auth.createUserWithEmailAndPassword(
                            email: _email, password: _password);
                    print('Registered');
                    if (user != null) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  } on FirebaseAuthException catch (e) {
                    print(e.code);
                    print(e.message);
                    switch (e.code) {
                      case "email-already-in-use":
                        {
                          showError('This email is already registered.',
                              'Invalid Email');
                          break;
                        }
                      case "invalid-email":
                        {
                          showError(
                              'Please write the email in the proper format.',
                              'Invalid Email');
                          break;
                        }
                      case "weak-password":
                        {
                          showError(
                              'Please use a password with more than 6 characters.',
                              'Weak Password');
                          break;
                        }
                    }
                  }
                }
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
