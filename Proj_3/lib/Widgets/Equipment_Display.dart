//How each equipment will be displayed on dropdownScreen
import 'package:flutter/material.dart';
import '../Screens/Equipment_Info_Screen.dart';
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
    return Material(
          child: InkWell(
        onTap: () => displayItemInfo(context),
        splashColor: Color.fromRGBO(237, 41, 57, 1),
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Text(
              title, style: TextStyle(color: Colors.black, fontSize: 16),),
          ),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0.7, -0.6),
              colors: [Color.fromRGBO(168, 218, 220, 1), Color.fromRGBO(09, 12, 155, 1)],
              //begin: Alignment.topLeft,
              //end: Alignment.bottomRight,
              radius: 3.5,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}