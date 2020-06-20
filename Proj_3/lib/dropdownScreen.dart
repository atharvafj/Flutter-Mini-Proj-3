//items will be displayed on basis of dropdown widget
import 'package:flutter/material.dart';
import './DATA.dart';
import './Equipment_Display.dart';

class DropdownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory Manager"),
      ),
      body: GridView(
      padding: const EdgeInsets.all(25),
      children: equipments
          .map(
            (item) => EquipmentDisplay(
              title: item.title,
              imageUrl: item.imageUrl,
              description: item.description,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    ),
    );
  }
}