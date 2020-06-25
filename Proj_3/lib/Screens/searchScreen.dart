import 'package:Proj_3/DATA.dart';
import 'package:Proj_3/Widgets/Equipment_Display.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import '../DATA.dart';

class SearchScreen extends StatelessWidget {
  Future<List<EquipmentItem>> search(String search) async {
    await Future.delayed(Duration(seconds: 1));
    //return List.generate(search.length, (int index) {
    return equipments
        .where(
            (item) => item.title.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: Color.fromRGBO(46, 29, 78, 1),),

      backgroundColor: Color.fromRGBO(241, 250, 238, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SearchBar(
                iconActiveColor: Color.fromRGBO(46, 29, 78, 1),
                onSearch: search,
                onItemFound: (EquipmentItem found, int _) {
                  return SingleChildScrollView(
                    child: EquipmentDisplay(
                      title: found.title,
                      imageUrl: found.imageUrl,
                      description: found.description,
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
