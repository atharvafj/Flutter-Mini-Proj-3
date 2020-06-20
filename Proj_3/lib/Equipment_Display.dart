//How each equipment will be displayed on dropdownScreen
import 'package:flutter/material.dart';
class EquipmentDisplay extends StatelessWidget {
  final String title;
  EquipmentDisplay({this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            title, style: TextStyle(color: Colors.black, fontSize: 24),),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.amber],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}