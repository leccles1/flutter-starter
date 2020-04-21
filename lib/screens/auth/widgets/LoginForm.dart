import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
                  labelText: "Email", hintText: "john.smith@gmail.com"),
            ),
            TextFormField(
              decoration:
                  InputDecoration(hintText: "Password", labelText: 'Password'),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                      Navigator.pushReplacementNamed(context, '/');
                }
              },
              child: Text("Login"),
            )
          ],
        ));
  }
}
