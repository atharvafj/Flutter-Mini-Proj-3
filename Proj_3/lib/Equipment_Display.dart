//How each equipment will be displayed on dropdownScreen
import 'package:flutter/material.dart';
import './Equipment_Info_Screen.dart';
class EquipmentDisplay extends StatelessWidget {
  final String title;
  final List<String> imageUrl;
  final List<String> description;
  EquipmentDisplay({this.title, this.imageUrl, this.description});

  void displayItemInfo(BuildContext ctx){
    Navigator.of(ctx).pushNamed(EquipmentInfoScreen.routeName,
    arguments: {
      "title": title,
      //"imageUrl": imageUrl[0],
      //"description": description[0],
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => displayItemInfo(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            title, style: TextStyle(color: Colors.black, fontSize: 16),),
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