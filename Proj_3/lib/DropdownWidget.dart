import 'package:flutter/material.dart';
import './DATA.dart';

class DropdownWidget extends StatefulWidget {
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  List<String> menuItems=[];
  void initState(){
    for (int i=0;i<Categories.length;i++)
    {
      menuItems.add(Categories[i].title);
      //print(menuItems);
    }
    super.initState();
    }


  String dropdownValue="All";
  @override
  Widget build(BuildContext context) {
    return Container(
          //width: double.infinity,
          child: DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                isExpanded: true,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: menuItems
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, textAlign: TextAlign.center,)
                  );
                }).toList(),
              ),
          );
      
    
    
  }
}