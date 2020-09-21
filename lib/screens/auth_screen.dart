import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kledd/models/authentication_service.dart';

import '../widgets/auth/login_button.dart';
import '../lang/my_localizations.dart';
import '../utils/show_snackbar.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _googleSignIn = GoogleSignIn();
  final _auth = auth.FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>(); //* For showing SnackBar.

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/yourLogoHere.png'),
                  fit: BoxFit.fill,
                ),
              ),
              width: 200,
              height: 200,
            ),
            LoginButton(
              authenticationService: AuthenticationService.GOOGLE,
              onLoginUser: () {
                _handleGoogleSignIn().catchError(
                  (e) => showSnackbar(
                    key: _scaffoldKey,
                    message: l10n.authFailed,
                  ),
                );
              },
            ),
            LoginButton(
              authenticationService: AuthenticationService.FACEBOOK,
              onLoginUser: () {
                // TODO: Login with Facebook (issue #6)
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Signs in a user using Google.
  Future<void> _handleGoogleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = auth.GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final user = (await _auth.signInWithCredential(credential)).user;

    await _saveUser(user);
  }

  /// Saves user information to Firestore.
  Future<void> _saveUser(auth.User user) async {
    FirebaseFirestore.instance.collection('users').doc(user.uid).set(
      {
        'display_name': user.displayName,
        'email': user.email,
        'profile_image_url': user.photoURL,
        'phone_number': user.phoneNumber,
      },
    );
  }
}
