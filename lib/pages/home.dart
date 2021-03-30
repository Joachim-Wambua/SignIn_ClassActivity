import 'package:flutter/material.dart';
import 'package:signintest/setup/login.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign In',
      theme: ThemeData(
        accentColor: Colors.orange,
        primarySwatch: Colors.blue,
      ),
      home: LogIn(),
    );
  }
}
