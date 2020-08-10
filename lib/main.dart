import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'screens/auth_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kledd',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapshot) {
          // Show splash screen while checking if user is signed in.
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }
          var signedIn = userSnapshot.hasData;
          return signedIn ? Scaffold() : AuthScreen();
        },
      ),
    );
  }
}
