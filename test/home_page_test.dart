import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/home_page.dart';


import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:food_app/screens/home/home.dart';

// Mocking the classes needed to run the tests
class MockPageController extends Mock implements PageController {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  group('MyHomePage', () {
    late MyHomePage homePage;
    late MockPageController pageController;
    late MockCollectionReference collectionReference;

    setUp(() {
      pageController = MockPageController();
      collectionReference = MockCollectionReference();
      homePage = MyHomePage();
    });

    testWidgets('renders a Scaffold', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: homePage));

      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}
