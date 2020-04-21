import 'package:flutter_starter/screens/auth/widgets/LoginForm.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: AlignmentDirectional(0.0, 0.0),
          padding: EdgeInsets.only(left: 48.0, right: 48.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}
