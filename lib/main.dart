import 'package:flutter/material.dart';

import 'package:flutter_starter/screens/home/HomeScreen.dart';
import 'package:flutter_starter/screens/settings/SettingsScreen.dart';
import 'package:flutter_starter/screens/auth/AuthScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: AuthScreen(),
      initialRoute: '/auth',
      routes: {
        '/': (context) => HomeScreen(),
        '/auth': (context) => AuthScreen(),
        '/settings': (context) => SettingsScreen()
      },
    );
  }
}