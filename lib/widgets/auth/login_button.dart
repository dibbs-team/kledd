import 'package:flutter/material.dart';

import '../../lang/my_localizations.dart';

class LoginButton extends StatelessWidget {
  final String service;
  final Function onLoginUser;

  LoginButton({
    this.service,
    this.onLoginUser,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return RaisedButton(
      onPressed: onLoginUser,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        l10n.signInButtonText(service),
      ),
    );
  }
}
