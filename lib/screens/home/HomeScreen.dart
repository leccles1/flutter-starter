import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return choices.map((Choice choice) {
                    return PopupMenuItem<Choice>(
                        value: choice,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(choice.route);
                            },
                            child: Text(choice.title)));
                  }).toList();
                },
              ))
        ],
      ),
      body: Center(
        child: Container(child: Text("Home Screen")),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon, this.route});

  final String title;
  final IconData icon;
  final String route;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Settings', icon: Icons.settings, route: '/settings'),
  const Choice(title: 'Logout', icon: Icons.exit_to_app, route: '/auth')
];
