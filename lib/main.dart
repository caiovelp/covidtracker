// ignore_for_file: prefer_const_constructors

import 'package:covidtracker/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: darkTheme,
    home: HomePage()
  ));
}

final darkTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFFE5E5E5),
);