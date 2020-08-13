import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Building profile");
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
      ),
      body: Center(
        child: Text("Profile Screen"),
      ),
    );
  }
}
