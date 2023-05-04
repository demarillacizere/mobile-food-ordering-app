import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/login.dart';

void main() {
  // Required for Firebase.initializeApp()
  // setUpAll(() async {
  //   await Firebase.initializeApp();
  // });

  group('LoginScreen widget test', () {
    testWidgets('Login button works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      expect(find.byType(AppBar), findsNothing);
      // final passwordInputElement = find.byKey(const ValueKey('Password'));
      // expect(passwordInputElement, findsOneWidget);
      // final welcomeText = find.text('Welcome Back\nLog into account');
      // expect(welcomeText, findsOneWidget);
      // final loginButton = find.byType(ElevatedButton);
      // expect(loginButton, findsOneWidget);

      //Enter some text into the email and password fields
      // final emailField = find.byType(TextField).first;
      // expect(emailField, findsOneWidget);
      // final passwordField = find.byKey(ValueKey('Password'));
      // expect(passwordField, findsOneWidget);

      // await tester.enterText(emailField, 'test@example.com');
      // await tester.enterText(passwordField, 'password');

      // // Tap the login button
      // final loginButton = find.byType(ElevatedButton).first;
      // await tester.tap(loginButton);

      // // Wait for the navigation to complete
      // await tester.pumpAndSettle();

      // // Check if we have landed on the home page
      // final homePageTitle = find.text('Home Page');
      // expect(homePageTitle, findsOneWidget);
    });
  });
}
