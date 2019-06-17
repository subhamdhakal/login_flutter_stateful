import 'package:flutter/material.dart';
import 'package:login_stateful/src/screens/login_screen.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: "Log me in",
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
