import 'package:flutter/material.dart';

const kTextfieldInputDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: 'Enter Destination Name',
    hintStyle: TextStyle(color: Colors.grey));
