import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signintest/setup/login.dart';

class LogInSuccess extends StatelessWidget {
  // Initialising a firebase authentication instance
  final authenticateUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log In Successful'),),
      body: Center(
        // Button to Log out
        child: RaisedButton(
          child: Text("Log Out"),
          // When Pressed
          onPressed: () {
            //Sign the user out
            authenticateUser.signOut();
            // Go back to the log in screen...
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LogIn()));
          },
        ),
      ),
    );
  }
}
