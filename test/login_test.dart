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
      final passwordInputElement = find.byKey(const ValueKey('Password'));
      expect(passwordInputElement, findsOneWidget);
      final welcomeText = find.text('Welcome Back\nLog into account');
      expect(welcomeText, findsOneWidget);
      
    });
  });
}
