import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/auth/login_button.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(50),
          child: Align(
            alignment: Alignment.center,
            child: LoginButton(
              title: 'Sign in with Google',
              onLoginUser: _handleGoogleSignIn,
            ),
          ),
        ),
      ),
    );
  }

  /// Signs in a user using Google.
  Future<void> _handleGoogleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;

    await saveUser(user);
  }
}

/// Saves user information to Firestore.
Future<void> saveUser(FirebaseUser user) async {
  Firestore.instance.collection('users').document(user.uid).setData(
    {
      'display_name': user.displayName,
      'email': user.email,
      'profile_image_url': user.photoUrl,
      'phone_number': user.phoneNumber,
    },
  );
}
