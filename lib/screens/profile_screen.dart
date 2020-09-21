import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class ProfileScreen extends StatelessWidget {
  void signOut() {
    auth.FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
      ),
      body: Center(
        // TODO: Remove when profile screen is updated.
        child: RaisedButton(
          child: Text("Sign out"),
          onPressed: signOut,
        ),
      ),
    );
  }
}
