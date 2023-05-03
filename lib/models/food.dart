// class Food {
//   String name;
//   String price;
//   String description;
//   String image;
//   bool highlight;
//   Food(this.name, this.price, this.description, this.image,
//       {this.highlight = false});

//   static List<Food> generateFood() {
//     return [
//       Food(
//           'Chapati',
//           '50',
//           'Chapati is a form of roti, a round flatbread made with whole wheat flour.',
//           'assets/images/chapati.jpg'),
//       Food(
//           'Ugali',
//           '50',
//           'Ugali is a type of cornmeal porridge made in Africa.',
//           'assets/images/ugali.jpg'),
//       Food(
//           'Mandazi',
//           '50',
//           'Mandazi is a form of fried bread that originated on the Swahili Coast.',
//           'assets/images/mandazi.jpg'),
//       Food(
//           'Chips',
//           '50',
//           'Chips are slices of potato that have been deep-fried, baked, kettle-cooked, or popped until crunchy.',
//           'assets/images/chips.jpg'),
//       Food(
//           'Samosa',
//           '50',
//           'Samosa is a fried or baked pastry with a savoury filling, such as spiced potatoes, onions, peas, cheese, beef and other meats, or lentils.',
//           'assets/images/samosa.jpg'),
//       Food(
//           'Mukimo',
//           '50',
//           'Mukimo is a traditional Kenyan dish. It is made from maize, beans and pumpkin leaves.',
//           'assets/images/mukimo.jpg'),
//     ];
//   }

//   static List<Food> generateDrinks() {
//     return [
//       Food(
//           'Soda',
//           '50',
//           'Soda is a beverage that typically contains carbonated water, a sweetener, and a natural or artificial flavoring.',
//           'assets/images/soda.jpg'),
//       Food(
//           'Water',
//           '50',
//           'Water is a transparent, tasteless, odorless, and nearly colorless chemical substance, which is the main constituent of Earths hydrosphere and the fluids of all known living organisms.',
//           'assets/images/water.jpg'),
//       Food(
//           'Juice',
//           '50',
//           'Juice is a drink made from the extraction or pressing of the natural liquid contained in fruit and vegetables.',
//           'assets/images/juice.jpg'),
//       Food(
//           'Milk',
//           '50',
//           'Milk is a nutrient-rich liquid food produced by the mammary glands of mammals.',
//           'assets/images/milk.jpg'),
//       Food(
//           'Tea',
//           '50',
//           'Tea is an aromatic beverage commonly prepared by pouring hot or boiling water over cured or fresh leaves of the Camellia sinensis, an evergreen shrub native to East Asia.',
//           'assets/images/tea.jpg'),
//       Food(
//           'Coffee',
//           '50',
//           'Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species.',
//           'assets/images/coffee.jpg'),
//     ];
//   }

//   static List<Food> generateDrinks2() {
//     return [
//       Food(
//           'Sodas',
//           '50',
//           'Soda is a beverage that typically contains carbonated water, a sweetener, and a natural or artificial flavoring.',
//           'assets/images/soda.jpg'),
//       Food(
//           'Water',
//           '50',
//           'Water is a transparent, tasteless, odorless, and nearly colorless chemical substance, which is the main constituent of Earths hydrosphere and the fluids of all known living organisms.',
//           'assets/images/water.jpg'),
//       Food(
//           'Juice',
//           '50',
//           'Juice is a drink made from the extraction or pressing of the natural liquid contained in fruit and vegetables.',
//           'assets/images/juice.jpg'),
//       Food(
//           'Milk',
//           '50',
//           'Milk is a nutrient-rich liquid food produced by the mammary glands of mammals.',
//           'assets/images/milk.jpg'),
//       Food(
//           'Tea',
//           '50',
//           'Tea is an aromatic beverage commonly prepared by pouring hot or boiling water over cured or fresh leaves of the Camellia sinensis, an evergreen shrub native to East Asia.',
//           'assets/images/tea.jpg'),
//       Food(
//           'Coffee',
//           '50',
//           'Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species.',
//           'assets/images/coffee.jpg'),
//     ];
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  String name;
  String price;
  String description;
  String image;
  bool highlight;

  Food(this.name, this.price, this.description, this.image,
      {this.highlight = false});

  static Future<List<Food>> fetchFoodsFromFirebase() async {
    final foods = <Food>[];
    final snapshot = await FirebaseFirestore.instance.collection('foods').get();

    for (final doc in snapshot.docs) {
      final data = doc.data();
      final food = Food(
        data['name'],
        data['price'],
        data['description'],
        data['image'],
        highlight: data['highlight'] ?? false,
      );
      foods.add(food);
    }

    return foods;
  }

  static fromJson(foodData) {}
}
