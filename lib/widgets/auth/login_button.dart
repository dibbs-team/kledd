import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:kledd/models/authenticationService.dart';

import '../../lang/my_localizations.dart';

class LoginButton extends StatelessWidget {
  final Function onLoginUser;
  final AuthenticationService authenticationService;

  LoginButton({
    @required this.onLoginUser,
    @required this.authenticationService,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    Widget buildLoginBotton() {
      switch (authenticationService) {
        case AuthenticationService.GOOGLE:
          return GoogleSignInButton(
            onPressed: onLoginUser,
            text: l10n.signInButtonText('Google'),
            centered: true,
          );
        case AuthenticationService.FACEBOOK:
          return FacebookSignInButton(
            onPressed: onLoginUser,
            text: l10n.signInButtonText('Facebook'),
            centered: true,
          );
        default:
          return Container();
      }
    }

    return Container(
      width: 300,
      padding: EdgeInsets.all(5),
      child: buildLoginBotton(),
    );
  }
}
