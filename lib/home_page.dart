import 'package:carparkley/login_register/login_page.dart';
import 'package:carparkley/login_register/register_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String id = "home_screen";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('CarparkLey?'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to CarparkLey?',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
                height: 20.0,
                width: 300.0,
                child: Divider(
                  color: Colors.red,
                )),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 107.0),
              child: RaisedButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.pushNamed(context, RegisterPage.id);
                },
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  title: Text('Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
            Card(
              //default card color is white
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 107.0),
              child: RaisedButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.id);
                },
                child: ListTile(
                  leading: Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                  title: Text('Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
