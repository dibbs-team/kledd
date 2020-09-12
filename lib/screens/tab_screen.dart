import 'package:flutter/material.dart';

import 'feed_screen.dart';
import 'upload_product_screen.dart';
import 'profile_screen.dart';
import '../lang/my_localizations.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>(); //* For showing SnackBar.
  static const _uploadProductScreenIndex = 1;
  static const _profileScreenIndex = 2;
  var _selectedIndex = 0;

  static final List<Widget> _tabs = <Widget>[
    //! Modifying this list requires you to update index variables.
    FeedScreen(),
    null, //* Instead of UploadProductScreen.
    ProfileScreen(),
  ];

  /// Switches tab.
  void _onItemTapped(int index) async {
    if (index == _uploadProductScreenIndex) {
      //* The result shows if the upload was successful.
      final result = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => UploadProductScreen()));

      //* Result is null when the user aborts the upload process.
      if (result != null) {
        if (result) {
          // The upload was successful.
          setState(() {
            _selectedIndex = _profileScreenIndex; // Move to profile screen.
          });
        } else {
          // Something went wrong while uploading the product.
          final l10n = MyLocalizations.of(context);
          _showSnackbar(l10n.errorOccured);
        }
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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

  /// Shows a SnackBar with the given message.
  void _showSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
