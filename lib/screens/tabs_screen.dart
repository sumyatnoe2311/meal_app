import 'package:flutter/material.dart';
import './favourites_screen.dart';
import './categories_screen.dart';
import '../widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, dynamic>> _pages = [
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": FavouritesScreen(), "title": "Your Favourite"},
  ];
  int _selectedIndex = 0;
  void _selectedTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedTab,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white54,
          selectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favourite",
            ),
          ]),
    );
  }
}
