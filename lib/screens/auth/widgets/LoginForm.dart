import 'package:flutter/material.dart';
import 'package:flutter_starter/screens/auth/widgets/LoginButton.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please Enter a valid Email address.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                return _validateEmail(value);
              },
              decoration: InputDecoration(
                  labelText: "Email", hintText: "user@email.com"),
            ),
            TextFormField(
              decoration:
                  InputDecoration(hintText: "Password", labelText: 'Password'),
              obscureText: true,
            ),
            LoginButton()
          ],
        ));
  }
}
