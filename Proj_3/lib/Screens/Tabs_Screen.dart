//tabs screen to display 3 different tabs
import './dropdownScreen.dart';
import './mediaPlayerScreen.dart';
import './searchScreen.dart';
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
        backgroundColor: Color.fromRGBO(168, 218, 220, 1),
        onTap: selectPage,
        selectedItemColor: Color.fromRGBO(14, 25, 61, 1),
        unselectedItemColor: Color.fromRGBO(45, 123, 157, 1),
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