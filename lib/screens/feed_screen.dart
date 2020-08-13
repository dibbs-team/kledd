import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Building feed");
    return Scaffold(
      appBar: AppBar(
        title: Text("Feed Screen"),
      ),
      body: Center(
        child: Text("Feed Screen"),
      ),
    );
  }
}
