import 'package:flutter/material.dart';
import 'login_register/register_page.dart';
import 'login_register/login_page.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text('CarparkLey?'),
          backgroundColor: Colors.red,
        ),
        body: CarparkPage(),
      ),
    ),
  );
}

class CarparkPage extends StatefulWidget {
  @override
  _CarparkPageState createState() => _CarparkPageState();
}

class _CarparkPageState extends State<CarparkPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisterPage();
                    },
                  ),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
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
    );
  }
}
