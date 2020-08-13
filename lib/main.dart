import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/auth_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/tab_screen.dart';
import 'lang/my_localizations.dart';
import 'lang/my_localizations_delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => MyLocalizations.of(context).title,
      localizationsDelegates: [
        const MyLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English (default)
        const Locale('sv'), // Swedish
      ],
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
          return signedIn ? TabScreen() : AuthScreen();
        },
      ),
    );
  }
}
