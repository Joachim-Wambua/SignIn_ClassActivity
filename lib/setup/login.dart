import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signintest/pages/login_success.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Stateful Widget to for Log In Authentication with Email
class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String userEmail, userPassword;
  final authenticateUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  App Title
        title: Text('Sign In with Email'),
      ),
      body: Column(
        children: [
          // Email Text Field
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              key: Key("emailField"),
              // Limiting Input type to only Email Addresses
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                // Font Awesome Package Icons for Flutter
                // Envelope for email
                icon: FaIcon(FontAwesomeIcons.envelope),
                hintText: 'Email',
              ),
              // Linking the Email variable created to our input value
              onChanged: (value) {
                setState(() {
                  userEmail = value.trim();
                });
              },
            ),
          ),
          // Password Text Field
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              key: Key("passwordField"),
              obscureText: true,
              decoration: InputDecoration(
                // Font Awesome Package Icons for Flutter
                // Key for password
                icon: FaIcon(FontAwesomeIcons.key),
                hintText: 'Password',
              ),
              // Linking the Password variable created to our input value
              onChanged: (value) {
                setState(() {
                  userPassword = value.trim();
                });
              },
            ),
          ),
          // Sign in Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  key: Key("sign-upField"),
                  child: Text('Sign Up'),
                  // When the button is pressed...
                  onPressed: () {
                    // Create user account on Firebase
                    authenticateUser.createUserWithEmailAndPassword(
                        email: userEmail, password: userPassword);
                    // Then move to LogIn Success Page
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LogInSuccess()));
                  }),
              ElevatedButton(
                  key: Key("sign-inField"),
                  child: Text('Sign In'),
                  // When the button is pressed...
                  onPressed: () {
                    // Authenticate user through firebase
                    authenticateUser.signInWithEmailAndPassword(
                        email: userEmail, password: userPassword);
                    // Then move to LogIn Success Page
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LogInSuccess()));
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
