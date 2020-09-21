import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/auth_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/tab_screen.dart';
import 'screens/product_detail_screen.dart';
import 'lang/my_localizations.dart';
import 'lang/my_localizations_delegate.dart';

void main() {
  //* See https://stackoverflow.com/questions/57689492/flutter-unhandled-exception-servicesbinding-defaultbinarymessenger-was-accesse
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the initilization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // TODO: return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
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
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              backgroundColor: Color(0xfff1f9ff),
            ),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (ctx, userSnapshot) {
                // Show splash screen while checking if user is signed in.
                if (userSnapshot.connectionState == ConnectionState.waiting) {
                  return SplashScreen();
                }
                var signedIn = userSnapshot.hasData;
                return signedIn ? TabScreen() : AuthScreen();
              },
            ),
            routes: {
              ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        // TODO: return Loading();
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
