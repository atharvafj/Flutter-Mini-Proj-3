//tabs screen to display 3 different tabs
import 'package:Proj_3/dropdownScreen.dart';
import 'package:Proj_3/mediaPlayerScreen.dart';
import 'package:Proj_3/searchScreen.dart';
import 'package:flutter/material.dart';
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> pages=[
    DropdownScreen(),
    SearchScreen(),
    ChewieDemo()
  ];
  int selectedPageIndex=0;
  void selectPage(int index){
    setState(() {
      selectedPageIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: pages[selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange[700],
        onTap: selectPage,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.yellowAccent,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("Search")),
          BottomNavigationBarItem(icon: Icon(Icons.music_video), title: Text("Media Player")),
        ],
      ),
    );
  }
}