import 'package:flutter/material.dart';

import 'feed_screen.dart';
import 'upload_item_screen.dart';
import 'profile_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _tabs = <Widget>[
    FeedScreen(),
    UploadItemScreen(),
    ProfileScreen(),
  ];

  /// Switches tab.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_day),
            title: Text(""), // TODO: Add title (same as AppBar title).
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text(""), // TODO: Add title (same as AppBar title).
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(""), // TODO: Add title (same as AppBar title).
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
