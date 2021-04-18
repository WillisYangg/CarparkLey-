import 'package:carparkley/screens/home_page.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  static String id = "error_screen";
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No matches found! Please try again'),
            ElevatedButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.pushNamed(context, HomePage.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
