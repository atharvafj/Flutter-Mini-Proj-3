//How each equipment will be displayed on dropdownScreen
import 'package:flutter/material.dart';
import '../Screens/Equipment_Info_Screen.dart';

class EquipmentDisplay extends StatefulWidget {
  final String title;
  final List<String> imageUrl;
  final List<String> description;
  EquipmentDisplay({this.title, this.imageUrl, this.description});

  @override
  _EquipmentDisplayState createState() => _EquipmentDisplayState();
}

class _EquipmentDisplayState extends State<EquipmentDisplay> {
  void displayItemInfo(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(EquipmentInfoScreen.routeName, arguments: {
      "title": widget.title,
      //"imageUrl": imageUrl[0],
      //"description": description[0],
    });
  }

  double h = 0;

  double w = 0;

  /*void animator() {
    setState(() {
      h = 250;
      w = double.infinity;
    });
  }

  void stopAnimation() {
    setState(() {
      h = 0;
      w = 0;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => displayItemInfo(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            /*ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child:*/
            Hero(tag: widget.title, child: Icon(Icons.info)),
            SizedBox(
              width: 5,
            ),
            Text(widget.title),
            /*),
            Positioned(
              bottom: 20,
              right: 10,
              child: Container(
                width: 300,
                color: Colors.black54,
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
