// import 'food.dart';

// class Restaurant {
//   String name;
//   String waittime;
//   String label;
//   num score;
//   Map<String, List<Food>> menu;
//   // ignore: avoid_types_as_parameter_names
//   Restaurant(this.name, this.waittime, this.label, this.score, this.menu);

//   // ignore: non_constant_identifier_names
//   static List<Restaurant> generateRestaurant() {
//     return [
//       Restaurant('Kibandaski', '10-15 mins', 'Fast Food', 4.5, {
//         'Food': Food.generateFood(),
//         'Drinks': Food.generateDrinks(),
//       }),
//       Restaurant('Divine', '10-15 mins', 'Fast Food', 4.5, {
//         'Food': Food.generateFood(),
//         'Drinks': Food.generateDrinks2(),
//       }),
//       Restaurant('Scolars Cafe', '10-15 mins', 'Fast Food', 4.5, {
//         'Food': Food.generateFood(),
//         'Drinks': Food.generateDrinks(),
//       }),
//       Restaurant('Kibandaski', '10-15 mins', 'Fast Food', 4.5, {
//         'Food': Food.generateFood(),
//         'Drinks': Food.generateDrinks(),
//       }),
//       Restaurant('Kibandaski', '10-15 mins', 'Fast Food', 4.5, {
//         'Food': Food.generateFood(),
//         'Drinks': Food.generateDrinks(),
//       }),
//     ];
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'food.dart';

class Restaurant {
  String name;
  String waittime;
  String label;
  num score;
  Map<String, List<Food>> menu;

  Restaurant(this.name, this.waittime, this.label, this.score, this.menu);

  factory Restaurant.fromJson(Map<String, dynamic> json) {
  final menu = Map<String, List<Food>>.from(json['menu']);
  final menuEntries = menu.entries.map((entry) {
    final key = entry.key;
    final value = (entry.value as List).map((item) => Food.fromJson(item)).toList();
    return MapEntry(key, value);
  }).toList();
  return Restaurant(
    json['name'] as String,
    json['waittime'] as String,
    json['label'] as String,
    json['score'] as num,
    Map<String, List<Food>>.fromEntries(menuEntries as Iterable<MapEntry<String, List<Food>>>),
  );
}


  static Future<List<Restaurant>> fetchRestaurants() async {
    final restaurantsCollection =
        FirebaseFirestore.instance.collection('restaurants');
    final restaurantsSnapshot = await restaurantsCollection.get();
    final restaurantsDocs = restaurantsSnapshot.docs;

    final restaurants = restaurantsDocs.map((restaurantDoc) {
      final restaurantData = restaurantDoc.data();

      final foods = restaurantData['foods'];
      final drinks = restaurantData['drinks'];

      return Restaurant(
        restaurantData['name'],
        restaurantData['waittime'],
        restaurantData['label'],
        restaurantData['score'],
        {
          'Food': foods.map((foodData) => Food.fromJson(foodData)).toList(),
          'Drinks':
              drinks.map((drinkData) => Food.fromJson(drinkData)).toList(),
        },
      );
    }).toList();

    return restaurants;
  }

  // static String generateRestaurant() {}
}
