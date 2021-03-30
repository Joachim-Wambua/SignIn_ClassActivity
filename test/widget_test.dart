// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:signintest/setup/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  testWidgets('Check if LogIn Page has Email, Password and 2 buttons present',
      (WidgetTester tester) async {
    // Find LogIn Form Widgets by Key
    await tester.pumpWidget(LogIn());
    final emailField = find.byKey(Key("emailField"), skipOffstage: false);
    final passwordField = find.byKey(Key("passwordField"));
    final signUpButton = find.byKey(Key("sign-upField"));
    final signInButton = find.byKey(Key("sign-inField"));

    // Verify that the widgets exist
    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(signUpButton, findsOneWidget);
    expect(signInButton, findsOneWidget);
  });
}
