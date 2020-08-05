import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final Function onLoginUser;

  LoginButton({
    this.title,
    this.onLoginUser,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onLoginUser,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(title),
    );
  }
}
