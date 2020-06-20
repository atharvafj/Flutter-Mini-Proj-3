//main file.
//leads to home which os dropdownScreen
import 'package:flutter/material.dart';
import './dropdownScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Inventory App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.greenAccent,
        canvasColor: Colors.yellow,
        textTheme: ThemeData.light().textTheme.copyWith(),
      ),
      home: DropdownScreen(),
    );
  }
}