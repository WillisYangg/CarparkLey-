import 'package:carparkley/carpark_info_screen.dart';
import 'package:flutter/material.dart';
import 'login_register/register_page.dart';
import 'login_register/login_page.dart';
import 'home_page.dart';
import 'settings_screen.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: HomePage(),
      initialRoute: HomePage.id,
      routes: {
        SettingsScreen.id: (context) => SettingsScreen(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        CarparkInfo.id: (context) => CarparkInfo(),
      },
    );
  }
}
