import 'package:flutter/material.dart';
import 'package:flutter_starter/screens/settings/widgets/user-card/UserCard.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Settings'),
          ),
          body: UserCard()
      ),
    );
  }
}
