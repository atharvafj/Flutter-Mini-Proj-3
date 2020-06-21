import 'package:Proj_3/DATA.dart';
import 'package:Proj_3/Widgets/Equipment_Display.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import '../DATA.dart';
class SearchScreen extends StatelessWidget {
  Future<List<EquipmentItem>> search(String search) async {
  await Future.delayed(Duration(seconds: 2));
  //return List.generate(search.length, (int index) {
    return equipments.where((item)=>item.title.toLowerCase().contains(search)).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar(
            onSearch: search, 
            onItemFound: (EquipmentItem found, int _)
            {
              return EquipmentDisplay
              (
                title: found.title,
                imageUrl: found.imageUrl,
                description: found.description,
              );
            }
              ),
        ),
      ),
    );
  }
}
