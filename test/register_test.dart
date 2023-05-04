import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/register.dart';

void main() {
  testWidgets('register ...', (tester) async {
    // TODO: Implement test
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));
    // checking for the appbar
    expect(find.byType(AppBar), findsNothing);
    final firstNameField = find.byKey(const ValueKey('firstNameField'));
    expect(firstNameField, findsOneWidget);
    final secondNameField = find.byKey(const ValueKey('SecondNameField'));
    expect(secondNameField, findsOneWidget);
    final emailField = find.byKey(const ValueKey('EmailField'));
    expect(emailField, findsOneWidget);
    final passwordField = find.byKey(const ValueKey('Password'));
    expect(passwordField, findsOneWidget);
    final confirmPasswordField = find.byKey(const ValueKey('ConfirmPassword'));
    expect(confirmPasswordField, findsOneWidget);
    final loginInPrompt = find.text('Already have an account? Login');
    expect(loginInPrompt, findsOneWidget);
    final signupButton = find.widgetWithText(ElevatedButton, "Register");
    expect(signupButton, findsOneWidget);
    // expect(find.byIcon(Icons.visibility), findsNWidgets(2));
  });
}
