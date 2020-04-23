import 'package:flutter/material.dart';
import 'package:flutter_starter/services/auth/firebase/GoogleAuthService.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        googleAuthService
            .googleSignIn()
            .then((user) => Navigator.of(context).pushReplacementNamed('/'));
      },
      color: Colors.white,
      textColor: Colors.black,
      child: Text('Login with Google'),
    );
  }
}
