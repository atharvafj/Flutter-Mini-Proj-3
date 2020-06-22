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
        text,
        style: Theme.of(context).textTheme.headline6,
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
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                item.imageUrl[0],
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Desccription'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(item.description[index])),
                    ),
                itemCount: item.description.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}