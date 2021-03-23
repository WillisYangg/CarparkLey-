import 'package:carparkley/carpark_info_screen.dart';
import 'package:flutter/material.dart';
import 'register_page.dart';
import 'rounded_input_field.dart';
import 'rounded_password_field.dart';

class LoginPage extends StatelessWidget {
  static String id = "login_screen";
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
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: 'Password',
              onChanged: (value) {},
            ),
            RaisedButton(
              onPressed: () {
                print('Login successful!');
                Navigator.pushNamed(context, CarparkInfo.id);
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
