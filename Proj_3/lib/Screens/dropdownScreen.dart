//items will be displayed on basis of dropdown widget
import 'package:flutter/material.dart';
import '../DATA.dart';
import '../Widgets/Equipment_Display.dart';

class DropdownScreen extends StatefulWidget {
  @override
  _DropdownScreenState createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  List<String> menuItems = [];
  String selectedId;
  List<EquipmentItem> availableEquip;
  void initState() {
    for (int i = 0; i < Categories.length; i++) {
      menuItems.add(Categories[i].title);
      //print(menuItems);
    }
    selectedId = "All";
    availableEquip = equipments;
    super.initState();
  }

  String valreq;
  void getval(String newValue) {
    setState(() {
      dropdownValue = newValue;
      valreq = dropdownValue;
      selectedId =
          Categories.firstWhere((cat) => cat.title.contains(valreq)).id;
      availableEquip = equipments
          .where((item) => item.categoryId.contains(selectedId))
          .toList();
      if (valreq == "All") {
        availableEquip = equipments;
      }
    });
  }

  String dropdownValue = "All";
  Widget displayer(int length) {
    if (length != 0) {
      return GridView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(25),
        children: availableEquip
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
          childAspectRatio: 5 / 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
      );
    } else {
      return Center(
        child: Text(
          "Nothing to show here!",
          style: TextStyle(fontSize: 20),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(46, 29, 78, 1),
        title: Text("Inventory Manager"),
      ),
      backgroundColor: Color.fromRGBO(241, 250, 238, 1),
      body:
          /*SingleChildScrollView(
        child: Container(
          height: 450,
          child:*/
          Column(
        children: <Widget>[
          Container(
            //width: double.infinity,
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              isExpanded: true,
              iconSize: 24,
              elevation: 16,
              style:
                  TextStyle(color: Color.fromRGBO(46, 29, 78, 1), fontSize: 18),
              underline: Container(
                height: 2,
                color: Color.fromRGBO(46, 29, 78, 1),
              ),
              onChanged: getval,
              items: menuItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                    ));
              }).toList(),
            ),
          ),
          Expanded(child: displayer(availableEquip.length)),
          /*GridView(
                shrinkWrap: true,
              padding: const EdgeInsets.all(25),
              children: availableEquip
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
     ),*/
        ],
      ),
      //),
      //),
    );
  }
}
