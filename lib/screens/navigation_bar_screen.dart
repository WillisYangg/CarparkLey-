import 'package:carparkley/screens/favourites_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart' as homepage;
import 'login_register/login_page.dart';
import 'login_register/sign_out_page.dart';
import 'settings_screen.dart';

class Sidenav extends StatelessWidget {
  bool isloggedin;
  Sidenav(this.isloggedin);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('CarParkLeh?',
                style: TextStyle(color: Colors.red, fontSize: 21)),
          ),
          Divider(color: Colors.grey.shade400),
          ListTile(
            hoverColor: Colors.grey.shade400,
          ),
          ListTile(
            hoverColor: Colors.grey.shade400,
            onTap: () {
              if (isloggedin == false) {
                Navigator.pushNamed(context, LoginPage.id);
              } else {
                Navigator.pushNamed(context, SignOutPage.id);
              }
            },
            leading: Icon(
              Icons.person,
              color: Colors.black,
            ),
            title: Text("Account"),
          ),
          ListTile(
            hoverColor: Colors.grey.shade400,
            onTap: () {
              Navigator.pushNamed(
                  context, FavouritesPage.id); // need to change to favourite
            },
            leading: Icon(
              Icons.star_border_outlined,
              color: Colors.black,
            ),
            title: Text("Favourites"),
          ),
          ListTile(
            hoverColor: Colors.grey.shade400,
            onTap: () {
              Navigator.pushNamed(context, SettingsScreen.id);
            },
            leading: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: Text("Settings"),
          ),
        ],
      ),
    );
  }
}
