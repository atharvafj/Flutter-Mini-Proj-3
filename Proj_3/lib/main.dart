//main file.
//leads to home which os dropdownScreen
import 'package:Proj_3/Equipment_Info_Screen.dart';
import 'package:Proj_3/Tabs_Screen.dart';
import 'package:flutter/material.dart';


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
      home: TabsScreen(),
      routes: {
        EquipmentInfoScreen.routeName: (ctx)=> EquipmentInfoScreen(),
      },
    );
  }
}