import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/tab_screen.dart';
import '../../screens/information_screen.dart';
import '../../screens/splash_screen.dart';

/// Handles the transition from InformationScreen to TabScreen.
class SignInTransition extends StatefulWidget {
  @override
  _SignInTransitionState createState() => _SignInTransitionState();
}

class _SignInTransitionState extends State<SignInTransition> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// Checks if user has seen the information screen before.
  Future<bool> _getSeenInfoBefore() async {
    final SharedPreferences prefs = await _prefs;
    return (prefs.getBool('seenInfoBefore') ?? false);
  }

  /// Saves that the user has seen the information screen before.
  Future<void> _setSeenInfoBefore() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('seenInfoBefore', true);
    setState(() {}); //* Rebuild the widget to transition to TabScreen.
  }

  /// Transitions to TabScreen.
  void handleTransition() {
    _setSeenInfoBefore();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _getSeenInfoBefore(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          var seenInfoBefore = snapshot.data;
          return seenInfoBefore
              ? TabScreen()
              : InformationScreen(
                  onClose: handleTransition,
                );
        } else {
          return SplashScreen();
        }
      },
    );
  }
}
