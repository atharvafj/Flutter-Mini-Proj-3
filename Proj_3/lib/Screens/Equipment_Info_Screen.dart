//This will be displayed after clicking on any equipment
import 'package:Proj_3/DATA.dart';
import 'package:flutter/material.dart';
class EquipmentInfoScreen extends StatelessWidget {
  static const routeName = '/Equipment_Info_SCreen';
   String title;
   EquipmentItem item;
  //EquipmentInfoScreen(this.title, this.imageUrl, this.description); We are getting args from below
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text, style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 250,
      width: 350,
      child: child,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final routeArgs=ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title=routeArgs["title"];
    final item = equipments.firstWhere((it) {
        return it.title==title;
      });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(46, 29, 78, 1),
        title: Text(item.title),
      ),
      backgroundColor: Color.fromRGBO(241, 250, 238, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                item.imageUrl[0],
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 5,),
            buildSectionTitle(context, 'Description'),
            //buildContainer(
              Container(
                height: 300,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                        color: Color.fromRGBO(178, 247, 239, 1),
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Text(item.description[index],
                            style: TextStyle(fontSize: 20),
                            )
                            ),
                      ),
                  itemCount: item.description.length,
                ),
              ),
            //),
          ],
        ),
      ),
    );
  }
}