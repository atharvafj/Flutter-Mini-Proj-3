//items will be displayed on basis of dropdown widget
import 'package:flutter/material.dart';
import './DATA.dart';
import './Equipment_Display.dart';
class DropdownScreen extends StatefulWidget {

  @override
  _DropdownScreenState createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  List<String> menuItems=[];
  String selectedId;
  List<EquipmentItem> availableEquip;
  void initState(){
    for (int i=0;i<Categories.length;i++)
    {
      menuItems.add(Categories[i].title);
      //print(menuItems);
    }
    selectedId="All";
    availableEquip=equipments;
    super.initState();
    }
    
    String valreq;
    void getval(String newValue){
      setState(() {
        dropdownValue=newValue;
        valreq=dropdownValue;
        selectedId=Categories.firstWhere((cat)=>cat.title.contains(valreq)).id;
        availableEquip=equipments.where((item)=>item.categoryId.contains(selectedId)).toList();
      });  
    }
  String dropdownValue="All";
  Widget displayer(int length){
    if(length!=0){return GridView(
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
    );}
    else {return Center(child: Text("Nothing to show here!"),);}
  }
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory Manager"),
      ),
      body: Container(
        height: 450,
        child: Column(
          children: <Widget>[
            Container(
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
                onChanged: getval,
                items: menuItems
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, textAlign: TextAlign.center,)
                  );
                }).toList(),
              ),
          ),
          displayer(availableEquip.length)
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
      ),
    );
  }
}