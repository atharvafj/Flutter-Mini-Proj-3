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

  void animator() {
    setState(() {
      h = 250;
      w = 250;
    });
  }

  void stopAnimation() {
    setState(() {
      h = 0;
      w = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          //Image.network(imageUrl[0]),
          GestureDetector(
            onLongPress: animator,
            onLongPressUp: stopAnimation,
            child: InkWell(
              onTap: () => displayItemInfo(context),
              splashColor: Colors.indigo[900],
              borderRadius: BorderRadius.circular(15),
              child: Container(
                margin: EdgeInsets.all(5),
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Text(
                          widget.title,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.7, -0.6),
                    colors: [
                      Color.fromRGBO(173, 253, 162, 1),
                      Color.fromRGBO(11, 211, 243, 1)
                    ],
                    //begin: Alignment.topLeft,
                    //end: Alignment.bottomRight,
                    radius: 3.5,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            child: Image.network(
              widget.imageUrl[0],
              height: h,
              width: w,
            ),
            decoration: BoxDecoration(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
